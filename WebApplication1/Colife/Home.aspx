<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Colife.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

        <div class="jumbotron" style="margin-bottom:20px">
            <h1 class="text-center">Welcome to Collife</h1>          
             <div class="row text-center">
               <input class="form-control" runat="server" id="searchBar" placeholder="Search.."/>
            </div>
        </div>
           
        

        <div class="container">
            <div class="row" style="margin-top:20px">
                <div class="col-sm-6">
                    <div class="card img-fluid">
                        <img src="Images\admissions.jpg" class="card-img-top" alt="...">
                        <div class="card-img-overlay">
                            <div class="card-body">                              
                                <a href="Admissions.aspx" class="card-link stretched-link"></a>
                                <p class="card-text text-center text-weight-bold align-middle" style="font-size:30px; vertical-align:middle">ADMISSIONS</p>
                            </div>
                            
                        </div>                        
                    </div>
                                           
                </div>
                <div class="col-sm-6">
                    <div class="card img-fluid">
                        <img src="Images\campusLife.jpg" class="card-img-top" alt="...">
                        <div class="card-img-overlay">
                            <div class="card-body">
                                <p class="card-text text-center text-weight-bold align-middle" style="font-size:30px; vertical-align:middle">CAMPUS LIFE</p>
                                <a href="CampusLife.aspx" class="card-link stretched-link"></a>
                            </div>
                            
                        </div>      

                    </div>
                                          
                </div>
            </div>
              <div class="row" style="margin-top:20px">
                <div class="col-sm-6">
                    <div class="card img-fluid">
                        <img src="Images\academics.jpg" class="card-img-top" alt="...">
                        <div class="card-img-overlay">
                            <div class="card-body">
                                <p class="card-text text-center text-weight-bold align-middle" style="font-size:30px; vertical-align:middle">ACADEMICS</p>
                                <a href="Majors.aspx" class="card-link stretched-link"></a>
                            </div>
                            
                        </div>                        
                    </div>
                                           
                </div>
                <div class="col-sm-6">
                    <div class="card img-fluid">
                        <img src="Images\budget.jpg" class="card-img-top" alt="...">
                        <div class="card-img-overlay">
                            <div class="card-body">
                                <p class="card-text text-center text-weight-bold align-middle" style="font-size:30px; vertical-align:middle">BUDGET</p>
                                <a href="Budget.aspx" class="card-link stretched-link"></a>
                            </div>                       
                        </div>      

                    </div>
                                          
                </div>
            </div>
          
             <div class="row" style="margin-top:20px">
                <div class="col-sm-6">
                    <div class="card img-fluid">
                        <img src="Images\cities.jpg" class="card-img-top" alt="...">
                        <div class="card-img-overlay">
                            <div class="card-body">
                                <p class="card-text text-center text-weight-bold align-middle" style="font-size:30px; vertical-align:middle">LOCATION</p>
                                <a href="Location.aspx" class="card-link stretched-link"></a>
                            </div>
                            
                        </div>                        
                    </div>
                                           
                </div>
                <div class="col-sm-6">
                    <div class="card img-fluid">
                        <img src="Images\type.jpg" class="card-img-top" alt="...">
                        <div class="card-img-overlay">
                            <div class="card-body">
                                <p class="card-text text-center text-weight-bold align-middle" style="font-size:30px; vertical-align:middle">TYPE</p>
                                <a href="Type.aspx" class="card-link stretched-link"></a>
                            </div>
                            
                        </div>      

                    </div>
                                          
                </div>
            </div>
        </div>
        
       
   


</asp:Content>
