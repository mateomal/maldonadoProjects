<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Colife.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  

        <div class="jumbotron" style="margin-bottom:20px">
            <h1 class="text-center">Welcome to Collife</h1>          
             <div class="row text-center">
               <input class="form-control" runat="server" id="searchBar" placeholder="Search.."/>
            </div>
        </div>
           
        

        <div class="container">
            <div class="row text-center" style="margin-top:20px">
                <div class="col-md-6">
                    <div class="row">
                         <asp:ImageButton ID="btnAdmissions" runat="server" AlternateText="Sports" ImageUrl="Images\sports.jpg" OnClick="btnAdmissions_Click" />
                    </div>
                       
                    
                    <div class="row">
                        <asp:Label Text="Admissions" runat="server"></asp:Label>
                    </div>
                    
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <asp:ImageButton ID="btnCampusLife" runat="server" AlternateText="CampusLife" ImageUrl="Images\campusLife.jpg" OnClick="btnCampusLife_Click" />
                    </div>
                        
                    
                    <div class="row">
                        <asp:Label Text="Campus Life" runat="server"></asp:Label>
                    </div>
                    
                </div>
            </div>
             <div class="row text-center" style="margin-top:20px">
                <div class="col-md-6">
                    <div class="row">
                         <asp:ImageButton ID="btnAcademics" runat="server" AlternateText="Majors" ImageUrl="Images\academics.jpg" OnClick="btnAcademics_Click" />
                    </div>
                    <div class="row">
                         <asp:Label Text="Academics" runat="server"></asp:Label>
                    </div>
                   
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <asp:ImageButton ID="btnBudget" runat="server" AlternateText="CampusLife" ImageUrl="Images\budget.jpg" OnClick="btnBudget_Click" />
                    </div>
                    <div class="row">
                        <asp:Label Text="Budget" runat="server"></asp:Label>
                    </div>
                    
                </div>
            </div>
            <div class="row text-center" style="margin-top:20px">
                <div class="col-md-6">
                    <div class="row">
                         <asp:ImageButton ID="btnCities" runat="server" AlternateText="Sports" ImageUrl="Images\cities.jpg" OnClick="btnCities_Click" />
                    </div>
                   <div class="row">
                       <asp:Label Text="Location" runat="server"></asp:Label>
                   </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <asp:ImageButton ID="btnType" runat="server" AlternateText="CampusLife" ImageUrl="Images\type.jpg" OnClick="btnType_Click" />
                    </div>
                    <div class="row">
                        <asp:Label Text="Type" runat="server"></asp:Label>
                    </div>
                    
                </div>
            </div>
        </div>
        
       
   


</asp:Content>
