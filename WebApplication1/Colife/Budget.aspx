<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Budget.aspx.cs" Inherits="Colife.Budget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h2 class="text-center">Budget</h2>

    <div class="container">

        <div class="row text-center">
            <div class="card">
                <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">Total Tuiton Cost</button>

                <div class="collapse" id="collapseMenu2">
                    <div class="card card-body text-left">
                        <label>Approx total tuiton cost</label>
                        <input type="range" class="form-custom-range" min="0" max="200000" id="rangeSlider" oninput="$('#budgetRange').html($(this).val())" />
                        <span id="budgetRange">100000</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="row text-center">
            <div class="card">
                <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu3" aria-controls="#collapseMenu3" aria-expanded="false">Demographic</button>

                <div class="collapse" id="collapseMenu3">
                    <div class="card card-body text-left">
                        <asp:CheckBox ID="cbInternational" Text="International Student" TextAlign="Left" runat="server"/>
                        <br />
                        <asp:CheckBox ID="cbAmerican" Text="American Student" TextAlign="Left" runat="server" />
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

                        <ul class="list-group" id="scholarshipsList">
                            <li class="list-group-item">
                                <asp:CheckBox ID="cbScholarship1" runat="server" Text="Fulbright Scholarship Program" TextAlign="Left" /></li>
                            <li class="list-group-item">
                                <asp:CheckBox ID="cbScholarship2" runat="server" Text="Excelsior Scholarship" TextAlign="Left" /></li>
                            <li class="list-group-item">
                                <asp:CheckBox ID="cbScholarship3" runat="server" Text="The Coca-Cola Scholarship" TextAlign="Left" /></li>
                            <li class="list-group-item">
                                <asp:CheckBox ID="cbScholarship4" runat="server" Text="National Merit Scholarship" TextAlign="Left" /></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

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
