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
    /// ���ڶ�ȡ��Ҫִ�е����ݿ�ű���
    /// ���Ҹ��ݰ�װ�����ṩ����Ϣ�������ݿ�ִ�нű�
    /// </summary>
    [RunInstaller(true)]
    public class Creator : Installer
    {
        #region Property
        /// <summary>
        /// ȷ���Ƿ������ڴ򲹶�
        /// </summary>
        public bool IsHoxfix = true;
        /// <summary>
        /// �Ƿ��ø��ӵķ�ʽ�������ݿ�
        /// </summary>
        public bool IsAttach = true;
        #endregion

        #region ��װ��ж��
        /// <summary>
        /// ��װ���ݿ�
        /// </summary>
        /// <param name="stateSaver">���ڱ����ύ�������ж�ز����������Ϣ</param>
        public override void Install(IDictionary stateSaver)
        {
            try
            {
                base.Install(stateSaver);

                //��ȡ�û��ṩ�����ݿ����
                string server = Context.Parameters["dbserver"];
                string userName = Context.Parameters["dbaccount"];
                string pwd = Context.Parameters["dbpassword"];
                string dbName = Context.Parameters["dbName"];
                //��ȡ��װĿ¼
                string setupDir = Context.Parameters["target"];
                //ƴ�����ݿ������ַ���
                string connStr = string.Format("server={0};User ID={1};Password={2};database=master;Connection Reset=True;Connection Timeout=1200",
                    server, userName, pwd);
                //����״̬��Ϣ����stateSaver
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
                MessageBox.Show("���ݿⰲװ������ϸ��Ϣ��" + ex.Message, "��װ����", MessageBoxButtons.OK);
            }
        }
        /// <summary>
        /// ж�����ݿ�
        /// </summary>
        /// <param name="savedState">���ڱ����ύ�������ж�ز����������Ϣ</param>
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
                        //ɾ��ǰȷ�ϣ���ֹ�����ɾ�����ݿ�
                        if (MessageBox.Show("����ɾ�����ݿ⣺ " + savedState["dbname"].ToString() +
                            "��\n��ȷ�����ݿⲻ��ʹ���С�\n�Ƿ������", "ɾ�����ݿ�ȷ��", MessageBoxButtons.YesNo,
                            MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.No)
                        {
                            return;
                        }
                        base.Uninstall(savedState);
                        //ɾ��ʱ����ʾ����ʾ��ϼ�ɾ�����ݿ�
                        string display = "����ɾ������\n";
                        display += savedState["dbname"].ToString() + " ���ݿ��Ѿ���";
                        display += " ������ " + savedState["server"].ToString().ToUpper() + "��ɾ����";
                        MessageBox.Show(display);
                        //��ȡɾ��ʱ��������ݿ����
                        string server = savedState["server"].ToString();
                        string userName = savedState["username"].ToString();
                        string pwd = savedState["password"].ToString();
                        string dbName = savedState["dbname"].ToString();
                        //ƴ�����ݿ������ַ���
                        string connStr = string.Format("server={0};User ID={1};Password={2};database=master;Connection Reset=FALSE",
                            server, userName, pwd);
                        DeleteDataBase(connStr, dbName);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("���ݿ�ɾ��������ϸ��Ϣ��" + ex.Message, "��װ����", MessageBoxButtons.OK);
            }
        }
        #endregion

        #region ˽�з���
        /// <summary>
        /// �������ݿ�
        /// </summary>
        /// <param name="connStr">���ݿ������ַ���</param>
        /// <param name="dbName">���ݿ�����</param>
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
                MessageBox.Show("����ʧ�ܣ���ϸ��Ϣ" + ex.Message);
            }
        }
        /// <summary>
        ///  �������ݿ�
        /// </summary>
        /// <param name="connStr">���ݿ������ַ���</param>
        /// <param name="dbName">Ŀ�����ݿ�</param>
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
        ///  ɾ�����ݿ�
        /// </summary>
        /// <param name="connStr">���ݿ������ַ���</param>
        /// <param name="dbName">Ŀ�����ݿ�</param>
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
        ///  �����ݿ�򲹶�
        /// </summary>
        /// <param name="connStr">���ݿ������ַ���</param>
        /// <param name="dbName">Ŀ�����ݿ�</param>
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
        /// ִ�����ݿ�ű�
        /// </summary>
        /// <param name="connStr">���ݿ������ַ���</param>
        /// <param name="dbName">Ŀ�����ݿ�</param>
        /// <param name="sqlText">Ҫִ�еĽű�</param>
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
        /// ִ�����ݿ�ű�
        /// </summary>
        /// <param name="conn">���ݿ�����</param>
        /// <param name="dbName">Ŀ�����ݿ�</param>
        /// <param name="sqlText">Ҫִ�еĽű�</param>
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
        /// ��ȡ��װ���ݿ���������нű�
        /// </summary>
        /// <returns></returns>
        private ArrayList GetSqlText()
        {
            ArrayList sqlText = new ArrayList();
            try
            {
                //�ҵ���ǰ�������ڵ�Ŀ¼
                System.Reflection.Assembly asm = System.Reflection.Assembly.GetExecutingAssembly();
                string configLoc = asm.Location;
                string strTemp = configLoc;
                //��λ������ĸ�Ŀ¼
                strTemp = strTemp.Remove(strTemp.LastIndexOf('\\'), strTemp.Length - strTemp.LastIndexOf('\\'));
                //string strTemp = "E:\\Projects\\DBSetup\\CreateDB";
                //��ȡ�����ű�
                FileInfo sqlCreate = new FileInfo(strTemp + "\\Scripts\\CreateScript.sql");
                StreamReader createReader = new StreamReader(sqlCreate.FullName, Encoding.ASCII);
                sqlText.Add(createReader.ReadToEnd());
                createReader.Close();
                //��ȡ��ʼ���ű�
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
