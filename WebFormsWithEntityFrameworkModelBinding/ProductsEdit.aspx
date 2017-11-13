<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductsEdit.aspx.cs" Inherits="WebFormsWithEntityFrameworkModelBinding.ProductsEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products Edit Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <header class="jumbotron"><h1>Web Form with Bootstrap using Entity Framework and ModelBinding</h1></header>
        <main class="row">
            <form id="form1" runat="server">
                <div class="col-sm-6 table-responsive">

                    <asp:GridView ID="grdProducts" runat="server" AutoGenerateColumns="false" DataKeyNames="ProductID" ItemType="WebFormsWithEntityFrameworkModelBinding.Models.Product" OnCallingDataMethods="Control_CallingDataMethods" SelectMethod="GetProducts" SelectedIndex="0" AllowSorting="true" AllowPaging="true"
                        PageSize="8" CssClass="table table-bordered table-striped table-condensed" OnPreRender="grdProducts_PreRender">

                        <Columns>
                            <asp:BoundField DataField="ProductID" HeaderText="ID"
                                ReadOnly="True" SortExpression="ProductID">
                                <ItemStyle CssClass="col-xs-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name"
                                SortExpression="Name">
                                <ItemStyle CssClass="col-xs-6" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <asp:Label runat="server"
                                        Text='<%# Item.Category.CategoryID %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="col-xs-3"></ItemStyle>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Link" ShowSelectButton="true">
                                <ItemStyle CssClass="col-xs-1" />
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle CssClass="bg-halloween" />
                        <PagerSettings Mode="NumericFirstLast" />
                        <PagerStyle CssClass="pagerStyle"
                            BackColor="#8c8c8c" HorizontalAlign="Center" />
                        <SelectedRowStyle CssClass="warning" />
                    </asp:GridView>

                    <div class="col-sm-6">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                            ShowModelStateErrors="true" CssClass="text-danger" />
                        <asp:DetailsView ID="dvProduct" runat="server" DataKeyNames="ProductID"
                            ItemType="WebFormsWithEntityFrameworkModelBinding.Models.Product"
                            OnCallingDataMethods="Control_CallingDataMethods"
                            SelectMethod="GetProduct" UpdateMethod="UpdateProduct"
                            InsertMethod="InsertProduct" DeleteMethod="DeleteProduct"
                            AutoGenerateRows="False" OnItemDeleted="dvProduct_ItemDeleted"
                            OnItemInserted="dvProduct_ItemInserted" OnItemUpdated="dvProduct_ItemUpdated"
                            CssClass="table table-bordered table-condensed">
                            <Fields>
                                <asp:TemplateField HeaderText="Product ID:">
                                    <EditItemTemplate>
                                        <asp:Label runat="server" ID="lblProductID"
                                            Text='<%# Item.ProductID %>'></asp:Label>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtProductID"
                                                Text='<%# BindItem.ProductID %>' MaxLength="10"
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblProductID"
                                            Text='<%# Item.ProductID %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="col-xs-4" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name:">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="txtName"
                                                Text='<%# BindItem.Name %>' MaxLength="50"
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtName"
                                                Text='<%# BindItem.Name %>' MaxLength="50"
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblName"
                                            Text='<%# Item.Name %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Short Description">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="txtShortDesc"
                                                Text='<%# BindItem.ShortDescription %>' MaxLength="250"
                                                TextMode="MultiLine" Rows="2"
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtShortDesc"
                                                Text='<%# BindItem.ShortDescription %>' MaxLength="250"
                                                TextMode="MultiLine" Rows="2"
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblShortDesc"
                                            Text='<%# Item.ShortDescription %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Long Description">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="txtLongDesc"
                                                Text='<%# BindItem.LongDescription %>' MaxLength="2000"
                                                TextMode="MultiLine" Rows="4"
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtLongDesc"
                                                Text='<%# BindItem.LongDescription %>' MaxLength="2000"
                                                TextMode="MultiLine" Rows="4"
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblLongDesc"
                                            Text='<%# Item.LongDescription %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category:">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:DropDownList runat="server" ID="ddlCategory"
                                                OnCallingDataMethods="Control_CallingDataMethods"
                                                SelectMethod="GetCategories"
                                                DataTextField="LongName" DataValueField="CategoryID"
                                                SelectedValue='<%# BindItem.CategoryID %>'
                                                CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:DropDownList runat="server" ID="ddlCategory"
                                                OnCallingDataMethods="Control_CallingDataMethods"
                                                SelectMethod="GetCategories"
                                                DataTextField="LongName" DataValueField="CategoryID"
                                                SelectedValue='<%# BindItem.CategoryID %>'
                                                CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblCategory"
                                            Text='<%# Item.CategoryID %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ImageFile">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="txtImageFile"
                                                Text='<%# BindItem.ImageFile %>' MaxLength="30"
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtImageFile"
                                                Text='<%# BindItem.ImageFile %>' MaxLength="30"
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblImageFile"
                                            Text='<%# Item.ImageFile %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Unit Price:">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="txtUnitPrice"
                                                Text='<%# BindItem.UnitPrice %>'
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtUnitPrice"
                                                Text='<%# BindItem.UnitPrice %>'
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblUnitPrice"
                                            Text='<%# Item.UnitPrice.ToString("c") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="On Hand:">
                                    <EditItemTemplate>
                                        <div class="col-xs-11 col-edit">
                                            <asp:TextBox runat="server" ID="txtOnHand"
                                                Text='<%# BindItem.OnHand %>'
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="col-xs-11 col-insert">
                                            <asp:TextBox runat="server" ID="txtOnHand"
                                                Text='<%# BindItem.OnHand %>'
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblOnHand"
                                            Text='<%# Item.OnHand %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Link"
                                    ShowDeleteButton="true"
                                    ShowEditButton="true"
                                    ShowInsertButton="true" />
                            </Fields>
                            <RowStyle BackColor="#e7e7e7" />
                            <CommandRowStyle BackColor="#8c8c8c" ForeColor="white" />
                        </asp:DetailsView>

                    </div>
            </form>
        </main>
    </div>
</body>
</html>
