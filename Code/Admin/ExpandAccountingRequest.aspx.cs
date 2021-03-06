﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_ExpandAccountingRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList2.Items.Add("Processing");
            DropDownList2.Items.Add("Done");
            DropDownList1.Items.Add("Income");
            DropDownList1.Items.Add("Expenditure");
            DropDownList1.Items.Add("Audit");
            DropDownList1.Items.Add("Profit-Loss");
            DropDownList1.Items.Add("Assets");
            DropDownList1.Items.Add("Liabilities");
            ConsultationRequestClass c = ConnectionClass.GetRequestById(Session["id"].ToString(),"RqstAccouting");
            TextBox1.Text = c.RequestId.ToString();
            TextBox2.Text = c.UserName;
            TextBox3.Text = c.Name;
            TextBox4.Text = c.ConsultationTitle;
            TextBox5.Text = c.Deadline.ToString();
            TextBox6.Text = c.Description;
            DropDownList2.SelectedItem.Text = c.RequestStatus;
            DropDownList1.SelectedItem.Text = c.ConsultationType;
            ViewState["mail"] = c.Email;
            ViewState["file"] = c.UploadFile;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditAccountingRequest.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            if (FileUpload1.PostedFile.ContentType == "application/pdf")
            {
                try
                {
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/ResultFiles/Accounting/") + TextBox1.Text + ".pdf");
                }
                catch (Exception ex)
                {
                    lblError.Text = "File could not be uploaded" + ex.Message;
                }
            }
            else
            {
                lblError.Text = "File must be a PDF";
            }

            if (lblError.Text == "")
            {
                ConsultationRequestClass c = new ConsultationRequestClass(Convert.ToInt32(Session["id"]), TextBox3.Text, TextBox2.Text, ViewState["mail"].ToString(), TextBox4.Text, DropDownList1.SelectedItem.Text, Convert.ToDateTime(TextBox5.Text), TextBox6.Text, ViewState["file"].ToString(), DropDownList2.SelectedItem.Text, Session["id"].ToString());
                string result = ConnectionClass.UpdateRequest(c,"RqstAccouting");
                Label1.Text = result;
            }
            else
            {
                Label1.Text = "";
            }
        }
        
    }
}