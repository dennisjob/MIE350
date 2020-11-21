<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="js/main.js"></script>
<link rel="stylesheet" href="css/main.css">
<title>On-Track</title>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="100">
    <nav class="navbar navbar-expand-lg" style="padding-top: 25px; padding-bottom: 25px; background-color: #b0cac7; box-shadow: 0px 12px 10px -5px rgba(0,0,0,0.15);">
        <a class="navbar-brand" href="#">
            <img src="img/logo.png" alt="Logo" style="height: 56px; width: 245px;">
        </a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="fas fa-chevron-circle-down fa-lg" style="color: #001244;"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item" style="padding-right:200px;"><a class="nav-link" href="#home" style="color: #005086"><i class="fas fa-home"></i> Welcome</a></li>
                <li class="nav-item" style="padding-right:200px;"><a class="nav-link" href="#sign_in" style="color: #005086"><i class="fas fa-sign-in-alt"></i> Sign In</a> </li>
                <li class="nav-item"><a class="nav-link" href="#about" style="color: #005086"><i class="fas fa-users"></i> About Us</a></li>
            </ul>
        </div>
    </nav>
    <div id="home" class="container-fluid">
        <div class="row" style="padding-top: 50px; padding-bottom: 25px;">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <h1 class="display-2 text-center">On-Track</h1>
                <br>
                <h4 class="text-center">An Online Tracker that Supports and Connects Students Through their Job Search</h4>
                <hr>
                <br>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="align-middle" style="display: inline-block;">
                            <div class="top-border mb-4"></div>
                            <p class="font-weight-light text-justify" style="line-height: 2;">
                                Welcome to your online job application tracker! Toronto is one of the fastest growing cities in
                                North America, ensuring a growing economy. The 2019 Toronto Employment Survey found a
                                3% increase in total jobs from the previous year [1]. For students, a robust job market represents
                                a real oppurtunity to join firms that are "largely seeking to attract younger employees" and create energetic
                                working environments [1]. 
                            </p> 
                            <div class="bottom-border mt-4"></div>
                        </div>
                        
                    </div>
                    <div class="col-lg-6">
                        <img class="shadow img-fluid" src="img/toronto.jpg" style="width: 440px; height: 293; display: block; margin-left: auto; margin-right: auto;">
                    </div>
                </div>
                <br>
                <br>
                <div class="row">
                    <div class="col-lg-6">
                        <img class="shadow img-fluid align-middle" src="img/survey.PNG" style="width: 440px; height: 293; display: inline-block; margin-left: auto; margin-right: auto;">
                    </div>
                    <div class="col-lg-6">
                        <div class="top-border mb-4"></div>
                        <p class="font-weight-light text-justify" style="line-height: 2;">
                            On-Track is an online community site that aims to provide support for a special interest community:
                             university students and new graduates who are job seeking. To get a better understanding of the needs of
                            this community, we sent out a survey to engineering students at the University of Toronto [2]. The results of 
                            the survey indicate that most students feel they miss out on job oppurtunities and that they would find it
                            helpful to exchange information about job seeking with friends. The survey also helped the team identify a current
                            gap in services that allow students to track important information on their job search such as companies, applications and assesments.
                        </p> 
                        <div class="bottom-border mt-4"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-1"></div>
        </div>
    </div>
    <div id="sign_in" class="container-fluid" style="background-color: #f7d6bf;">
        <div class="col justify-content-center" style="padding-top: 20px;">
            <h1 class="display-4 text-center">Join Us</h1>
            <br>
            <p class="font-weight-light" style="line-height: 2;">
                On-Track connects you to your peers and friends using groups! Groups let you share job-search information and view what
                other group memebers are sharing through posts. In addition to keeping you connected through your job search, On-Track
                also provides you with the ability to track and update application, companies, and assesments throughout your job search. Finally,
                we build a personal dashboard that displays key performance indicators that let you know how well your job search is going and
                provides you with some resources to boost your presence in the job market. 
            </p>
            <p class="font-weight-light text-center" style="line-height: 2;">
                Join our online platform to begin tracking your job applications and sharing your search with friends!
                Register below or sign in if you have already created an account.
            </p>
        </div>
        <div class="row" style="padding-top: 15px; padding-bottom: 20px;">
            <div class="col-lg-1"></div>
            <div class="col-lg-5">
                <img class="shadow img-fluid text-center" src="img/interview.jpg" style="width: 440px; height: 293; display: block; margin-left: auto; margin-right: auto;">
            </div>
            <div class="col-lg-5">
                <span class="vertical-center">
                    <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#register">
                        Register
                    </button>
                    <span style="padding-right: 10px;"></span>
                    <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#signin">
                        Sign In
                    </button>
                </span>
            </div>
            <div class="col-lg-1"></div>
        </div>
    </div>
    <div id="about" class="container-fluid">
        <div class="row" style="padding-top: 50px;">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <h1 class="display-4 text-center">About the Project</h1>
                <br>
                <p class="font-weight-light text-justify" style="line-height: 2;">
                    On-Track was designed and built by a team of 7 third-year industrial engineering students at the
                    University of Toronto as a project for MIE350: Design and Analysis of Information Systems. As an 
                    undergraduate term project, On-Track is not professionally developed and will not be available for public use.
                    Please be cautious when entering private or sensitive data into the system.
                </p>
            </div>
            <div class="col-lg-1"></div>
        </div>
    </div>
    <hr>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <h5>References</h5>
                <p class="font-weight-light text-justify" style="line-height: 2;">
                    [1] <a class="link" href="https://www.toronto.ca/wp-content/uploads/2020/01/9453-Toronto-Employment-Survey-2019-Bulletin.pdf" style="color: #005086" target="_blank">Toronto Employment Survey 2019</a>
                </p>
                <p class="font-weight-light text-justify" style="line-height: 2;">
                    [2] <a class="link" href="https://docs.google.com/forms/d/1ZRdcs06ZJu1QeHeoM8_M03aWwVybJnEH5mF_CS_WqZY/edit?usp=sharing" style="color: #005086" target="_blank">Job Search Survey</a>
                </p>
            </div>
            <div class="col-lg-1"></div>
        </div>
    </div>
    <div class="modal fade" id="register">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Register an Account</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="#" class="register" oninput='con_pwd.setCustomValidity(con_pwd.value != pwd.value ? "Passwords do not match." : "")' novalidate>
                        <div class="form-group">
                            <label for="email">E-Mail:</label>
                            <input type="text" class="form-control" id="email" placeholder="Enter e-mail" name="email" required>
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill out this field.</div>
                        </div>
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" required>
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill out this field.</div>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill out this field.</div>
                        </div>
                        <div class="form-group">
                            <label for="con_pwd">Confirm Password:</label>
                            <input type="password" class="form-control" id="con_pwd" placeholder="Confirm password" name="con_pswd">
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Passwords do not match.</div>
                        </div>
                        <button type="submit" class="btn btn-primary">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="signin">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Sign In</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="#" class="sign_in" novalidate>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
                        <div class="valid-feedback">Valid.</div>
                        <div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                    <button type="submit" class="btn btn-primary">Sign In</button>
                </form>
            </div>
          </div>
        </div>
    </div>
</body>
</html>