<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sports.aspx.cs" Inherits="Colife.Sports" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <h2 class="text-center">Sports</h2>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu" aria-controls="#collapseMenu" aria-expanded="false">Divisions</button>

            <div class="collapse" id="collapseMenu">
                <div class="card card-body">
                    <asp:CheckBoxList runat="server" ID="cbDivision" TextAlign="Left" CssClass="list-group-item text-left">                      
                    </asp:CheckBoxList>
                </div>
            </div>
        </div>
    </div>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">Conferences</button>

            <div class="collapse" id="collapseMenu2">
                <div class="card card-body text-left">
                     <asp:CheckBoxList runat="server" ID="cbConferences" TextAlign="Left" CssClass="list-group-item text-left">
                    </asp:CheckBoxList>
                </div>
            </div>
        </div>
    </div>


    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu3" aria-controls="#collapseMenu3" aria-expanded="false">Sports</button>

            <div class="collapse" id="collapseMenu3">
                <div class="card card-body text-left">
                     <input class="form-control" id="searchBar" type="text" placeholder="Search.." />
        <br />  
                    <div style="height:200px; overflow-y:scroll">
                        <asp:CheckBoxList ID="cbList" runat="server" TextAlign="Left" CssClass="list-group-item text-left" ClientIDMode="Static">                          
                        </asp:CheckBoxList>
                        
                    </div>
        
                </div>
            </div>
        </div>
    </div>

    
    <div class="row text-center">
        <asp:Button runat="server" ID="btnClear" Text="Clear" />
        <asp:Button runat="server" ID="btnSearch" Text="Search" OnClick="btn_Search" />
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
     </script>
</asp:Content>










