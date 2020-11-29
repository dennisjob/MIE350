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
    <link href="css/addons/datatables.min.css" rel="stylesheet">
    <!-- MDBootstrap Datatables  -->
    <script type="text/javascript" src="js/addons/datatables.min.js"></script>
    <script src="datatables.min.js"></script>
</head>
  
<title>Groups</title>
<!-- TOP NAV BAR -->
<nav class="navbar navbar-expand-lg"
    style="padding-top: 25px; padding-bottom: 25px; background-color: #b0cac7; box-shadow: 0px 12px 10px -5px rgba(0,0,0,0.15);">
    <a class="navbar-brand" href="#">
        <img src="img/logo.png" alt="Logo" style="height: 56px; width: 245px;">
    </a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
        data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="fas fa-chevron-circle-down fa-lg" style="color: #001244;"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <li class="nav-item" style="padding-right:120px;"><a class="nav-link" href="" style="color: #005086"><i
                        class="fas fa-globe"></i> My Groups</a></li>
            <li class="nav-item" style="padding-right:120px;"><a class="nav-link" href="" style="color: #005086"><i
                        class="fas fa-tasks"></i> Job Tracker</a> </li>
            <li class="nav-item" style="padding-right:120px;"><a class="nav-link" href="" style="color: #005086"><i
                        class="fas fa-chart-bar"></i> Performance Dashboard</a></li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"
                    style="color: #005086">
                    <i class="fas fa-cog"></i>
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Sign Out</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<!-- EDIT GROUPS MODAL BUTTON-->
<!--
<button type="button" class="fas fa-ellipsis-h" data-toggle="modal"
data-target="#EditGroup">
</button>
-->

<!--EDIT GROUPS MODAL-->
<div class="modal" id="EditGroup">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Edit Group</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#EditGroup">
                    Delete Group
                </button>
                <!--TODO-->
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- ADD GROUP MODAL BUTTON-->
<!--
<button type="button" class="fas fa-plus" data-toggle="modal" data-target="#GroupsAdd">
</button>
-->

<!-- ADD GROUP MODAL-->
<div class="modal" id="GroupsAdd">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"></h4>
                <div class="container">
                    <h2>Edit Groups</h2>
                    <br>
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                      <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#CreateGroup">Create Group</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#JoinGroup">Join Group</a>
                      </li>
                    </ul>
                  
                    <!-- Tab panes -->
                    <div class="tab-content">
                      <div id="CreateGroup" class="container tab-pane active"><br>
                        <h3>Create Group</h3>
                        <p><form action="/action_page.php">
                            <div class="form-group">
                              <label for="GroupName">Start your own group!</label>
                              <input type="GroupName" class="form-control" placeholder="Enter Group Name" id="GroupName">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                          </form></p>
                      </div>
                      <div id="JoinGroup" class="container tab-pane fade"><br>
                        <h3>Join Group</h3>
                        <p><form action="/action_page.php">
                            <div class="form-group">
                              <label for="JoinGroup">Join a new Group!</label>
                              <input type="JoinGroup" class="form-control" placeholder="Enter Group Join Code" id="JoinGroup">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                          </form></div>
                    </div>
                  </div>
            </div>
        </div>
    </div>
</div>

<body data-spy="scroll" data-target="#myScrollspy" data-offset="1">
    <div class="container-fluid">
        <div class=" row">
            <!--SIDE NAV BAR FORMATTING-->
            <nav class="col-sm-1" id="navbar bg-light" style="background-color: #F7D6BF;">
                <ul class="nav nav-pills flex-column custom" style="margin-top:30px">
                    Add a Group<button type="button" class="fas fa-plus" data-toggle="modal" data-target="#GroupsAdd">
                    </button>
                    <!-- SIDE NAV BAR CONTENTS-->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#Group1">Group 1
                                <button type="button" class="fas fa-ellipsis-h" data-toggle="modal"
                                data-target="#EditGroup">
                            </button>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#Group2">Group 2 <button type="button" class="fas fa-ellipsis-h"
                                    data-toggle="modal" data-target="#EditGroup">
                                </button></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#Group3">Group 3 <button type="button" class="fas fa-ellipsis-h"
                                    data-toggle="modal" data-target="#EditGroup">
                                </button></a>
                        </li>
                    </ul>
            </nav>
            <!-- GROUPS SECTION-->
            <div class="col-sm-11">
                <h2 class="display-4 text-left" id="title">Groups</h2>
                <hr>

                <div class="tbtrack" id="Groups">
                    <h4 class="display-6 text-left" style="margin-bottom:30px"><i class="fas fa-comments"></i> Your
                        Groups
                    </h4>
                    <h6 class="display-6 text-left">Select a group to see recent posts!</h6>
                </div>
            </div>
            <hr>
            <br>
        </div>
</body>
</html>