<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Colife.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel runat="server" ID="pHome">

       <asp:Label ID="title" runat="server" Text="Collife" ></asp:Label>
        <div class="container">
            <div class="row">
                <asp:TextBox ID="searchBar" runat="server"></asp:TextBox>
                <asp:Button ID="searchButton" runat="server" Text="search" />
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <asp:ImageButton ID="btnSports" runat="server" AlternateText="Sports" ImageUrl="Images\sports.jpg" />
                </div>
                <div class="col-md-6">
                    <asp:ImageButton ID="btnCampusLife" runat="server" AlternateText="CampusLife" ImageUrl="Images\campusLife.jpg" />
                </div>
            </div>
             <div class="row">
                <div class="col-md-6">
                    <asp:ImageButton ID="btnAcademics" runat="server" AlternateText="Sports" ImageUrl="Images\academics.jpg" />
                </div>
                <div class="col-md-6">
                    <asp:ImageButton ID="btnBudget" runat="server" AlternateText="CampusLife" ImageUrl="Images\budget.jpg" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <asp:ImageButton ID="btnCities" runat="server" AlternateText="Sports" ImageUrl="Images\cities.jpg" />
                </div>
                <div class="col-md-6">
                    <asp:ImageButton ID="btnType" runat="server" AlternateText="CampusLife" ImageUrl="Images\type.jpg" />
                </div>
            </div>
        </div>
        
       
    </asp:Panel>


</asp:Content>
