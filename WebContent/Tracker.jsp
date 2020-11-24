<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

    <script>
    function deleteRow(btn) {
    var row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
	}
	</script>

    <script src="datatables.min.js"></script>
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
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
		      <div class="tbtrack" id="Applications">
		      <h4 class="display-6 text-left" style="margin-bottom:30px" >Applications</h4>
		      <h6 class="display-6 text-left">Displays all tracked application information.</h6>
			      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalAdd">
	  				Track Application
				  </button>

				  <div class="modal" id="myModalAdd">
	 				  <div class="modal-dialog">
	   					 <div class="modal-content">

		      				<!-- Modal Header -->
		      				<div class="modal-header">
		        				<h4 class="modal-title">Input Application ID</h4>
		        				<button type="button" class="close" data-dismiss="modal">&times;</button>
		      				</div>

						    <!-- Modal body -->
						    <div class="modal-body">
						      <div class="form-group">
	    						<label for="ApplicationID">Application ID</label>
	    						<input class="form-control" id="ApplicationID">
	  						  </div>
						    </div>

					        <!-- Modal footer -->
					        <div class="modal-footer">
					         <button type="button" class="btn btn-success" data-dismiss="modal">Enter</button>
					       	 <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					        </div>

						</div>
				     </div>
				  </div>

				  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalUp">
	  				Update Application
				  </button>

				  <div class="modal" id="myModalUp">
	 				  <div class="modal-dialog">
	   					 <div class="modal-content">

		      				<!-- Modal Header -->
		      				<div class="modal-header">
		        				<h4 class="modal-title">Input Updated Application Details</h4>
		        				<button type="button" class="close" data-dismiss="modal">&times;</button>
		      				</div>

						    <!-- Modal body -->
						    <div class="modal-body">
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
						    </div>

					        <!-- Modal footer -->
					        <div class="modal-footer">
					         <button type="button" class="btn btn-success" data-dismiss="modal">Update</button>
					       	 <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					        </div>
	   					 </div>
				     </div>
				  </div>


				  <div class="table-responsive-sm" style="margin-top:20px">
					  <table id = "apptable" class="table table-striped table-bordered table-sm" cellspacing="0">
				  	  <col style="width:5%">
					  <col style="width:10%">
					  <col style="width:25%">
					  <col style="width:25%">
					  <col style="width:25%">
					  <col style="width:5%">
					  <col style="width:5%">
		    			<thead>
		      				<tr>
		      					<th>#</th>
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
						        <td ><button type="button" class="btn btn-danger" onclick="deleteRow(this)">Untrack</button></td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						    </tr>

		      				<tr>
						        <td><button type="button" class="btn btn-danger" onclick="deleteRow(this)">Untrack</button></td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						    </tr>

					    	<tr>
						        <td><button type="button" class="btn btn-danger" onclick="deleteRow(this)">Untrack</button></td>
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
	  		  <h4 class="display-6 text-left" style="margin-bottom:30px" >Assessments</h4>
	  		  <h6 class="display-6 text-left">Displays all tracked assessment information.</h6>
			      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalAdd1">
	  				Track Assessment
				  </button>

				  <div class="modal" id="myModalAdd1">
	 				  <div class="modal-dialog">
	   					 <div class="modal-content">

		      				<!-- Modal Header -->
		      				<div class="modal-header">
		        				<h4 class="modal-title">Input Assessment ID</h4>
		        				<button type="button" class="close" data-dismiss="modal">&times;</button>
		      				</div>

						    <!-- Modal body -->
						    <div class="modal-body">
						      <div class="form-group">
	    						<label for="AssessmentID">Assessment ID</label>
	    						<input class="form-control" id="AssessmentID">
	  						  </div>
						    </div>

					        <!-- Modal footer -->
					        <div class="modal-footer">
					         <button type="button" class="btn btn-success" data-dismiss="modal">Enter</button>
					       	 <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					        </div>

						</div>
				     </div>
				  </div>

				  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalUp1">
	  				Update Assessment
				  </button>

				  <div class="modal" id="myModalUp1">
	 				  <div class="modal-dialog">
	   					 <div class="modal-content">

		      				<!-- Modal Header -->
		      				<div class="modal-header">
		        				<h4 class="modal-title">Input Updated Assessment Details</h4>
		        				<button type="button" class="close" data-dismiss="modal">&times;</button>
		      				</div>

						    <!-- Modal body -->
						    <div class="modal-body">
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

					        <!-- Modal footer -->
					        <div class="modal-footer">
					         <button type="button" class="btn btn-success" data-dismiss="modal">Update</button>
					       	 <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					        </div>
	   					 </div>
				     </div>
				  </div>

				  <div class="table-responsive-sm" style="margin-top:20px">
					  <table id = "asstable" class="table table-striped table-bordered table-sm">
					  <col style="width:5%">
					  <col style="width:10%">
					  <col style="width:25%">
					  <col style="width:25%">
					  <col style="width:25%">
					  <col style="width:10%">
		    			<thead>
		      				<tr>
		      					<th>#</th>
			    				<th>Assessment ID</th>
			    				<th>Assessor Name</th>
			   					<th>Assessment Type</th>
			    				<th>Date</th>
			    				<th>Location</th>			
		      				</tr>
		    			</thead>
		    			<tbody>

						    <tr>
						        <td><button type="button" class="btn btn-danger" onclick="deleteRow(this)">Untrack</button></td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						    </tr>

	      					<tr>
						        <td><button type="button" class="btn btn-danger" onclick="deleteRow(this)">Untrack</button></td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						        <td>Cell</td>
						    </tr>

						   	<tr>
						        <td><button type="button" class="btn btn-danger" onclick="deleteRow(this)">Untrack</button></td>
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
	  		  <h4 class="display-6 text-left" style="margin-bottom:30px" >Companies</h4>
	  		  <h6 class="display-6 text-left">Displays all tracked company information.</h6>
	  		  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalAdd2">
  				Track Company
			  </button>

			  <div class="modal" id="myModalAdd2">
 				  <div class="modal-dialog">
   					 <div class="modal-content">

	      				<!-- Modal Header -->
	      				<div class="modal-header">
	        				<h4 class="modal-title">Input Company ID</h4>
	        				<button type="button" class="close" data-dismiss="modal">&times;</button>
	      				</div>

					    <!-- Modal body -->
					    <div class="modal-body">
					      <div class="form-group">
    						<label for="CompanyID">Company ID</label>
    						<input class="form-control" id="CompanyID">
  						  </div>
					    </div>

				        <!-- Modal footer -->
				        <div class="modal-footer">
				         <button type="button" class="btn btn-success" data-dismiss="modal">Enter</button>
				       	 <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				        </div>
   					 </div>
			     </div>
			  </div>

			  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalUp2">
  				Update Company
			  </button>

			  <div class="modal" id="myModalUp2">
 				  <div class="modal-dialog">
   					 <div class="modal-content">

	      				<!-- Modal Header -->
	      				<div class="modal-header">
	        				<h4 class="modal-title">Input Updated Company Details</h4>
	        				<button type="button" class="close" data-dismiss="modal">&times;</button>
	      				</div>

					    <!-- Modal body -->
					    <div class="modal-body">
					      <label for="CompanyID">Company ID</label>
						  <input class="form-control" id="CompanyID">
						  <label for="CompName">Updated Company Name</label>
						  <input class="form-control" id="CompName">
						  <label for="ComLink">Updated Link</label>
						  <input class="form-control" id="ComLink">
					    </div>

				        <!-- Modal footer -->
				        <div class="modal-footer">
				         <button type="button" class="btn btn-success" data-dismiss="modal">Update</button>
				       	 <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				        </div>
   					 </div>
			     </div>
			  </div>

			  <div class="table-responsive-sm" style="margin-top:20px">
				  <table id = "comtable" class="table table-striped table-bordered table-sm">
				  <col style="width:5%">
				  <col style="width:25%">
				  <col style="width:35%">
				  <col style="width:35%">
	    			<thead>
	      				<tr>
	      					<th>#</th>
	      					<th>Company ID</th>
		    				<th>Company</th>
		   					<th>Link</th>
	      				</tr>
	    			</thead>
	    			<tbody>

				    	<tr>
					    	<td><button type="button" class="btn btn-danger" onclick="deleteRow(this)">Untrack</button></td>
					    	<td>Cell</td>
					        <td>Cell</td>
					        <td>Cell</td>
					    </tr>

      					<tr>
	      					<td><button type="button" class="btn btn-danger" onclick="deleteRow(this)">Untrack</button></td>
	      					<td>Cell</td>
					        <td>Cell</td>
					        <td>Cell</td>
	     				</tr>

					    <tr>
					    	<td><button type="button" class="btn btn-danger" onclick="deleteRow(this)">Untrack</button></td>
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