<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- MDBootstrap Datatables  -->
        <link href="css/vendor/addons/datatables.min.css" rel="stylesheet">
        <!-- MDBootstrap Datatables  -->
        <script type="text/javascript" src="js/vendor/addons/datatables.min.js"></script>
        <script src="js/tables.js"></script>
    </head>
      
    <title>Groups</title>
    <%@ include file="add_group.jsp" %>
    <%@ include file="add_post.jsp" %>
    
    <body>
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
                    <h2 class="display-4 text-left" id="title">My Groups</h2>
                    <hr>
                    <div class="tbtrack" id="Groups">
                        <h4 class="display-6 text-left" style="margin-bottom:30px"><i class="fas fa-comments"></i> Group: ${curGroup.getName() }
                        </h4>
                        <br>
                        <p>
                        Welcome to your group! Here you can view what your friends are sharing about their job search and share information that you think can be
                        useful to them. If you want to let other people in the group access code is ${curGroup.getAccessCode() }.
                        </p>
                        <h6 class="display-6 text-left">Recent posts in your group!</h6>
                        <button type="button" class="btn btn-dark btn-md" data-toggle="modal" data-target="#PostsAdd">
	  						Make a Post
						</button>
						<br>
						<br>
                        <table id="GroupTable" class="table table-striped table-bordered" cellspacing="0">
                            <col style="width:10%">
                            <col style="width:5%">
                            <col style="width:80%">
                            <col style="width:5%">
                            <thead class="thead-dark">
                                <tr>
                                    <th class="col">Poster</th>
                                    <th class="col">Time</th>
                                    <th class="col">Body</th>
                                    <th class="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${posts}" var="post">
                            	<tr>
                            		<td><c:out value="${post.getAuthorName()}"/></td>
                            		<td><c:out value="${post.getPostedTime()}"/></td>
                            		<td><c:out value="${post.getContent()}"/></td>
                            		<td>
                            		<c:if test="${userId == post.getAuthorId()}">
                            			<a href="posts?action=delete&groupId=${curGroup.getGroupId()}&postId=${post.getPostId()}" role="button" class="btn btn-danger">
							            Delete Post
							            </a>	
                            		</c:if>
                            		</td>
                            	</tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-1"></div>
			</div>
        </div>
    </body>
</html>