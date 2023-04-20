<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Budget.aspx.cs" Inherits="Colife.Budget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 

    <h2 class="text-center">Budget</h2>

    <div class="container">

        <div class="row text-center">
            <div class="card">
                <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">Total Tuiton Cost</button>

                <div class="collapse" id="collapseMenu2">
                    <div class="card card-body text-left">
                        <div class="slider-track"></div>

                        <label>Approx total tuiton cost</label>

                        <input type="range" class="form-custom-range" min="0" max="200000" id="rangeSlider" oninput="$('#budgetRange').html($(this).val())" data-toggle="tooltip" data-placement="top" title="hola" />
                        <span id="budgetRange"> 100000</span>
                        
                    </div>
                </div>
            </div>
        </div>

        <div class="row text-center">
            <div class="card">
                <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu" aria-controls="#collapseMenu" aria-expanded="false">Scholarships</button>

                <div class="collapse" id="collapseMenu">
                    <div class="card card-body">
                        <input class="form-control" id="searchBar" type="text" placeholder="Search.." />
                        <br />

                        <%-- Agrupar las categorias usande botones y hides--%>                        
                    <div style="height:500px; overflow-y:scroll">
                        <asp:CheckBoxList ID="cbList" runat="server" TextAlign="Left" CssClass="list-group-item text-left" ClientIDMode="Static"></asp:CheckBoxList>
                    </div>


                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row text-center" style="margin-top:20px">

        <asp:Button ID="btnClear" runat="server" Text="Clear" BackColor="#012d66" ForeColor="White"/>
        <asp:Button ID="btnSearch" runat="server" Text="Search" ForeColor="White" BackColor="#d8b936" OnClick="btn_SearchClick"/>
    </div>

    <div class="row">
        <asp:GridView ID="collegeTable" runat="server"></asp:GridView>


    </div>
     <script>
         $(document).ready(function () {
             $("#searchBar").on("keyup", function () {
                 var value = $(this).val().toLowerCase();
                 $("#scholarshipsList li").filter(function () {
                     $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                 });
             });
         });
     </script>







</asp:Content>
