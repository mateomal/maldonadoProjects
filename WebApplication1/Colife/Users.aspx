<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Colife.Location" %>


<asp:content id="content1" contentplaceholderid="maincontent" runat="server">


     <!-- button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#examplemodal">
  launch demo modal
</button>

<!-- modal -->
<div class="modal fade" id="examplemodal" tabindex="-1" role="dialog" aria-labelledby="examplemodallabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="examplemodallabel">modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">close</button>
        <button type="button" class="btn btn-primary">save changes</button>
      </div>
    </div>
  </div>
</div>




 
        <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
 


</asp:content>