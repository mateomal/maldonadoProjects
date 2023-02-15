<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sports.aspx.cs" Inherits="Colife.Sports" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<asp:Panel runat="server">

    <div class="container">
        <div class="col-4 multi-level">

            <div>
                <asp:CheckBox runat="server" ID="cbDivision" Text="Division" />
                <ul>
                    <li>
                        <asp:CheckBox runat="server" ID="div1" Text="NCAA" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="div2" Text="NCAA2" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="div3" Text="NAIA" /></li>
                </ul>
            </div>
            <div>
                <asp:CheckBox runat="server" ID="cbsports" Text="Sports" />
                <ul>
                    <li>
                        <asp:CheckBox runat="server" ID="soccer" Text="Soccer" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="basket" Text="Basketball" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="volleyball" Text="Volleyball" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="track" Text="Track" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="tennis" Text="Tennis" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="swimming" Text="Swimming and Dive" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="football" Text="Football" /></li>
                </ul>
            </div>


            <div>
                <asp:CheckBox runat="server" ID="cbConference" Text="Conference" />
                <ul>
                    <li>
                        <asp:CheckBox runat="server" ID="sunbelt" Text="Sunbelt" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="sec" Text="SEC" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="pac12" Text="PAC12" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="big10" Text="BIG10" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="acc" Text="ACC" /></li>
                    <li>
                        <asp:CheckBox runat="server" ID="big12" Text="BIG12" /></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="col-8">

            <asp:GridView ID="gvSports" runat="server" Caption="Colleges">


            </asp:GridView>


        </div>


    </div>





</asp:Panel>












</asp:Content>
