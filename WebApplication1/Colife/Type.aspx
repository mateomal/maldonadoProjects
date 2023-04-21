<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Type.aspx.cs" Inherits="Colife.Type" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h2 class="text-center">Type</h2>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu" aria-controls="#collapseMenu" aria-expanded="false">Level of Education</button>

            <div class="collapse" id="collapseMenu">
                <div class="card card-body text-left">
                    <asp:CheckBoxList ID="educationList" runat="server" CssClass="list-group-item text-left" ClientIDMode="Static" TextAlign="Left" AutoPostBack="false">
                        <asp:ListItem>Bachelors</asp:ListItem>
                        <asp:ListItem>Masters</asp:ListItem> 
                        <asp:ListItem>PhD</asp:ListItem>  
                    </asp:CheckBoxList>
                </div>
            </div>
        </div>
    </div>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">College Type</button>

            <div class="collapse" id="collapseMenu2">
                <div class="card card-body text-left">             
                    <asp:CheckBoxList ID="typeList" runat="server" CssClass="list-group-item text-left" ClientIDMode="Static" TextAlign="Left" AutoPostBack="false">
                        <asp:ListItem>Private</asp:ListItem>
                        <asp:ListItem>Public</asp:ListItem>                     
                    </asp:CheckBoxList>
                </div>
            </div>
        </div>
    </div>

    <div class="row text-center">
        <asp:Button runat="server" ID="btnClear" Text="Clear" />
        <asp:Button runat="server" ID="btnSearch" Text="Search" OnClick="btn_Search"/>
    </div>

    <div class="row">
        <asp:GridView ID="collegeTable" runat="server"></asp:GridView>
    </div>

</asp:Content>
