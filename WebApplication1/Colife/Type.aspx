<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Type.aspx.cs" Inherits="Colife.Type" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h2 class="text-center">Type</h2>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu" aria-controls="#collapseMenu" aria-expanded="false">Level of Education</button>

            <div class="collapse" id="collapseMenu">
                <div class="card card-body text-left">
                    <asp:CheckBoxList ID="educationList" runat="server" CssClass="list-group-item text-left" ClientIDMode="Static" TextAlign="Left" AutoPostBack="false">
                        <asp:ListItem>4 Year</asp:ListItem>
                        <asp:ListItem>2 Years</asp:ListItem>                     
                    </asp:CheckBoxList>
                </div>
            </div>
        </div>
    </div>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu2" aria-controls="#collapseMenu2" aria-expanded="false">College Type</button>

            <div class="collapse" id="collapseMenu2">
                <div class="card card-body text-left">             
                    <asp:CheckBoxList ID="typeList" runat="server" CssClass="list-group-item text-left" ClientIDMode="Static" TextAlign="Left" AutoPostBack="false">
                        <asp:ListItem>Private</asp:ListItem>
                        <asp:ListItem>Public</asp:ListItem>                     
                    </asp:CheckBoxList>
                </div>
            </div>
        </div>
    </div>

    <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu3" aria-controls="#collapseMenu3" aria-expanded="false">Mission</button>

            <div class="collapse" id="collapseMenu3">
                <div class="card card-body text-left">
                   
                    <asp:CheckBoxList ID="missionList" runat="server" CssClass="list-group-item text-left" ClientIDMode="Static" TextAlign="Left" AutoPostBack="false">
                        <asp:ListItem>HBCU</asp:ListItem>
                        <asp:ListItem>HSIs</asp:ListItem>
                        <asp:ListItem>TCUs</asp:ListItem>
                        <asp:ListItem>All-Women</asp:ListItem>
                        <asp:ListItem>All-Men</asp:ListItem>
                    </asp:CheckBoxList> 
                </div>
            </div>
        </div>
    </div>

     <div class="row text-center">
        <div class="card">
            <button class="btn" type="button" data-toggle="collapse" data-target="#collapseMenu4" aria-controls="#collapseMenu4" aria-expanded="false">Special Interests</button>

            <div class="collapse" id="collapseMenu4">
                <div class="card card-body text-left">
                    <asp:CheckBoxList ID="interestList" runat="server" CssClass="list-group-item text-left" ClientIDMode="Static" TextAlign="Left" AutoPostBack="false">
                        <asp:ListItem>Remote learning</asp:ListItem>
                        <asp:ListItem>Double Major</asp:ListItem>
                        <asp:ListItem>Honors Program</asp:ListItem>
                        <asp:ListItem>Weekend College</asp:ListItem>
                    </asp:CheckBoxList> 

                </div>
            </div>
        </div>
    </div>
    <div class="row text-center">
        <asp:Button runat="server" ID="btnClear" Text="Clear" />
        <asp:Button runat="server" ID="btnSearch" Text="Search" />
    </div>


</asp:Content>
