﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CampusLife.aspx.cs" Inherits="Colife.CampusLife" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <h2 class="text-center">Campus Life</h2>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu" aria-controls="#collapseMenu" aria-expanded="false">Number of Students</button>

            <div class="collapse" id="collapseMenu">
                <div class="card card-body">
                    <asp:CheckBoxList ID="numberStudents" runat="server" CssClass="list-group-item text-left" ClientIDMode="Static" TextAlign="Left" AutoPostBack="false">
                        
                    </asp:CheckBoxList>              
                </div>
            </div>
        </div>
    </div>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">Clubs</button>

            <div class="collapse" id="collapseMenu2">
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
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu3" aria-controls="#collapseMenu3" aria-expanded="false">Surroundings</button>

            <div class="collapse" id="collapseMenu3">
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
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu4" aria-controls="#collapseMenu3" aria-expanded="false">Sports</button>

            <div class="collapse" id="collapseMenu4">
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

    <div class="row text-center" style="margin-top:20px">
        <asp:Button runat="server" ID="btnClear" Text="Clear" />
        <asp:Button runat="server" ID="btnSearch" Text="Search"  OnClick="btn_SearchClick" />
    </div>

    <div class="row">
        <asp:GridView ID="collegeTable" runat="server"></asp:GridView>


    </div>

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
