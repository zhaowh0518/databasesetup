using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration.Install;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Collections;
using System.Windows.Forms;

namespace CreateDB
{
    /// <summary>
    /// 用于读取所要执行的数据库脚本，
    /// 并且根据安装界面提供的信息连接数据库执行脚本
    /// </summary>
    [RunInstaller(true)]
    public class Creator : Installer
    {
        #region Property
        /// <summary>
        /// 确定是否是用于打补丁
        /// </summary>
        public bool IsHoxfix = true;
        /// <summary>
        /// 是否用附加的方式创建数据库
        /// </summary>
        public bool IsAttach = true;
        #endregion

        #region 安装与卸载
        /// <summary>
        /// 安装数据库
        /// </summary>
        /// <param name="stateSaver">用于保存提交、会滚或卸载操作所需的信息</param>
        public override void Install(IDictionary stateSaver)
        {
            try
            {
                base.Install(stateSaver);

                //获取用户提供的数据库参数
                string server = Context.Parameters["dbserver"];
                string userName = Context.Parameters["dbaccount"];
                string pwd = Context.Parameters["dbpassword"];
                string dbName = Context.Parameters["dbName"];
                //获取安装目录
                string setupDir = Context.Parameters["target"];
                //拼接数据库连接字符串
                string connStr = string.Format("server={0};User ID={1};Password={2};database=master;Connection Reset=True;Connection Timeout=1200",
                    server, userName, pwd);
                //设置状态信息，即stateSaver
                stateSaver.Add("server", server);
                stateSaver.Add("username", userName);
                stateSaver.Add("password", pwd);
                stateSaver.Add("dbname", dbName);
                stateSaver.Add("target", setupDir);
                if (IsHoxfix)
                {
                    HotfixDB(connStr, dbName);
                }
                else
                {
                    if (IsAttach)
                    {
                        AttachDB(connStr, dbName);
                    }
                    else
                    {
                        CreateDataBase(connStr, dbName);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("数据库安装出错，详细信息：" + ex.Message, "安装错误", MessageBoxButtons.OK);
            }
        }
        /// <summary>
        /// 卸载数据库
        /// </summary>
        /// <param name="savedState">用于保存提交、会滚或卸载操作所需的信息</param>
        public override void Uninstall(IDictionary savedState)
        {
            try
            {
                if (savedState != null)
                {
                    if (IsHoxfix)
                    {
                        base.Uninstall(savedState);
                    }
                    else
                    {
                        //删除前确认，防止误操作删除数据库
                        if (MessageBox.Show("即将删除数据库： " + savedState["dbname"].ToString() +
                            "。\n请确认数据库不在使用中。\n是否继续？", "删除数据库确认", MessageBoxButtons.YesNo,
                            MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.No)
                        {
                            return;
                        }
                        base.Uninstall(savedState);
                        //删除时的提示，提示完毕即删除数据库
                        string display = "正在删除……\n";
                        display += savedState["dbname"].ToString() + " 数据库已经从";
                        display += " 服务器 " + savedState["server"].ToString().ToUpper() + "上删除！";
                        MessageBox.Show(display);
                        //获取删除时所需的数据库参数
                        string server = savedState["server"].ToString();
                        string userName = savedState["username"].ToString();
                        string pwd = savedState["password"].ToString();
                        string dbName = savedState["dbname"].ToString();
                        //拼接数据库连接字符串
                        string connStr = string.Format("server={0};User ID={1};Password={2};database=master;Connection Reset=FALSE",
                            server, userName, pwd);
                        DeleteDataBase(connStr, dbName);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("数据库删除出错，详细信息：" + ex.Message, "安装错误", MessageBoxButtons.OK);
            }
        }
        #endregion

        #region 私有方法
        /// <summary>
        /// 附加数据库
        /// </summary>
        /// <param name="connStr">数据库连接字符串</param>
        /// <param name="dbName">数据库名称</param>
        private void AttachDB(string connStr, string dbName)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connStr);
                StringBuilder sbSqlText = new StringBuilder();
                sbSqlText.Append(@" if (exists(select  * from sysdatabases");
                sbSqlText.Append(@" WHERE (sysdatabases.Name = '" + dbName + "')))");
                sbSqlText.Append(@" EXEC sp_detach_db '" + dbName + "', 'true'");

                sbSqlText.Append(@" EXEC sp_attach_db @dbname = N'" + dbName + "', ");
                sbSqlText.Append(@"@filename1 = N'" + Directory.GetFiles(Context.Parameters["target"].ToString() + "Files\\", "*.MDF")[0].ToString() + "', ");
                sbSqlText.Append(@"@filename2 = N'" + Directory.GetFiles(Context.Parameters["target"].ToString() + "Files\\", "*.LDF")[0].ToString() + "'");
                SqlCommand cmd = new SqlCommand(sbSqlText.ToString(), conn);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("附加失败，详细信息" + ex.Message);
            }
        }
        /// <summary>
        ///  创建数据库
        /// </summary>
        /// <param name="connStr">数据库连接字符串</param>
        /// <param name="dbName">目标数据库</param>
        private void CreateDataBase(string connStr, string dbName)
        {
            try
            {
                string strSureDB = string.Format("if not exists (select name from master..sysdatabases where name in ('{0}')) create database {1}",
                    dbName, dbName);
                ExecuteSql(connStr, "master", strSureDB);
                ArrayList sqlText = GetSqlText();
                string[] tempSqlList;
                for (int i = 0; i < sqlText.Count; i++)
                {
                    tempSqlList = System.Text.RegularExpressions.Regex.Split(sqlText[i].ToString(),
                        "[ \f\r\t\v]*GO[ \f\r\t\v]*\n", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
                    foreach (string sql in tempSqlList)
                    {
                        if (sql != "")
                        {
                            ExecuteSql(connStr, dbName, sql);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        ///  删除数据库
        /// </summary>
        /// <param name="connStr">数据库连接字符串</param>
        /// <param name="dbName">目标数据库</param>
        private void DeleteDataBase(string connStr, string dbName)
        {
            try
            {
                ExecuteSql(connStr, "master", "drop database " + dbName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        ///  给数据库打补丁
        /// </summary>
        /// <param name="connStr">数据库连接字符串</param>
        /// <param name="dbName">目标数据库</param>
        private void HotfixDB(string connStr, string dbName)
        {
            try
            {
                string path = Context.Parameters["target"].ToString() + "Scripts\\";
                string filePah = string.Empty;
                string sqlText = string.Empty;
                string[] fileList = Directory.GetFiles(path);
                for (int i = 1; i <= fileList.Length; i++)
                {
                    filePah = path + string.Format("\\{0}.sql", i);
                    if (File.Exists(filePah))
                    {
                        FileInfo sqlCreate = new FileInfo(filePah);
                        StreamReader createReader = new StreamReader(sqlCreate.FullName, Encoding.ASCII);
                        sqlText = createReader.ReadToEnd();
                        createReader.Close();
                        ExecuteSql(connStr, dbName, sqlText);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// 执行数据库脚本
        /// </summary>
        /// <param name="connStr">数据库连接字符串</param>
        /// <param name="dbName">目标数据库</param>
        /// <param name="sqlText">要执行的脚本</param>
        private void ExecuteSql(string connStr, string dbName, string sqlText)
        {
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sqlText, conn);
            try
            {
                if (cmd.Connection.State != ConnectionState.Open)
                    cmd.Connection.Open();
                cmd.Connection.ChangeDatabase(dbName);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        /// <summary>
        /// 执行数据库脚本
        /// </summary>
        /// <param name="conn">数据库连接</param>
        /// <param name="dbName">目标数据库</param>
        /// <param name="sqlText">要执行的脚本</param>
        private void ExecuteSql(SqlConnection conn, string dbName, string sqlText)
        {
            SqlCommand cmd = new SqlCommand(sqlText, conn);
            try
            {
                if (cmd.Connection.State != ConnectionState.Open)
                    cmd.Connection.Open();
                cmd.Connection.ChangeDatabase(dbName);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// 获取安装数据库所需的所有脚本
        /// </summary>
        /// <returns></returns>
        private ArrayList GetSqlText()
        {
            ArrayList sqlText = new ArrayList();
            try
            {
                //找到当前程序集所在的目录
                System.Reflection.Assembly asm = System.Reflection.Assembly.GetExecutingAssembly();
                string configLoc = asm.Location;
                string strTemp = configLoc;
                //定位到程序的根目录
                strTemp = strTemp.Remove(strTemp.LastIndexOf('\\'), strTemp.Length - strTemp.LastIndexOf('\\'));
                //string strTemp = "E:\\Projects\\DBSetup\\CreateDB";
                //读取创建脚本
                FileInfo sqlCreate = new FileInfo(strTemp + "\\Scripts\\CreateScript.sql");
                StreamReader createReader = new StreamReader(sqlCreate.FullName, Encoding.ASCII);
                sqlText.Add(createReader.ReadToEnd());
                createReader.Close();
                //读取初始化脚本
                FileInfo sqlData = new FileInfo(strTemp + "\\Scripts\\InitData.sql");
                StreamReader dataReader = new StreamReader(sqlData.FullName, Encoding.ASCII);
                sqlText.Add(dataReader.ReadToEnd());
                dataReader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return sqlText;
        }
        #endregion
    }
}
