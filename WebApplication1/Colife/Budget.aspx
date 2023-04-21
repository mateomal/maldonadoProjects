<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Budget.aspx.cs" Inherits="Colife.Budget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <style>

        #slider-range{
            margin-bottom:20px;
        }


    </style>

    <h2 class="text-center">Budget</h2>

    <div class="container">
    <asp:HiddenField ID="valueField" ClientIDMode="Static" runat="server" />


        <div class="row text-center">
            <div class="card">
                <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">Total Tuiton Cost</button>

                <div class="collapse" id="collapseMenu2">
                    <div class="card card-body text-left">
  

                        <label>Approx total tuiton cost</label>
                        <p>                        
                            <input type="text" id="amount" readonly style="border: 0; color: #f6931f; font-weight: bold;">
                        </p>

                        <div id="slider-range">

                        </div>
                        
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

         $(function () {
             $("#slider-range").slider({
                 range: true,
                 min: 0,
                 max: 100000,
                 values: [5000,50000 ],
                 slide: function (event, ui) {
                     $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
                     $("#valueField").val(ui.values[0] + " - " + ui.values[1]);
                 }
             });
             $("#amount").val("$" + $("#slider-range").slider("values", 0) +
                 " - $" + $("#slider-range").slider("values", 1));




         });


         


     </script>







</asp:Content>
