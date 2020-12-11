<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/vendor/addons/datatables.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/vendor/addons/datatables.min.js"></script>
	<script src="js/tables.js"></script>
	<script src="js/main.js"></script>
	<link rel="stylesheet" href="css/main.css">
    <title>Tracker</title>

</head>

<body data-spy="scroll" data-target="#myScrollspy" data-offset="1">

	<%@ include file="navbar.jsp"%>
	<%@ include file="add_tracker.jsp"%>
	<%@ include file="update_tracker.jsp"%>
	<%@ include file="delete_tracker.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2">
				<nav class = "navbar" id="myScrollspy" style="background-color: #f7d6bf;">
				    <ul class="nav flex-column custom">
				      <li class="nav-item">
				        <a class="nav-link active" href="#Applications" style="color: #005086">Applications</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="#Assessments" style="color: #005086">Assessments</a>
				      </li>
				      <li class="nav-item">
				      	<a class="nav-link" href="#Companies" style="color: #005086">Companies</a>
				      </li>
				    </ul>
				    <hr class="d-sm-none">
		    	</nav>
			</div>
		    <div class="col-lg-9">
		    	<div class="body">	
	      	  <h2 class="display-4 text-left" id="title" style="padding-top: 20px;">Personal Tracker</h2>
	       	  <hr>
		      <br>
		      <p class="font-weight-light text-justify" style="line-height: 2;">
               Welcome ${name}, to your personal tracker! Here you'll keep track of the most important information you need throughout
               your job search. You can keep track of any application you pland on sending or have already sent it. For every application,
               you can keep track of it's deadline, if you got an interview, the industry, and more. Assessments let you track interviews, 
               tests and other types of assessments along with their date, location, and name of the assessor. Finally, track what companies 
               you want to apply to make sure you remember what you're interested in.
              </p>
              <br>
              <p class="font-weight-light text-justify" style="line-height: 2;">Use the buttons below to add to your tracker!</p>
		      <br>
		   	<div class = "tbtrack" id = "trackbuttons" style = "margin-top:-25px">
		      	<button type="button" class="btn btn-dark btn-md" data-toggle="modal" data-target="#myModalAdd">
	  				Track Item
				</button>
				<button type="button" class="btn btn-dark btn-md" data-toggle="modal" data-target="#myModalUp">
	  				Update Item
				</button>
			</div>
			<hr>
			<br>
		      <div class="tbtrack" id="Applications">
		      <h4 class="display-6 text-left" style="margin-bottom:30px" ><i class="fas fa-copy fa-lg icon"></i> Applications</h4>
		      <h6 class="display-6 text-left">Displays all tracked application information.</h6>
				  <div class="table-responsive-sm" style="margin-top:20px">
					  <table id = "apptable" class="table table-striped table-bordered table-sm" cellspacing="0">
					  <col style="width:5%">
					  <col style="width:20%">
					  <col style="width:20%">
					  <col style="width:10%">
					  <col style="width:5%">
					  <col style="width:5%">
					  <col style="width:15%">
					  <col style="width:20%">
					  <col style="width:5%">
		    			<thead class="thead-dark">
		      				<tr>
			    				<th class="col">Application ID</th>
			   					<th class="col">Company</th>
			    				<th class="col">Link</th>
			    				<th class="col">Deadline</th>
			    				<th class="col">Interview Offered?</th>
			    				<th class="col">Job Offered?</th>
			    				<th class="col">Industry</th>
			    				<th class="col">Position</th>
			    				<th class="col">Delete</th>
		      				</tr>
		    			</thead>
		    			<tbody>
							<c:forEach items="${applications}" var="application">
						    <tr>
						        <td><c:out value="${application.getAppId()}"/></td>
						        <td><c:out value="${application.getCompany()}"/></td>
						        <td><c:out value="${application.getUrl()}"/></td>
						        <td><c:out value="${application.getDeadline()}"/></td>
						        <td><c:out value="${application.getInterview()}"/></td>
						        <td><c:out value="${application.getJob()}"/></td>
						        <td><c:out value="${application.getIndustry()}"/></td>
						        <td><c:out value="${application.getPosition()}"/></td>
						        <td>
						        	<a href="tracker?action=DeleteApp&appId=${application.getAppId()}" role="button" class="btn btn-danger">
							            Delete Application
							        </a>
						        </td>
						    </tr>
						    </c:forEach>
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
					  <col style="width:20%">
					  <col style="width:25%">
					  <col style="width:10%">
					  <col style="width:30%">
					  <col style="width:5%">
		    			<thead class="thead-dark">
		      				<tr>
			    				<th class="col">Assessment ID</th>
			    				<th class="col">Assessment Type</th>
			    				<th class="col">Date</th>
			    				<th class="col">Location</th>	
			    				<th class="col">Assessor Name</th>
			    				<th class="col">Delete</th>					
		      				</tr>
		    			</thead>
		    			<tbody>
							<c:forEach items="${assessments}" var="assessment">
						    <tr>
						        <td><c:out value="${assessment.getRoundId()}"/></td>
						        <td><c:out value="${assessment.getRoundType()}"/></td>
						        <td><c:out value="${assessment.getDateTime()}"/></td>
						        <td><c:out value="${assessment.getLocation()}"/></td>
						        <td><c:out value="${assessment.getAssessorName()}"/></td>
						        <td>
						        	<a href="tracker?action=DeleteRound&roundId=${assessment.getRoundId()}" role="button" class="btn btn-danger">
							            Delete Assessment
							        </a>
						        </td>
						    </tr>
						    </c:forEach>
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
				  <col style="width:20%">
				  <col style="width:25%">
				  <col style="width:35%">
				  <col style="width:15%">
				  <col style="width:5%">
	    			<thead class="thead-dark">
	      				<tr>
	      					<th class="col">Company ID</th>
		    				<th class="col">Company</th>
		   					<th class="col">Link</th>
		   					<th class="col">Connection Name</th>
		   					<th class="col">Delete</th>
	      				</tr>
	    			</thead>
	    			<tbody>
						<c:forEach items="${companies}" var="company">
						<tr>
					    	<td><c:out value="${company.getCompanyId()}"/></td>
					        <td><c:out value="${company.getName()}"/></td>
					        <td><c:out value="${company.getUrl()}"/></td>
					        <td><c:out value="${company.getConnection()}"/></td>
					        <td>
					        	<a href="tracker?action=DeleteCompany&companyId=${company.getComapnyId()}" role="button" class="btn btn-danger">
						            Delete Assessment
						        </a>
					        </td>
					    </tr>
						</c:forEach>
	    			</tbody>
	  			  </table>
	  		  </div>
	  		  </div>

   			</div>
		    </div>
		    <div class="col-lg-1"></div>
    	</div>
    </div>
</body>
</html>
