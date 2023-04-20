<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Majors.aspx.cs" Inherits="Colife.Majors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <div class="container">
        <h2 class="text-center">Majors</h2>
        <input class="form-control" id="searchBar" type="text" placeholder="Search.." />  
        <br /> 
        <div style="height:500px; overflow-y:scroll">
            <asp:CheckBoxList ID="cbList" runat="server" TextAlign="Left" CssClass="list-group-item text-left" ClientIDMode="Static" Enabled="true" AutoPostBack="false"/>
        </div>
                      
    </div>
    <div class="row">
        <asp:GridView ID="collegeTable" runat="server"></asp:GridView>


    </div>
    <div class="row text-center" style="margin-top:20px">

        <asp:Button ID="btnClear" runat="server" Text="Clear" BackColor="#012d66" ForeColor="White"/>
        <asp:Button ID="btnSearch" runat="server" Text="Search" ForeColor="White" BackColor="#d8b936" OnClick="btn_Search"/>
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
