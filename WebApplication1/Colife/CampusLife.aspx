<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CampusLife.aspx.cs" Inherits="Colife.CampusLife" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <h2 class="text-center" style="margin:40px">Campus Life</h2>

    <div class="row text-center">
        <div class="card mx-auto col-lg-6">
            <button class="btn btn-block" type="button" data-toggle="collapse" data-target="#collapseMenu" aria-controls="#collapseMenu" aria-expanded="false">Number of Students</button>

            <div class="collapse" id="collapseMenu" style="margin:10px">
                <div class="card card-body">
                    <asp:CheckBoxList ID="numberStudents" runat="server" CssClass="list-group-item text-left" ClientIDMode="Static" TextAlign="Left" AutoPostBack="false">
                        
                    </asp:CheckBoxList>              
                </div>
            </div>
        </div>
    </div>

    <div class="row text-center">
        <div class="card mx-auto col-lg-6">
            <button class="btn btn-block" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">Clubs</button>

            <div class="collapse" id="collapseMenu2" style="margin:10px">
                <div class="card card-body">
                   <input class="form-control" id="searchBar" type="text" placeholder="Search.." />
        <br />  
                    <div style="height:500px; overflow-y:scroll">
                        <asp:CheckBoxList ID="cbList" runat="server" TextAlign="Left" CssClass="list-group-item text-left" ClientIDMode="Static"></asp:CheckBoxList>
                    </div>
        
                </div>
            </div>
        </div>
    </div>

    <div class="row text-center">
        <div class="card mx-auto col-lg-6">
            <button class="btn btn-block" type="button" data-toggle="collapse" data-target="#collapseMenu3" aria-controls="#collapseMenu3" aria-expanded="false">Surroundings</button>

            <div class="collapse" id="collapseMenu3" style="margin:10px">
                <div class="card card-body">  
                    <asp:CheckBoxList ID="surroundingsList" runat="server" CssClass="list-group-item text-left" ClientIDMode="Static" TextAlign="Left" AutoPostBack="false">
                        <asp:ListItem>Urban</asp:ListItem>
                        <asp:ListItem>Suburban</asp:ListItem>
                        <asp:ListItem>Rural</asp:ListItem>
                    </asp:CheckBoxList> 

                </div>
            </div>
        </div>
    </div>

     <div class="row text-center">
        <div class="card mx-auto col-lg-6">
            <button class="btn btn-block" type="button" data-toggle="collapse" data-target="#collapseMenu4" aria-controls="#collapseMenu3" aria-expanded="false">Sports</button>

            <div class="collapse" id="collapseMenu4" style="margin:10px">
                <div class="card card-body text-left">
                     <input class="form-control" id="searchBar2" type="text" placeholder="Search.." />
        <br />  
                    <div style="height:200px; overflow-y:scroll">
                        <asp:CheckBoxList ID="cbSports" runat="server" TextAlign="Left" CssClass="list-group-item text-left" ClientIDMode="Static">                          
                        </asp:CheckBoxList>
                        
                    </div>
        
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-12 text-center">
        <div class="row btn-group" role="group" style="margin-top: 20px">
            <button runat="server" id="btnClear" class="btn">Clear</button>
            <button runat="server" id="btnSearch" onserverclick="btn_SearchClick" class="btn btn-primary ml-2">Search</button>
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

    

    <script>
        $(document).ready(function () {
            $("#searchBar").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#cbList tbody tr td").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });


        $(document).ready(function () {
            $("#searchBar2").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#cbSports tbody tr td").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>


</asp:Content>
