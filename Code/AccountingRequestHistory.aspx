﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePostLogin.master" AutoEventWireup="true" CodeFile="AccountingRequestHistory.aspx.cs" Inherits="AccountingRequestHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="Button1" runat="server" Width="212" Height="50" CssClass="btn2" Text="⊲ REQUEST" onclick="Button1_Click" />
<asp:Button ID="Button2" runat="server" Width="212" Height="50" CssClass="btn2" Text="∇ HISTORY"  BackColor="#DAC2CF" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br />
&nbsp;
<a href="Accouting.aspx" style="font-size:small;color:#7a0c4a;text-decoration:none">Accounting »</a>
<span style="font-size:small;text-decoration:none">Accounting Request History</span>
<br />
&nbsp;----------------------------------------------------------------------------------------------------------------------
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
<br />
<br />
<span style="font-size:small;text-align:center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
        CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black" OnRowCommand="GridView1_RowCommand" CssClass="gridview">
        <Columns>
            <asp:BoundField DataField="requestId" HeaderText="ID" SortExpression="requestId" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="requestTitle" HeaderText="Request Title" 
                SortExpression="requestTitle" />
            <asp:BoundField DataField="requestType" HeaderText="Request Type" 
                SortExpression="requestType" />
            <asp:BoundField DataField="deadline" HeaderText="Deadline" 
                SortExpression="deadline" />
            <asp:BoundField DataField="requestStatus" HeaderText="Status" 
                SortExpression="requestStatus" />     
            <asp:TemplateField HeaderText="ClientFile">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DownloadClientFile" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">Download</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ResultFile">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="DownloadResultFile" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">Download</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    </span>
 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [requestId],[name], [requestTitle], [requestType], [deadline], [requestStatus], [uploadFile], [resultFile] FROM [RqstAccouting] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="login" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
<br />
<br /><br /><br />
</asp:Content>

