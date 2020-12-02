<div class="modal" id="myModalDel">
	<div class="modal-dialog">
 	<div class="modal-content">
 	<div class="modal-header">
      <h4 class="modal-title">Delete an Item Tracker</h4>
      <button type="button" class="close" data-dismiss="modal">&times;</button>
    </div>
    <div class="modal-body">
    <ul class="nav nav-tabs" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link active" data-toggle="tab" href="#appdel">Application</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="tab" href="#assdel">Assessment</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="tab" href="#comdel">Company</a>
	    </li>
  	</ul>
  	<div class="tab-content">
		<div id="appdel" class="container tab-pane active"><br>
 		  <h4 class="modal-title">Delete Application</h4>
 		  <br>
		  <div>
		  	<form action="tracker" class = "appdelform">	
		  	<input type='hidden' name='action' value='DeleteApp'/>	
		    <div class="form-group">
 			  <label for="ApplicationID">Application ID</label>
 			  <input class="form-control" id="ApplicationID" name="appId" required>
 			</div>
 			<button type="submit" class="btn btn-primary">Delete Application</button>
			</form>
		  </div>
	    </div>
	    <div id="assdel" class="container tab-pane fade"><br>
     	  <h4 class="modal-title">Delete Assessment</h4>
		  <br>
		  <div>
		   <form action="tracker" class = "assdelform">
		   <input type='hidden' name='action' value='DeleteRound'/>
		    <div class="form-group">
 				<label for="AssessmentID">Assessment ID</label>
 				<input class="form-control" id="AssessmentID" name="roundId" required>
			</div>
 			<button type="submit" class="btn btn-primary">Delete Assessment</button>
		   </form>	
		  </div>
	    </div>
	    <div id="comdel" class="container tab-pane fade"><br>
      		<h4 class="modal-title">Delete Company</h4>
      		<br>
		  <div>
		     <form action="tracker" class = "comdelform">
		     <input type='hidden' name='action' value='DeleteCompany'/>		
		      <div class="form-group">
	 			<label for="CompanyID">Company ID</label>
				<input class="form-control" id="CompanyID" name="companyId" required>
			  </div>
			  <button type="submit" class="btn btn-primary">Delete Company</button>
		 	</form> 
		  </div>
	    </div>
	</div>
    </div>
    <div class="modal-footer"></div>
   </div>
   </div>
</div>