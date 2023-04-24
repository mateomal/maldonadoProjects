<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Type.aspx.cs" Inherits="Colife.Type" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="card mt-5 border-white">
            <h2 class="text-center card-title" style="margin: 40px;">Type</h2>

            <div class="row text-center">
                <div class="card mx-auto col-lg-6">
                    <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu" aria-controls="#collapseMenu" aria-expanded="false">Level of Education</button>

                    <div class="collapse" id="collapseMenu" style="margin: 10px">
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
                <div class="card mx-auto col-lg-6">
                    <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">College Type</button>

                    <div class="collapse" id="collapseMenu2" style="margin: 10px">
                        <div class="card card-body text-left">
                            <asp:CheckBoxList ID="typeList" runat="server" CssClass="list-group-item text-left" ClientIDMode="Static" TextAlign="Left" AutoPostBack="false">
                                <asp:ListItem>Private</asp:ListItem>
                                <asp:ListItem>Public</asp:ListItem>
                            </asp:CheckBoxList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 text-center">
                <div class="row btn-group" role="group" style="margin-top: 20px">
                    <button runat="server" id="btnClear" class="btn">Clear</button>
                    <button runat="server" id="btnSearch" onserverclick="btn_Search" class="btn btn-primary ml-2">Search</button>
                </div>
            </div>
        </div>
          <div class="col-12 text-center">
            <asp:Label CssClass="alert-danger" id="lblError" runat="server"></asp:Label>
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
