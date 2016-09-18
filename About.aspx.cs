using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls.WebParts;

using System.Web.UI.WebControls;


public partial class About : Page
{
    int pos;
    protected void Page_Load(object sender, EventArgs e)
    {
      //TextBox1.Text = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
     
        //ListBox1.Items.Add(TextBox1.Text);
        try
        {
            
            ListBox1.Items.Remove(TextBox1.Text);

            ListBox1.Items.Add(TextBox1.Text);
        }


        catch (Exception ex)
        {
            ListBox1.Items.Add(TextBox1.Text);
        }
    }

    protected void updateid_Click(object sender, EventArgs e)
    {
        //ropDownList1.SelectedItem.Value=TextBox1.Text.ToString ();
        //foreach (ListItem li in ListBox1.Items)
        //{
        //    if (li.Text.Equals(TextBox1.Text))  //find old text
        //    {
        //         //replace to new
        //    }
        //}
        pos = ListBox1.SelectedIndex;
        ListBox1.Items.Remove(ListBox1.SelectedItem.ToString());
        ListBox1.Items.Insert(pos, TextBox2.Text);
       
    }

    
    protected void deleteid_Click(object sender, EventArgs e)
     {
         ListBox1.Items.Remove(TextBox1.Text);
     
    }

    protected void ListBox1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        TextBox1.Text = ListBox1.SelectedItem.Text.ToString();
        TextBox2.Text = ListBox1.SelectedItem.Text.ToString();
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
}