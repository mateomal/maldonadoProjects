<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Location.aspx.cs" Inherits="Colife.Location" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    
    
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>


    <div class="container">
        <div class="card mt-5 border-white">
            <h2 class="text-center card-title">Location</h2>

        <div class="row text-center card-body mx-auto">
            <div class="align-middle" style="width:400px">
                <asp:RadioButton ID="rbState" runat="server" Text="State" OnCheckedChanged="onChangeRadio" AutoPostBack="true" />
                <select class="selectpicker form-control" multiple data-live-search="true" runat="server" id="stateSelector" visible="false" name="state">
                </select>            
            </div>
        </div>

        <div class="row text-center card-body mx-auto">
            <div class="align-middle" style="width:400px">
                <asp:RadioButton ID="rbCity" runat="server" Text="City" AutoPostBack="true" OnCheckedChanged="onChangeRadio" />
                <select class=" selectpicker form-control" style="width:100px" multiple data-live-search="true" id="citySelector" visible="false" runat="server">
                </select>
            </div>
        </div>

        <div class="col-md-12 text-center">
            <div class="row btn-group" role="group" style="margin-top: 20px">
                <button runat="server" id="btnClear" class="btn">Clear</button>
                <button runat="server" id="btnSearch" onserverclick="btn_Search" class="btn btn-primary ml-2">Search</button>
            </div>
        </div>
        </div>
        
    </div>
        <asp:Repeater runat="server" ID="collegeResults" ClientIDMode="Static">
            <ItemTemplate>

                <div class="container mb-5">
                    <a href="<%#Eval("URL") %>" class="card-link stretched-link row">
                        <div class="col-12">
                            <div class="card">
                                <div class="row card-body">
                                    <div class="col-6">
                                        <h2 class="card-title mt-5"><%#Eval("CollegeName") %></h2>
                                        <h5 class="card-subtitle mb-5"><%#Eval("CityName") %>,<%#Eval("StateCode")%></h5>
                                        <hr />
                                        <div class="card-text col-12">
                                            <div class="row">
                                                <ul class="list-inline">
                                                    <li class="list-inline-item"><%#Eval("Education")%></li>
                                                    <li class="list-inline-item"><%#Eval("Type") %></li>
                                                    <li class="list-inline-item"><%#Eval("Surroundings")%></li>
                                                </ul>
                                            </div>
                                            <div class="row">
                                                <p class="card-text">SAT:</p>
                                                <label id="satMin"><%#Eval("SATMin") %></label>-<label id="satMax"><%#Eval("SATMax") %></label>
                                            </div>
                                            <div class="row">
                                                <p class="card-text">Number of Students:</p>
                                                <label id="numbStudents"><%#Eval("NumberOfStudents") %></label>
                                            </div>
                                            <div class="row">
                                                <p class="card-text">Acceptance Rate:</p>
                                                <label id="acceptance"><%#Eval("AcceptanceRate") %></label>
                                            </div>
                                        </div>
                                    </div>
                                    <img class="col-6" src="<%#Eval("Photo") %>" style="width: 280px; height: 299px" alt="sans" />
                                    <%--<img class="pull-right rounded-circle" src="<%#Eval("Logo")%>" alt="sans"/>--%>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </ItemTemplate>
         </asp:Repeater>
    


    







 


</asp:Content>

