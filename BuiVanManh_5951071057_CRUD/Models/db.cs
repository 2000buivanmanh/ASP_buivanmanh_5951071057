using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace BuiVanManh_5951071057_CRUD.Models
{
    public class db
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-UML28IP\MSSQLSERVER01;Initial Catalog=demo1CRUD;Integrated Security=True");

        public DataSet Empget(Employee emp, out string msg)
        {
            DataSet ds = new DataSet();
            msg = "";
            try
           {
                SqlCommand cmd = new SqlCommand("Sp_Emloyee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Srno", emp.Srno);
                cmd.Parameters.AddWithValue("@EmpName", emp.EmpName);
                cmd.Parameters.AddWithValue("@City", emp.City);
                cmd.Parameters.AddWithValue("@State", emp.State);
                cmd.Parameters.AddWithValue("@Country", emp.Country);
                cmd.Parameters.AddWithValue("@Departmant", emp.Departmant);
                cmd.Parameters.AddWithValue("@Flag", emp.Flag);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                msg = "OK";
                return ds;
            }
            catch(Exception ex)
            {
                msg = ex.Message;
                return ds;
            }
        }
        public string Empdml(Employee emp, out string msg)
        {
            msg = "";
            try
            {
                SqlCommand cmd = new SqlCommand("Sp_Emloyee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Srno", emp.Srno);
                cmd.Parameters.AddWithValue("@EmpName", emp.EmpName);
                cmd.Parameters.AddWithValue("@City", emp.City);
                cmd.Parameters.AddWithValue("@State", emp.State);
                cmd.Parameters.AddWithValue("@Country", emp.Country);
                cmd.Parameters.AddWithValue("@Departmant", emp.Departmant);
                cmd.Parameters.AddWithValue("@Flag", emp.Flag);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                msg = "OK";
                return msg;

            }
            catch (Exception ex)
            {
                if(con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                msg = ex.Message;
                return msg;
            }

        }

        
    }

}
