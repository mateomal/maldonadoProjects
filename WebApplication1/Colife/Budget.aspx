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

   

    <div class="container">
    <asp:HiddenField ID="valueField" ClientIDMode="Static" runat="server" />

       <div class="card mt-5 border-white">
            <h2 class="text-center card-title" style="margin:40px;">Budget</h2>
            <div class="row text-center">
            <div class="card mx-auto col-lg-6">
                <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">Total Tuiton Cost</button>

                <div class="collapse" id="collapseMenu2" style="margin:10px">
                    <div class="card card-body">
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
            <div class="card mx-auto col-lg-6">
                <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu" aria-controls="#collapseMenu" aria-expanded="false">Scholarships</button>

                <div class="collapse" id="collapseMenu" style="margin:10px">
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
        <div class="col-md-12 text-center">
            <div class="row btn-group" role="group" style="margin-top: 20px">
                <button runat="server" id="btnClear" class="btn">Clear</button>
                <button runat="server" id="btnSearch" onserverclick="btn_SearchClick" class="btn btn-primary ml-2">Search</button>
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
