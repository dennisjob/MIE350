<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%-->
<html lang="en">
<!-- IMPORTS-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
        integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="datatables.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- MDBootstrap Datatables  -->
    <link href="css/vendor/addons/datatables.min.css" rel="stylesheet">
    <!-- MDBootstrap Datatables  -->
    <script type="text/javascript" src="js/addons/datatables.min.js"></script>
    <script src="js/vendor/addons/datatables.min.js"></script>
</head>
  
<title>Groups</title>
<%@ include file="add_group.jsp" %>

<body>
<!-- TOP NAV BAR -->
<%@ include file="navbar.jsp"%>
    <div class="container-fluid">
        <div class=" row">
            <div class="col-lg-2">
				<!--SIDE NAV BAR FORMATTING-->
				<nav class="navbar" id="navbar bg-light" style="background-color: #F7D6BF;">
				    <div>
				    <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#GroupsAdd">Add a Group <i class="fas fa-plus"></i></button>
				    </div>
				    <div>
				    <!-- SIDE NAV BAR CONTENTS-->
				    <hr>
				    <ul class="navbar-nav">
				    <c:forEach items="${groups}" var="group">
				        <li class="nav-item">
				            <a class="nav-link" href="groups?action=listPosts&groupId=${group.getGroupId()}">
				            ${group.getName()}
				            </a>
				            <a href="groups?action=delete&groupId=${group.getGroupId()}" role="button" class="btn btn-danger">
				            Delete Group <i class="fas fa-ellipsis-h"></i>
				            </a>
				            <hr>
				        </li>
				    </c:forEach>
				    </ul> 
				    </div>       
				</nav>
			</div>
            <!-- GROUPS SECTION-->
            <div class="col-lg-9">
                <h2 class="display-4 text-left" id="title">Groups</h2>
                <hr>
				<%if ((request.getAttribute("error") != "none")) { %>
            	<div class="alert alert-danger alert-dismissible fade show">
				    <button type="button" class="close" data-dismiss="alert">&times;</button>
				    <strong>${error }</strong>
				</div>
            	<% } %>
                <div class="tbtrack" id="Groups">
                    <h4 class="display-6 text-left" style="margin-bottom:30px"><i class="fas fa-comments"></i> Your
                        Groups
                    </h4>
                    <h6 class="display-6 text-left">Select a group to see recent posts!</h6>
                </div>
            </div>
            <div class="col-lg-1"></div>
            <hr>
            <br>
        </div>
   </div>
</body>
</html>