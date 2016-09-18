<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>
    <div style="font-size:10px;font-family:Verdana">
        Sample - Editable Gridview Control
        <br />
    </div>
 
       <div>
          <asp:GridView ID="GridViewSample" runat="server" AutoGenerateColumns="False" Font-Names="Verdana"
            AllowPaging="True" ShowFooter="True"   Width="1%" OnPageIndexChanging="GridViewSample_PageIndexChanging"
            OnRowCancelingEdit="GridViewSample_RowCancelingEdit" OnRowEditing="GridViewSample_RowEditing"
            OnRowUpdating="GridViewSample_RowUpdating" 
            OnRowDeleting="GridViewSample_RowDeleting" OnRowCommand="GridViewSample_RowCommand" Height="16px">
            <FooterStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
            <PagerStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
            <HeaderStyle Height="30px" Font-Size="15px" BorderColor="#CCCCCC"
                BorderStyle="Solid" BorderWidth="1px" />
            <RowStyle Height="20px" Font-Size="13px" BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="1px" />
            <Columns>
                <asp:TemplateField HeaderText="MainworkID">
                     <ItemTemplate>
                        <asp:Label ID="lblMainworkID" runat="server" Text='<%# Eval("MainworkID") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lbladd" runat="server"></asp:Label>
                    </FooterTemplate>
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MainDate" HeaderStyle-Width="10%" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" Text='<%# Eval("MainDate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDate" runat="server" Text='<%# Eval("MainDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddDate" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqName" ValidationGroup="ValgrpCust" ControlToValidate="txtAddDate" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <HeaderStyle Width="15%"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MainTime" HeaderStyle-Width="15%" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lblTime" runat="server" Text='<%# Eval("MainTime") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTime" runat="server" Text='<%# Eval("MainTime") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddTime" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqAdd1" ValidationGroup="ValgrpCust" ControlToValidate="txtAddTime" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <HeaderStyle Width="15%"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="WorksDescription" HeaderStyle-Width="15%">
                    <ItemTemplate>
                        <asp:Label ID="lblWorksDescription" runat="server" Text='<%# Eval("WorksDescription") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtWorksDescription" runat="server" Text='<%# Eval("WorksDescription") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddWorksDescription" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqAdd2" ValidationGroup="ValgrpCust" ControlToValidate="txtAddWorksDescription" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <HeaderStyle Width="15%"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EquipmentID" HeaderStyle-Width="10%">
                    <ItemTemplate>
                        <asp:Label ID="lblEquiID" runat="server" Text='<%# Eval("EquipmentID") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEquiID" runat="server" Text='<%# Eval("EquipmentID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddEquiID" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqPhone" ValidationGroup="ValgrpCust" ControlToValidate="txtAddEquiID" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <HeaderStyle Width="10%"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" HeaderStyle-Width="15%">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqEmail" ValidationGroup="ValgrpCust" ControlToValidate="txtName" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <HeaderStyle Width="15%"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Timetaken">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTimetaken" runat="server" Text='<%# Eval("Timetaken") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtTimetaken" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTimetaken" runat="server" Text='<%# Eval("Timetaken") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit/Delete" HeaderStyle-Width="15%">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" Text="Edit" runat="server" CommandName="Edit" />
                        <span onclick="return confirm('Are you sure want to delete?')">
                            <asp:LinkButton ID="btnDelete" Text="Delete" runat="server" CommandName="Delete" />
                        </span>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="btnUpdate" Text="Update" runat="server" CommandName="Update" />
                        <asp:LinkButton ID="btnCancel" Text="Cancel" runat="server" CommandName="Cancel" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="btnInsertRecord" runat="server" Text="Add" ValidationGroup="ValgrpCust" CommandName="Insert" />
                    </FooterTemplate>
                    <HeaderStyle Width="15%"></HeaderStyle>
                </asp:TemplateField>
                <asp:BoundField />
                <asp:BoundField />
                <asp:BoundField />
                <asp:BoundField />
            </Columns>
        </asp:GridView>
            <br />
        <asp:Label ID="lblMessage" ForeColor="Green" Font-Bold="true" runat="server" Text=""></asp:Label>
      </div>
            <br />
            <br />
            <br />
            <br />
            <%: Title %>.</h1>
        <h2>Your contact page.</h2>
    </hgroup>

    <section class="contact">
        <header>
            <h3>Phone:</h3>
        </header>
        <p>
            <span class="label">Main:</span>
            <span>425.555.0100</span>
        </p>
        <p>
            <span class="label">After Hours:</span>
            <span>425.555.0199</span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Email:</h3>
        </header>
        <p>
            <span class="label">Support:</span>
            <span><a href="mailto:Support@example.com">Support@example.com</a></span>
        </p>
        <p>
            <span class="label">Marketing:</span>
            <span><a href="mailto:Marketing@example.com">Marketing@example.com</a></span>
        </p>
        <p>
            <span class="label">General:</span>
            <span><a href="mailto:General@example.com">General@example.com</a></span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Address:</h3>
        </header>
        <p>
            One Microsoft Way<br />
            Redmond, WA 98052-6399
        </p>
    </section>
</asp:Content>