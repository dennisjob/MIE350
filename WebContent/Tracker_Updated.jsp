<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="datatables.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
	 $(document).ready(function () {
	 $('#apptable').DataTable();
	 $('#asstable').DataTable();
	 $('#comtable').DataTable();
	 $('.dataTables_length').addClass('bs-select');
	 });	
    </script>

    <script>
	 $(document).ready(function () {
	 $('#asstable').DataTable();
	 $('#comtable').DataTable();
	 $('.dataTables_length').addClass('bs-select');
	 });	
    </script>

    <script>
	 $(document).ready(function () {
	 $('#comtable').DataTable();
	 $('.dataTables_length').addClass('bs-select');
	 });	
    </script>

    <script src="datatables.min.js"></script>

    <title>Tracker</title>
    <style>
      #title{
      	margin-top:30px;
      	margin-bottom:60px;
      	margin-left: 25px;
      }	

	  body {
	    position: relative;
	  }
	  ul.nav-pills {
	    top: 20px;
	    position: fixed;
	    color: #001244;

	  }
	  .col-sm-1{
	  	background-color: #F7D6BF;
	  }

	  .tbtrack{
	  	margin-left:25px;
	  }

	  .nav-link {
 		 color: black !important;
 		 text-transform: uppercase;
		}

	  .nav-link.active {
  		 color: #F7D6BF !important;
  		 background-color: #318FB5 !important;
		}

	  .btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
   		background-color: #005086 !important;
		}

	  .btn-danger, .btn-danger:hover, .btn-danger:active, .btn-danger:visited {
   		background-color:  #b30059 !important;
		}

	  .icon {
   		color: #001244 !important
		}

	  table.dataTable thead .sorting:after,
 	  table.dataTable thead .sorting:before,
      table.dataTable thead .sorting_asc:after,
	  table.dataTable thead .sorting_asc:before,
	  table.dataTable thead .sorting_asc_disabled:after,
	  table.dataTable thead .sorting_asc_disabled:before,
	  table.dataTable thead .sorting_desc:after,
	  table.dataTable thead .sorting_desc:before,
	  table.dataTable thead .sorting_desc_disabled:after,
	  table.dataTable thead .sorting_desc_disabled:before {
  			bottom: .5em;
	    }

	  .pagination > li > a
		{
		    background-color: white;
		    color: #318FB5;
		}

		.pagination > li > a:focus,
		.pagination > li > a:hover,
		.pagination > li > span:focus,
		.pagination > li > span:hover
		{
		    color: #5a5a5a;
		    background-color: #eee;
		    border-color: #ddd;
		}

		.pagination > .active > a
		{
		    color: #F7D6BF;
		    background-color: #318FB5 !important;
		    border: solid 1px #318FB5 !important;
		}

		.pagination > .active > a:hover
		{
		    background-color: #318FB5 !important;
		    border: solid 1px #318FB5;
		}

  </style>
</head>

