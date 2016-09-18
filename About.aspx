<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>

    <article>
      
    </article>

    <aside>
        <h3>Aside Title</h3>
        <p>        
            Use this area to provide additional information.
        </p>
        <ul>
            <li><a runat="server" href="~/">Home</a></li>
            <li><a runat="server" href="~/About.aspx">Equipments</a></li>
            <li><a runat="server" href="~/Contact.aspx">MaintanenceWork</a></li>
        </ul>
    </aside>
     <asp:Label ID="Label1" runat="server" Text="Equipment Name"></asp:Label>

    &nbsp;:<br />

    <br />
    <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" Height="172px" Width="243px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged1">
        <asp:ListItem>Penatibus</asp:ListItem>
        <asp:ListItem>rhoncus</asp:ListItem>
        <asp:ListItem>tristique</asp:ListItem>
        <asp:ListItem>turpis</asp:ListItem>
        <asp:ListItem>tortor</asp:ListItem>
        <asp:ListItem>mauris</asp:ListItem>
        <asp:ListItem>vel</asp:ListItem>
        <asp:ListItem>massa</asp:ListItem>
        <asp:ListItem>non</asp:ListItem>
        <asp:ListItem>eu</asp:ListItem>
    </asp:ListBox>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Add /Delete /Update an Item from the List "></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" Width="171px"></asp:TextBox>
    <asp:Button ID="Addid" runat="server" OnClick="Button1_Click" Text="ADD" />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> <asp:Button ID="updateid" runat="server" Text="UPDATE" OnClick="updateid_Click" />
   
    <br />
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    <asp:Button ID="deleteid" runat="server" Text="DELETE" OnClick="deleteid_Click" />
    <asp:Button ID="btnclear" runat="server" OnClick="btnclear_Click" Text="Clear" />
    <br />
</asp:Content>