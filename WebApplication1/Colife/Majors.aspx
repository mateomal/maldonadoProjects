<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Majors.aspx.cs" Inherits="Colife.Majors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        li,label,p{
            font-size:15px;
        }
       

        #collegeResults{
            margin-bottom:20px;
        }

    </style>

    <div class="container mb-5">
        <div class="card mt-5 border-white">
            <h2 class="text-center card-title" style="margin: 40px;">Majors</h2>
            <input class="form-control" id="searchBar" type="text" placeholder="Search.." />
            <br />
            <div class="card card-body">
                <div style="height: 400px; overflow-y: scroll">
                    <asp:CheckBoxList ID="cbList" runat="server" TextAlign="Left" CssClass="list-group-item text-left" ClientIDMode="Static" Enabled="true" AutoPostBack="false" />
                </div>
            </div>

        </div>

        <div class="col-md-12 text-center mt-5">
            <div class="row btn-group" role="group">
                <button runat="server" id="btnClear" class="btn">Clear</button>
                <button runat="server" id="btnSearch" onserverclick="btn_Search" class="btn btn-primary ml-2">Search</button>
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








    <script>
        $(document).ready(function () {
            $("#searchBar").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#cbList tbody tr td").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>

 


</asp:Content>
