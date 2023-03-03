<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Location.aspx.cs" Inherits="Colife.Location" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    
    
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>


    <div class="container">
        <h2 class="text-center">Location</h2>

        <div class="row text-center">
            <div class="align-middle">
                <asp:RadioButton ID="rbState" runat="server" Text="State" OnCheckedChanged="onChangeRadio" AutoPostBack="true" />
                <select class="selectpicker form-control" multiple data-live-search="true" runat="server" id="stateSelector" visible="false"></select>
            </div>
        </div>

        <div class="row text-center">
            <div class="align-middle">
                <asp:RadioButton ID="rbCity" runat="server" Text="City" AutoPostBack="true" OnCheckedChanged="onChangeRadio" />
                <select class=" selectpicker form-control" multiple data-live-search="true" id="citySelector" visible="false" runat="server">
                    <option>Dallas</option>
                    <option>New York</option>
                    <option>Washington</option>
                </select>
            </div>

        </div>

        <div class="row text-center" style="margin-top:20px">
            <asp:Button ID="btnSearch" runat="server" Text="Search" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" />
        </div>
    </div>




    <script type="text/html">
        $('select').selectpicker();
    </script>


</asp:Content>