<body data-spy="scroll" data-target="#myScrollspy" data-offset="1">

	<div class="container-fluid">
		<div class="row">
			<nav class="col-sm-1" id="myScrollspy">
				    <ul class="nav nav-pills flex-column custom" style="margin-top:20px">
				      <li class="nav-item">
				        <a class="nav-link active" href="#Applications">Applications</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="#Assessments">Assessments</a>
				      </li>
				      <li class="nav-item">
				      	<a class="nav-link" href="#Companies">Companies</a>
				      </li>
				    </ul>
				    <hr class="d-sm-none">
		    </nav>

		    <div class="col-sm-11">	
	      	  <h2 class="display-4 text-left" id="title" >Personal Tracker</h2>
	       	  <hr>
		      <br>

		      <div class = "tbtrack" id = "trackbuttons" style = "margin-top:-25px">
		      	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalAdd">
	  				Track Item
				</button>

				<div class="modal" id="myModalAdd">
	 				  <div class="modal-dialog">
	   					 <div class="modal-content">
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

								      <div class="modal-header">
		        						<h4 class="modal-title">Input Application ID</h4>
		      						  </div>


									  <div class="modal-body">
									  	<form action="#" class = "appidform">
										    <div class="form-group">
					    					  <label for="ApplicationID">Application ID</label>
					    					  <input class="form-control" id="ApplicationID">
					  						</div>
					  					</form>
									  </div>


					                  <div class="modal-footer">
					                   <button type="button" class="btn btn-success" data-dismiss="modal">Enter</button>
					       	           <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					                 </div>

								    </div>

								    <div id="assadd" class="container tab-pane fade"><br>

								      <div class="modal-header">
				        				<h4 class="modal-title">Input Assessment ID</h4>
				      				  </div>

									  <div class="modal-body">
									  	<form action="#" class = "assidform">
										    <div class="form-group">
					    						<label for="AssessmentID">Assessment ID</label>
					    						<input class="form-control" id="AssessmentID">
					  						</div>
				  						</form>
									  </div>

								      <div class="modal-footer">
								       <button type="button" class="btn btn-success" data-dismiss="modal">Enter</button>
							           <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
								      </div>

								    </div>

								    <div id="comadd" class="container tab-pane fade"><br>

								        <div class="modal-header">
					        				<h4 class="modal-title">Input Company ID</h4>
					      				</div>

									    <div class="modal-body">
									      <form action="#" class = "compidform">
										      <div class="form-group">
					    						<label for="CompanyID">Company ID</label>
					    						<input class="form-control" id="CompanyID">
					  						  </div>
					  					  </form>
									    </div>

								        <div class="modal-footer">
								         <button type="button" class="btn btn-success" data-dismiss="modal">Enter</button>
								       	 <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
								        </div>

								    </div>
								</div>

		   					 </div>
	   					 </div>
   					  </div>

				<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalUp">
	  				Update Item
				</button>

				<div class="modal" id="myModalUp">
	 				  <div class="modal-dialog">
	   					 <div class="modal-content">
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

							        <div class="modal-header">
				        				<h4 class="modal-title">Input Updated Application Details</h4>
				      			    </div>

								    <div class="modal-body">
								      <form action="#" class = "appupform">	
									      <div class="form-group">
				    						<label for="ApplicationID">Application ID</label>
				    						<input class="form-control" id="ApplicationID">
				    						<label for="UpPosition">Updated Position</label>
				    						<input class="form-control" id="UpPosition">
				    						<label for="UpCompany">Updated Company</label>
				    						<input class="form-control" id="UpCompany">
				    						<label for="UpLink">Updated Link</label>
				    						<input class="form-control" id="UpLink">

				    						<div class="form-check">
					    						<input class="form-check-input" type="checkbox" value="" id="UpIn">
					    						<label class="form-check-label" for="UpIn">Updated Interview</label>
				    						</div>

				    						<div class="form-check">
					    						<input class="form-check-input" type="checkbox" value="" id="UpJo">
					    						<label class="form-check-label" for="UpJo">Updated Job</label>
				    						</div>

				  						  </div>
				  					  </form>
								    </div>

							        <div class="modal-footer">
							         <button type="button" class="btn btn-success" data-dismiss="modal">Update</button>
							       	 <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							        </div>

							    </div>

							    <div id="assup" class="container tab-pane fade"><br>

							      <div class="modal-header">
			        				<h4 class="modal-title">Input Updated Assessment Details</h4>
		      				   	  </div>

							      <div class="modal-body">
							       <form action="#" class = "assupform">
								       <div class="form-group">
									       <label for="AssessmentID">Assessment ID</label>
			    						   <input class="form-control" id="AssessmentID">
			    						   <label for="AssName">Updated Assessor Name</label>
			    						   <input class="form-control" id="AssName">
			    						   <label for="AssType">Updated Assessment Type</label>
			    						   <input class="form-control" id="AssType">
			    						   <label for="Date">Updated Date</label>
			    						   <input class="form-control" id="Date">
			    						   <label for="Loc">Updated Location</label>
			    						   <input class="form-control" id="Loc">
		    						   </div>
		    					   </form>
							      </div>

						          <div class="modal-footer">
						           <button type="button" class="btn btn-success" data-dismiss="modal">Update</button>
						       	   <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						          </div>

							    </div>

							    <div id="comup" class="container tab-pane fade"><br>

							      <div class="modal-header">
			        				<h4 class="modal-title">Input Updated Company Details</h4>
			      				  </div>

							      <div class="modal-body">
							       <form action="#" class = "comupform">	
							        <label for="CompanyID">Company ID</label>
								    <input class="form-control" id="CompanyID">
								    <label for="CompName">Updated Company Name</label>
								    <input class="form-control" id="CompName">
								    <label for="ComLink">Updated Link</label>
								    <input class="form-control" id="ComLink">
								   </form> 
							      </div>

						          <div class="modal-footer">
						           <button type="button" class="btn btn-success" data-dismiss="modal">Update</button>
						       	   <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						          </div>

							    </div>

							 </div>
	   					 </div>
   					  </div>
				</div>


				<button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModalDel">
	  				Delete Item
				</button>

				<div class="modal" id="myModalDel">
	 				  <div class="modal-dialog">
	   					 <div class="modal-content">
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

								      <div class="modal-header">
		        						<h4 class="modal-title">Input Application ID</h4>
		      						  </div>


									  <div class="modal-body">
									   <form action="#" class = "appdelform">	
									    <div class="form-group">
				    					  <label for="ApplicationID">Application ID</label>
				    					  <input class="form-control" id="ApplicationID">
				  						</div>
				  					   </form>	
									  </div>


					                  <div class="modal-footer">
					                   <button type="button" class="btn btn-success" data-dismiss="modal">Enter</button>
					       	           <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					                 </div>

								    </div>

								    <div id="assdel" class="container tab-pane fade"><br>

								      <div class="modal-header">
				        				<h4 class="modal-title">Input Assessment ID</h4>
				      				  </div>

									  <div class="modal-body">
									   <form action="#" class = "assdelform">	
									    <div class="form-group">
				    						<label for="AssessmentID">Assessment ID</label>
				    						<input class="form-control" id="AssessmentID">
				  						</div>
				  					   </form>	
									  </div>

								      <div class="modal-footer">
								       <button type="button" class="btn btn-success" data-dismiss="modal">Enter</button>
							           <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
								      </div>

								    </div>

								    <div id="comdel" class="container tab-pane fade"><br>

								        <div class="modal-header">
					        				<h4 class="modal-title">Input Company ID</h4>
					      				</div>

									    <div class="modal-body">
									     <form action="#" class = "comdelform">	
									      <div class="form-group">
				    						<label for="CompanyID">Company ID</label>
				    						<input class="form-control" id="CompanyID">
				  						  </div>
				  						 </form> 
									    </div>

								        <div class="modal-footer">
								         <button type="button" class="btn btn-success" data-dismiss="modal">Enter</button>
								       	 <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
								        </div>

								    </div>
								</div>

		   					 </div>
	   					 </div>
   					  </div>

			</div>

			<hr>

		      <div class="tbtrack" id="Applications">
		      <h4 class="display-6 text-left" style="margin-bottom:30px" ><i class="fas fa-copy fa-lg icon"></i> Applications</h4>
		      <h6 class="display-6 text-left">Displays all tracked application information.</h6>

				  <div class="table-responsive-sm" style="margin-top:20px">
					  <table id = "apptable" class="table table-striped table-bordered table-sm" cellspacing="0">
					  <col style="width:10%">
					  <col style="width:30%">
					  <col style="width:25%">
					  <col style="width:25%">
					  <col style="width:5%">
					  <col style="width:5%">
		    			<thead>
		      				<tr>
			    				<th>Application ID</th>
			    				<th>Position</th>
			   					<th>Company</th>
			    				<th>Link</th>
			    				<th>Interview Offered?</th>
			    				<th>Job Offered?</th>
		      				</tr>
		    			</thead>
		    			<tbody>

						    <tr>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						    </tr>

		      				<tr>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						    </tr>

					    	<tr>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						    </tr>

		    			</tbody>
		  			  </table>
	  			  </div>
	  			  </div>

  			  <hr>
  			  <br>

	  		  <div class="tbtrack" id="Assessments">
	  		  <h4 class="display-6 text-left" style="margin-bottom:30px"><i class="fas fa-user-tie fa-lg icon"></i> Assessments</h4>
	  		  <h6 class="display-6 text-left">Displays all tracked assessment information.</h6>

				  <div class="table-responsive-sm" style="margin-top:20px">
					  <table id = "asstable" class="table table-striped table-bordered table-sm">
					  <col style="width:10%">
					  <col style="width:30%">
					  <col style="width:25%">
					  <col style="width:25%">
					  <col style="width:10%">
		    			<thead>
		      				<tr>
			    				<th>Assessment ID</th>
			    				<th>Assessor Name</th>
			   					<th>Assessment Type</th>
			    				<th>Date</th>
			    				<th>Location</th>			
		      				</tr>
		    			</thead>
		    			<tbody>

						    <tr>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						    </tr>

	      					<tr>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						    </tr>

						   	<tr>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						    </tr>

		    			</tbody>
		  			  </table>
	  			  </div>
	  			  </div>

  			  <hr>
  			  <br>

	  		  <div class="tbtrack" id="Companies">
	  		  <h4 class="display-6 text-left" style="margin-bottom:30px"><i class="fas fa-building fa-lg icon"></i> Companies</h4>
	  		  <h6 class="display-6 text-left">Displays all tracked company information.</h6>

			  <div class="table-responsive-sm" style="margin-top:20px">
				  <table id = "comtable" class="table table-striped table-bordered table-sm">
				  <col style="width:25%">
				  <col style="width:40%">
				  <col style="width:35%">
	    			<thead>
	      				<tr>
	      					<th>Company ID</th>
		    				<th>Company</th>
		   					<th>Link</th>
	      				</tr>
	    			</thead>
	    			<tbody>

				    	<tr>
					    	<td>Cell</td>
					        <td>Cell</td>
					        <td>Cell</td>
					    </tr>

      					<tr>
	      					<td>Cell</td>
					        <td>Cell</td>
					        <td>Cell</td>
	     				</tr>

					    <tr>
					    	<td>Cell</td>
					        <td>Cell</td>
					        <td>Cell</td>
					    </tr>

	    			</tbody>
	  			  </table>
	  		  </div>
	  		  </div>

  			  </div>

   			</div>


    </div>

</body>
</html>