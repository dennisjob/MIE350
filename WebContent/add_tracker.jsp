<div class="modal" id="myModalAdd">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
          <h4 class="modal-title">Add New Item to Tracker</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        	<ul class="nav nav-tabs" role="tablist">
		    <li class="nav-item">
		      <a class="nav-link active" data-toggle="tab" href="#appadd">Application</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="tab" href="#assadd">Assessment</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="tab" href="#comadd">Company</a>
		    </li>
	  		</ul>
	  		<div class="tab-content">
	    	<div id="appadd" class="container tab-pane active"><br>
   				<h4>Track New Application</h4>
   				<br>
			  	<div>
			    	<form action="tracker" class = "appidform">
			    		<input type='hidden' name='action' value='InsertApp'/>
				    	<div class="form-group">
   						<!-- <label for="ApplicationID">Application ID</label>
   						<input class="form-control" id="ApplicationID" placeholder="Enter Application ID" name="appId" required>-->
   						<label for="UpCompany">Company Name</label>
   						<input class="form-control" id="UpCompany" placeholder="Enter Company Name" name="company" required>
   						<label for="UpLink">Link</label>
   						<input class="form-control" id="UpLink" placeholder="Enter Link to Application" name="url" required>
   						<label for="UpDeadline">Deadline (YYY-MM-DD)</label>
   						<input class="form-control" id="UpDeadline" placeholder="Enter Application Deadline" name="date" required>
   						<br>
   						<div class="form-check">
    						<input class="form-check-input" type="checkbox" value="0" id="addIn" name="interview" onclick="addInt()">
    						<label class="form-check-label" for="UpIn">Interview Offer</label>
   						</div>

   						<div class="form-check">
    						<input class="form-check-input" type="checkbox" value="0" id="addJo" name="joboffer" onclick="addJob()">
    						<label class="form-check-label" for="UpJo">Job Offer</label>
   						</div>
   						<br>
   						<label for="UpIndustry">Industry</label>
   						<input class="form-control" id="UpIndustry" placeholder="Enter Industry" name="industry" required>
   						<label for="UpPosition">Position</label>
   						<input class="form-control" id="UpPosition" placeholder="Enter Position Title" name="position" required>
  					  </div>
  					  <button type="submit" class="btn btn-primary">Track Application</button>
 					 </form>
		  		</div>
	    	</div>
		    <div id="assadd" class="container tab-pane fade"><br>
		    	<h4>Track New Assessment</h4>
		    	<br>
			    <div>
			   		<form action="tracker" class = "assidform">
			   		<input type='hidden' name='action' value='InsertRound'/>
			    		<div class="form-group">
					       <!-- <label for="AssessmentID">Assessment ID</label>
   						   <input class="form-control" id="AssessmentID" placeholder="Enter Assessment ID" name="roundId" required>-->
   						   <label for="CompanyID">Company ID</label>
				  		  <input class="form-control" id="CompanyID" placeholder="Enter Company ID" name="companyId" required>
				  		  <label for="AppID">Application ID</label>
				  		  <input class="form-control" id="AppID" placeholder="Enter Application ID" name="appId" required>
   						   <label for="AssType">Assessment Type</label>
   						   <input class="form-control" id="AssType" placeholder="Enter Assessment Type" name="roundtype" required>
   						   <label for="Date">Date and Time (YYYY-MM-DD HH:MM:SS)</label>
   						   <input class="form-control" id="Date" placeholder="Enter Assessment Time" name="time" required>
   						   <label for="Loc">Location</label>
   						   <input class="form-control" id="Loc" placeholder="Enter Location" name="location" required>
   						   <label for="AssName">Assessor Name</label>
   						   <input class="form-control" id="AssName" placeholder="Enter Assessor's Name" name="assessor" required>
  						</div>
  						<button type="submit" class="btn btn-primary">Track Assessment</button>
  					</form>	
			  	</div>
		    </div>
		    <div id="comadd" class="container tab-pane fade"><br>
		        <h4>Track New Company</h4>
		        <br>
			    <div>
			    	<form action="tracker" class = "compidform">	
			    	<input type='hidden' name='action' value='InsertCompany'/>
			      		<div class="form-group">
  							<!-- <label for="CompanyID">Company ID</label>
  							<input class="form-control" id="CompanyID" placeholder="Enter Company ID" name="companyId" required>-->
						    <label for="CompName">Company Name</label>
						    <input class="form-control" id="CompName" placeholder="Enter Company Name" name="name" required>
						    <label for="ComLink">Company Page Link</label>
						    <input class="form-control" id="ComLink" placeholder="Enter Link to Company Page" name="url" required>
						    <label for="ComCon">Connection Name</label>
						    <input class="form-control" id="ComCon" placeholder="Enter Name of Connection" name="connection" required>
						</div>
						<button type="submit" class="btn btn-primary">Track Company</button>
					</form> 
			    </div>
		    </div>
		    </div>
        </div>
        <div class="modal-footer"></div>
		</div>
	</div>
</div>
