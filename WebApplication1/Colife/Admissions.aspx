<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admissions.aspx.cs" Inherits="Colife.Sports" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <style>

        #slider-range, #slider-range2
        {
            margin-bottom:10px;
        }


        .grid table td
        {
        padding:10px;
        
        }

        .grid{
            margin-bottom:250px;
        }

    </style>
    
 <asp:HiddenField ID="valueField" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="valueField2" ClientIDMode="Static" runat="server" />


<div class="container">
     <div class="card mt-5 border-white">
         <h2 class="text-center card-title" style="margin:40px">Admissions</h2>

    <div class="row text-center">
        <div class="card mx-auto col-lg-6">
            <button class="btn btn-block" type="button" data-toggle="collapse" data-target="#collapseMenu" aria-controls="#collapseMenu" aria-expanded="false">SAT</button>

            <div class="collapse" id="collapseMenu" style="margin:10px">
                <div class="card card-body">                 
                        <label>SAT Range</label>
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
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">GPA</button>

            <div class="collapse" id="collapseMenu2" style="margin:10px">
                <div class="card card-body">
                     <label>GPA Range</label>
                        <p>                        
                            <input type="text" id="amount2" readonly style="border: 0; color: #f6931f; font-weight: bold;">
                        </p>
                     
                        <div id="slider-range2">

                        </div>
                </div>
            </div>
        </div>
    </div>


    <div class="row text-center">
        <div class="card mx-auto col-lg-6">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu3" aria-controls="#collapseMenu3" aria-expanded="false">Acceptance Rate</button>

            <div class="collapse" id="collapseMenu3">
                <div class="card card-body">
  
                    <div style="height:80px;" class="grid">

                        <asp:GridView runat="server" ID="gridAceptance" AutoGenerateColumns="false" GridLines="None">
                            <Columns>
                                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AcceptanceRate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("min") %>'></asp:Label>  -
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("max")%>'></asp:Label>%
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            
                        </asp:GridView>
                        
                    </div>
        
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


   
     <script>
        $(document).ready(function () {
            $("#searchBar").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#cbList tbody tr td").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });

         $(function () {
             $("#slider-range").slider({
                 range: true,
                 min: 0,
                 max: 1600,
                 values: [980, 1450],
                 step:50,
                 slide: function (event, ui) {
                     $("#amount").val( ui.values[0] + " - " + ui.values[1]);
                     $("#valueField").val(ui.values[0] + " - " + ui.values[1]);
                 }
             });
             $("#amount").val($("#slider-range").slider("values", 0) +
                 " - " + $("#slider-range").slider("values", 1));




         });


         $(function () {
             $("#slider-range2").slider({
                 range: true,
                 min: 0,
                 max: 4.0,
                 values: [2.5, 3.8],
                 step:0.25,
                 slide: function (event, ui) {
                     $("#amount2").val(ui.values[0] + " - " + ui.values[1]);
                     $("#valueField2").val(ui.values[0] + " - " + ui.values[1]);
                 }
             });
             $("#amount2").val($("#slider-range2").slider("values", 0) +
                 " - " + $("#slider-range2").slider("values", 1));




         });
     </script>
</asp:Content>










