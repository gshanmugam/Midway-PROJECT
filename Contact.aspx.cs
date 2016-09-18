using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;


public partial class Contact : Page
{
    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    SqlDataAdapter SqlAda;
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }
          private void LoadData()
        {
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SP_MidWays";
                    cmd.Parameters.Add(new SqlParameter("@pvchAction", SqlDbType.VarChar, 50));
                    cmd.Parameters["@pvchAction"].Value = "select";
                    cmd.Parameters.Add("@pIntErrDescOut", SqlDbType.Int).Direction = ParameterDirection.Output;
                    SqlAda = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    SqlAda.Fill(ds);
                    GridViewSample.DataSource = ds;
                    GridViewSample.DataBind();
                }
            }
        }

          protected void GridViewSample_PageIndexChanging(object sender, GridViewPageEventArgs e)
          {
              GridViewSample.PageIndex = e.NewPageIndex;
              LoadData();
          }

          protected void GridViewSample_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
          {
              GridViewSample.EditIndex = -1;
              LoadData();
          }

          protected void GridViewSample_RowEditing(object sender, GridViewEditEventArgs e)
          {
              GridViewSample.EditIndex = e.NewEditIndex;
              LoadData();
          }
          protected void GridViewSample_RowUpdating(object sender, GridViewUpdateEventArgs e)
          {
              Label MainworkID = (Label)GridViewSample.Rows[e.RowIndex].FindControl("lblMainworkID");
              TextBox MainDate = (TextBox)GridViewSample.Rows[e.RowIndex].FindControl("txtDate");
              TextBox MainTime = (TextBox)GridViewSample.Rows[e.RowIndex].FindControl("txtTime");
              TextBox WorksDescription = (TextBox)GridViewSample.Rows[e.RowIndex].FindControl("txtWorksDescription");
              TextBox EquipmentID = (TextBox)GridViewSample.Rows[e.RowIndex].FindControl("txtEquiID");

              TextBox Name = (TextBox)GridViewSample.Rows[e.RowIndex].FindControl("txtName");
              TextBox TimeTaken = (TextBox)GridViewSample.Rows[e.RowIndex].FindControl("txtTimeTaken");

              using (SqlConnection Sqlcon = new SqlConnection(strCon))
              {
                  using (SqlCommand cmd = new SqlCommand())
                  {
                      Sqlcon.Open();
                      cmd.Connection = Sqlcon;
                      cmd.CommandType = CommandType.StoredProcedure;
                      cmd.CommandText = "SP_Midways";

                      cmd.Parameters.Add(new SqlParameter("@pvchAction", SqlDbType.VarChar, 50));
                      cmd.Parameters.Add(new SqlParameter("@MainworkID", SqlDbType.Int));
                      cmd.Parameters.Add(new SqlParameter("@MainDate", SqlDbType.Date));
                      cmd.Parameters.Add(new SqlParameter("@MainTime", SqlDbType.Time));
                      cmd.Parameters.Add(new SqlParameter("@WorksDescription", SqlDbType.VarChar, 1500));
                      cmd.Parameters.Add(new SqlParameter("@EquipmentID", SqlDbType.Int));
                      cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.VarChar, 100));
                      cmd.Parameters.Add(new SqlParameter("@TimeTaken", SqlDbType.Int, 100));
                   
                      cmd.Parameters.Add("@pIntErrDescOut", SqlDbType.Int).Direction = ParameterDirection.Output;

                      cmd.Parameters["@pvchAction"].Value = "update";
                      cmd.Parameters["@MainworkID"].Value = Convert.ToInt32(MainworkID.Text.ToString());
                      cmd.Parameters["@MainDate"].Value =Convert.ToDateTime (MainDate.Text.TrimEnd ());
                      cmd.Parameters["@MainTime"].Value = Convert.  (MainTime.Text.ToString ());
                      cmd.Parameters["@WorksDescription"].Value = WorksDescription.Text.Trim();
                      cmd.Parameters["@EquipmentID"].Value =EquipmentID.Text.Trim ();
                      cmd.Parameters["@Name"].Value = Name.Text.Trim();
                      cmd.Parameters["@TimeTaken"].Value = TimeTaken.Text.Trim();
                     
                      cmd.ExecuteNonQuery();
                      int retVal = (int)cmd.Parameters["@pIntErrDescOut"].Value;

                  }
              }

              GridViewSample.EditIndex = -1;
              LoadData();
              lblMessage.Text = "Record updated successfully!";
          }

          protected void GridViewSample_RowDeleting(object sender, GridViewDeleteEventArgs e)
          {
              Label MainworkID = (Label)GridViewSample.Rows[e.RowIndex].FindControl("lblMainworkID");


              using (SqlConnection Sqlcon = new SqlConnection(strCon))
              {
                  using (SqlCommand cmd = new SqlCommand())
                  {
                      Sqlcon.Open();
                      cmd.Connection = Sqlcon;
                      cmd.CommandType = CommandType.StoredProcedure;
                      cmd.CommandText = "SP_MidWays";

                      cmd.Parameters.Add(new SqlParameter("@MainworkID", SqlDbType.Int));
                      cmd.Parameters.Add(new SqlParameter("@pvchAction", SqlDbType.VarChar, 50));
                
                      cmd.Parameters.Add("@pIntErrDescOut", SqlDbType.Int).Direction = ParameterDirection.Output;

                      cmd.Parameters["@pvchAction"].Value = "delete";
                      cmd.Parameters["@MainworkID"].Value = Convert.ToInt32(MainworkID.Text.ToString());
                
                      cmd.ExecuteNonQuery();
                      int retVal = (int)cmd.Parameters["@pIntErrDescOut"].Value;
                  }
              }

              GridViewSample.EditIndex = -1;
              LoadData();
              lblMessage.Text = "Record deleted successfully!";
          }


          protected void GridViewSample_RowCommand(object sender, GridViewCommandEventArgs e)
          {
              if (e.CommandName.Equals("Insert"))
              {
                  TextBox Date = (TextBox)GridViewSample.FooterRow.FindControl("txtDate");
                  TextBox Time = (TextBox)GridViewSample.FooterRow.FindControl("txtTime");
                  TextBox WorksDescription = (TextBox)GridViewSample.FooterRow.FindControl("txtWorksDescription");
                  TextBox Name = (TextBox)GridViewSample.FooterRow.FindControl("txtName");
                  TextBox Timetaken = (TextBox)GridViewSample.FooterRow.FindControl("txtTimetaken");

                  using (SqlConnection Sqlcon = new SqlConnection(strCon))
                  {
                      using (SqlCommand cmd = new SqlCommand())
                      {
                          Sqlcon.Open();
                          cmd.Connection = Sqlcon;
                          cmd.CommandType = CommandType.StoredProcedure;
                          cmd.CommandText = "SP_Midways";

                          cmd.Parameters.Add(new SqlParameter("@pvchAction", SqlDbType.VarChar, 50));
                          cmd.Parameters.Add(new SqlParameter("@MainDate", SqlDbType.Date ));
                          cmd.Parameters.Add(new SqlParameter("@MainTime", SqlDbType.Time ));
                        
                          cmd.Parameters.Add(new SqlParameter("@WorksDescription", SqlDbType.VarChar, 100));
                          cmd.Parameters.Add(new SqlParameter("@EquipmentID", SqlDbType.VarChar, 100));
                          cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.VarChar, 100));
                          cmd.Parameters.Add(new SqlParameter("@Timetake ", SqlDbType.VarChar, 100));
                          cmd.Parameters.Add("@pIntErrDescOut", SqlDbType.Int).Direction = ParameterDirection.Output;

                          cmd.Parameters["@pvchAction"].Value = "insert";
                          cmd.Parameters["@MainDate"].Value = Date.Text.Trim();
                          cmd.Parameters["@MainTime"].Value = Time.Text.Trim();
                          cmd.Parameters["@WorksDescription"].Value = WorksDescription.Text.Trim();
                          cmd.Parameters["@Name"].Value = Name.Text.Trim();
                          cmd.Parameters["@Timetake"].Value = Timetaken.Text.Trim();
                         
                          cmd.ExecuteNonQuery();
                          int retVal = (int)cmd.Parameters["@pIntErrDescOut"].Value;
                      }
                  }
                  GridViewSample.EditIndex = -1;
                  LoadData();
                  lblMessage.Text = "Record inserted successfully!";
              }
          }

     
}


