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



 <h2 class="text-center">Admissions</h2>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu" aria-controls="#collapseMenu" aria-expanded="false">SAT</button>

            <div class="collapse" id="collapseMenu">
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
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">GPA</button>

            <div class="collapse" id="collapseMenu2">
                <div class="card card-body text-left">
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
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu3" aria-controls="#collapseMenu3" aria-expanded="false">Acceptance Rate</button>

            <div class="collapse" id="collapseMenu3">
                <div class="card card-body text-left">
  
                    <div style="height:100px;" class="grid">
<%--                        <asp:CheckBoxList ID="cbList" runat="server" TextAlign="Left" CssClass="list-group-item text-left" ClientIDMode="Static"> 
                            
                        </asp:CheckBoxList>--%>



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
             $("#amount2").val("$" + $("#slider-range2").slider("values", 0) +
                 " - $" + $("#slider-range2").slider("values", 1));




         });
     </script>
</asp:Content>










