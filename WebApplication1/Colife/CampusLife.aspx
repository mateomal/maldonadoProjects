<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CampusLife.aspx.cs" Inherits="Colife.CampusLife" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <h2 class="text-center">Campus Life</h2>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu" aria-controls="#collapseMenu" aria-expanded="false">Number of Students</button>

            <div class="collapse" id="collapseMenu">
                <div class="card card-body">
                    <ul class="list-group text-left">
                        <li class="list-group-item">
                            <asp:CheckBox ID="btnLess" runat="server" Text="Less than 3,000 students" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="btnBetween" runat="server" Text="3,000-15,000 students" TextAlign="Left" /></li>
                         <li class="list-group-item">
                            <asp:CheckBox ID="btnMore" runat="server" Text="More than 15,000 students" TextAlign="Left" /></li>

                    </ul>
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
                    <ul class="list-group text-left">
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbUrban" runat="server" Text="Urban" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbSuburban" runat="server" Text="Suburban" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbRural" runat="server" Text="Rural" TextAlign="Left" /></li>                   
                    </ul>
                </div>
            </div>
        </div>
    </div>

     <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu4" aria-controls="#collapseMenu4" aria-expanded="false">Dissabilitites Supports</button>

            <div class="collapse" id="collapseMenu4">
                <div class="card card-body">
                    <ul class="list-group text-left">
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbVisually" runat="server" Text="Vissualy Impared" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbHeard" runat="server" Text="Heard Impared" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbLearning" runat="server" Text="Learning Disorders" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbCommunication" runat="server" Text="Communication Disorders" TextAlign="Left" /></li>                     
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row text-center" style="margin-top:20px">
        <asp:Button runat="server" ID="btnClear" Text="Clear" />
        <asp:Button runat="server" ID="btnSearch" Text="Search" />
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
    </script>


</asp:Content>
