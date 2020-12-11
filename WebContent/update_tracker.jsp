<div class="modal" id="myModalUp">
	<div class="modal-dialog">
		 <div class="modal-content">	
		 <div class="modal-header">
          <h4 class="modal-title">Update an Item in the Tracker</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
         <div class="modal-body">
         	<ul class="nav nav-tabs" role="tablist">
			    <li class="nav-item">
			      <a class="nav-link active" data-toggle="tab" href="#appup">Application</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" data-toggle="tab" href="#assup">Assessment</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" data-toggle="tab" href="#comup">Company</a>
			    </li>
			</ul>
			<div class="tab-content">
				<div id="appup" class="container tab-pane active"><br>
        			<h4 class="modal-title">Update Application Details</h4>
        			<br>
				    <div>
				     <form action="tracker" class = "appupform">	
				     <input type='hidden' name='action' value='UpdateApp'/>	
				      <div class="form-group">
   						<label for="ApplicationID">Application ID</label>
   						<input class="form-control" id="ApplicationID" placeholder="Enter Application ID" name="appId" required>
   						<label for="UpCompany">Updated Company Name</label>
   						<input class="form-control" id="UpCompany" placeholder="Enter Company Name" name="company" required>
   						<label for="UpLink">Updated Link</label>
   						<input class="form-control" id="UpLink" placeholder="Enter Link to Application" name="url" required>
   						<label for="UpDeadline">Updated Deadline (YYY-MM-DD)</label>
   						<input class="form-control" id="UpDeadline" placeholder="Enter Application Deadline" name="date" required>
   						<br>
   						<div class="form-check">
    						<input class="form-check-input" type="checkbox" value="0" id="UpIn" name="interview" onclick="upInt()">
    						<label class="form-check-label" for="UpIn">Updated Interview</label>
   						</div>

   						<div class="form-check">
    						<input class="form-check-input" type="checkbox" value="0" id="UpJo" name="joboffer" onclick="upJob()">
    						<label class="form-check-label" for="UpJo">Updated Job</label>
   						</div>
   						<br>
   						<label for="UpIndustry">Updated Industry</label>
   						<input class="form-control" id="UpIndustry" placeholder="Enter Industry" name="industry" required>
   						<label for="UpPosition">Updated Position</label>
   						<input class="form-control" id="UpPosition" placeholder="Enter Position Title" name="position" required>
  					  </div>
  					  <button type="submit" class="btn btn-primary">Update Application</button>
 					 </form> 
				    </div>
			    </div>
			    <div id="assup" class="container tab-pane fade"><br>
       				<h4 class="modal-title">Update Assessment Details</h4>
       				<br>
			      	<div>
			       		<form action="tracker" class = "assupform">	
			       		<input type='hidden' name='action' value='UpdateRound'/>	
				       	<div class="form-group">
					       <label for="AssessmentID">Assessment ID</label>
   						   <input class="form-control" id="AssessmentID" placeholder="Enter Assessment ID" name="roundId" required>
   						   <label for="CompanyID">Company ID</label>
				  		  <input class="form-control" id="CompanyID" placeholder="Enter Company ID" name="companyId" required>
				  		  <label for="AppID">Application ID</label>
				  		  <input class="form-control" id="AppID" placeholder="Enter Application ID" name="appId" required>
   						   <label for="AssType">Updated Assessment Type</label>
   						   <input class="form-control" id="AssType" placeholder="Enter Assessment Type" name="roundtype" required>
   						   <label for="Date">Updated Date (YYYY-MM-DD HH:MM:SS)</label>
   						   <input class="form-control" id="Date" placeholder="Enter Assessment Time" name="time" required>
   						   <label for="Loc">Updated Location</label>
   						   <input class="form-control" id="Loc" placeholder="Enter Location" name="location" required>
   						   <label for="AssName">Updated Assessor Name</label>
   						   <input class="form-control" id="AssName" placeholder="Enter Assessor's Name" name="assessor" required>
  						</div>
  						<button type="submit" class="btn btn-primary">Update Assessment</button>
  						</form>   
			      	</div>
			    </div>
			    <div id="comup" class="container tab-pane fade"><br>
       			  <h4 class="modal-title">Update Company Details</h4>
       			  <br>
			      <div>
			       <form action="tracker" class = "comupform">	
			       <input type='hidden' name='action' value='UpdateCompany'/>	
			        <label for="CompanyID">Company ID</label>
				    <input class="form-control" id="CompanyID" placeholder="Enter Company ID" name="companyId" required>
				    <label for="CompName">Updated Company Name</label>
				    <input class="form-control" id="CompName" placeholder="Enter Company Name" name="name" required>
				    <label for="ComLink">Updated Link</label>
				    <input class="form-control" id="ComLink" placeholder="Enter Link to Company Page" name="url" required>
				    <label for="ComCon">Updated Connection Name</label>
				    <input class="form-control" id="ComCon" placeholder="Enter Name of Connection" name="connection" required>
				   	<br>
				   	<button type="submit" class="btn btn-primary">Update Company</button>
				   </form> 
			      </div>
			    </div>
			 </div>
         </div>
		 <div class="modal-footer"></div>
		</div>
	</div>
</div>