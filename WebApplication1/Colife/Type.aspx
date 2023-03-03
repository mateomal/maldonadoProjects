<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Type.aspx.cs" Inherits="Colife.Type" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h2 class="text-center">Type</h2>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu" aria-controls="#collapseMenu" aria-expanded="false">Level of Education</button>

            <div class="collapse" id="collapseMenu">
                <div class="card card-body text-left">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <asp:CheckBox ID="btnBachelor" runat="server" Text="4 Years" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="btnMaster" runat="server" Text="2 Years" TextAlign="Left" /></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">College Type</button>

            <div class="collapse" id="collapseMenu2">
                <div class="card card-body text-left">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbPrivate" runat="server" Text="Private" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbPublic" runat="server" Text="Public" TextAlign="Left" /></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>


    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu3" aria-controls="#collapseMenu3" aria-expanded="false">Mission</button>

            <div class="collapse" id="collapseMenu3">
                <div class="card card-body text-left">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbBlackColleges" runat="server" Text="HBCU" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbHispanic" runat="server" Text="HSIs" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbTribal" runat="server" Text="TCUs" TextAlign="Left" /></li>

                        <li class="list-group-item">
                            <asp:CheckBox ID="cbWomen" runat="server" Text="All-Women" TextAlign="Left" /></li>

                        <li class="list-group-item">
                            <asp:CheckBox ID="cbMen" runat="server" Text="All-Men" TextAlign="Left" /></li>                      
                    </ul>
                </div>
            </div>
        </div>
    </div>

     <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu4" aria-controls="#collapseMenu4" aria-expanded="false">Special Interests</button>

            <div class="collapse" id="collapseMenu4">
                <div class="card card-body text-left">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbRemote" runat="server" Text="Remote learning" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbDoubleMajor" runat="server" Text="Double Major" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbHonors" runat="server" Text="Honors Program" TextAlign="Left" /></li>
                        <li class="list-group-item">
                            <asp:CheckBox ID="cbWeekend" runat="server" Text="Weekend College" TextAlign="Left" /></li>                     
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row text-center">
        <asp:Button runat="server" ID="btnClear" Text="Clear" />
        <asp:Button runat="server" ID="btnSearch" Text="Search" />
    </div>


</asp:Content>
