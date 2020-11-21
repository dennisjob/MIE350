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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.css">
<script src="js/main.js"></script>
<script src="js/charts.js"></script>
<link rel="stylesheet" href="css/main.css">
<title>On-Track: Performance Dashboard</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container-fluid" style="padding-top: 50px;">
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <div class="jumbotron shadow">
                    <div>
                        <h1 class="display-4 text-justify">Job Search Performance Dashboard</h1>
                        <hr>
                        <p class="text-justify">
                            Welcome to your job search performance dashboard! Here we have provide you with some
                            key performance indicators and summary statistics that will help you understand how effective
                            your job seeking is. Additionally we've assembled some resourse to ensure you're writing great resumes
                            and cover letters as well as performing highly in interviews.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-1"></div>
        </div>
        <div class="row" style="padding-top: 50px;">
            <div class="col-lg-1"></div>
            <div class="col-lg">
                <div class="des-stat">
                    <h2 style="height: 60px;"><small>Number of Tracked Applications</small></h2>
                    <br>
                    <div style="height: 80px;">
                        <p><span class="font-weight-bold">Past:</span> 32</p>
                        <p><span class="font-weight-bold">Upcoming:</span> 12</p>
                    </div>
                </div>
            </div>
            <div class="col-lg">
                <div class="des-stat">
                    <h2 style="height: 60px;"><small>Number of Tracked Assessments</small></h2>
                    <br>
                    <div style="height: 80px;">
                        <p><span class="font-weight-bold">Past:</span> 9</p>
                        <p><span class="font-weight-bold">Upcoming:</span> 3</p>                    
                    </div>
                </div>
            </div>
            <div class="col-lg">
                <div class="des-stat">
                    <h2 style="height: 60px;"><small>Number of Tracked Companies</small></h2>
                    <br>
                    <div style="height: 80px;">
                        <p><span class="font-weight-bold">Total:</span> 18</p>
                    </div>
                </div>
            </div>
            <div class="col-lg">
                <div class="des-stat">
                    <h2 style="height: 60px;"><small>Conversion Rate</small></h2>
                    <br>
                    <div style="height: 80px;">
                    <p><span class="font-weight-bold">Total: </span>3%</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-1"></div>
        </div>
        <div class="row" style="padding-top: 80px;">
            <div class="col-lg-1"></div>
            <div class="col-lg-5 align-center">
                <h2 class="text-center"><small>Top 5 Companies by Application Volume</small></h2>
                <canvas id="topCompanies" width="400" height="400"></canvas>
            </div>
            <div class="col-lg-5">
                <h4 class="text-center"><small>Top 5 Industries by Application Volume</small></h4>
                <canvas id="appsByInd"></canvas>
                <br>
                <h4 class="text-center"><small>Top 5 Industries by Interview Offer</small></h4>
                <canvas id="intByInd"></canvas>
            </div>
            <div class="col-lg-1"></div>
        </div>
        <div class="row" style="padding-top: 50px;">
            <div class="col-lg-1"></div>
            <div class="col-lg">
                <div class="des-stat" style="height: 100%;">
                    <h2><small>Upcoming Application Deadlines</small></h2>
                    <br>
                    <div>
                        <p><span class="font-weight-bold">Software Developer PEY Deloitte:</span> 2020/11/23</p>
                        <p><span class="font-weight-bold">Associate Consultant EY:</span> 2020/12/01</p>
                        <p><span class="font-weight-bold">Data Scientist BCG:</span> 2020/12/04</p>
                    </div>
                </div>
            </div>
            <div class="col-lg">
                <div class="des-stat" style="height: 100%;">
                    <h2><small>Upcoming Assessments</small></h2>
                    <br>
                    <div>
                        <p><span class="font-weight-bold">Environment Canada Interview:</span> 2020/11/20</p>
                        <p><span class="font-weight-bold">BMO Data Analyst Interview:</span> 2020/12/05</p> 
                        <p><span class="font-weight-bold">IBM Codality Test:</span> 2020/12/10</p>                   
                    </div>
                </div>
            </div>
            <div class="col-lg-1"></div>
        </div>
        <div class="row" style="padding-top: 80px;">
            <div class="col-lg-2"></div>
            <div class="col-lg">
                <h4 class="card-title">Resources to Boost your Job Search</h4>
                <hr>
                <p class="font-weight-light text-justify" style="line-height: 2;">
                    In order to help you be successful during your job search the On-Track team has gathered a list of 
                    resources on writing resumes and cover letters, and interviewing. The resources include guides, articles, 
                    and videos from student organizations and some of the largest companies in the world.
                </p> 
            </div>
            <div class="col-lg-2"></div>
        </div>
        <br>
        <div class="row" style="padding-bottom: 100px;">
            <div class="col-lg-1"></div>
            <div class="col-lg">
                <div class="card mx-auto" style="width:400px">
                    <img class="card-img-top" src="img/resume.jpg" alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">Resume and Cover Letter</h4>
                        <p class="card-text"><a class="link" href="https://cdn.cms-twdigitalassets.com/content/dam/careers-twitter/university/2018_Resume101.pdf" style="color: #005086" target="_blank"><i class="fab fa-twitter"></i> Twitter Resume Guide</a></p>
                        <p class="card-text"><a class="link" href="https://www.youtube.com/watch?v=yrtScvSzmk0&list=PLObwPhL-cU6hC2tJIc8YybME4R4RAy3hY&index=3&t=5s&ab_channel=GoogleStudents" style="color: #005086" target="_blank"><i class="fab fa-google"></i> Google's Resume Tips</a></p>
                        <p class="card-text"><a class="link" href="https://yncnuoft.medium.com/yncns-resume-guide-88915f0c4303" style="color: #005086" target="_blank">YNCN's Student Resume Guide</a></p>
                        <p class="card-text"><a class="link" href="https://yncnuoft.medium.com/yncns-student-cover-letter-guide-4f69f69dbadf" style="color: #005086" target="_blank">YNCN's Student Cover Letter Guide</a></p>
                    </div>
                </div>
            </div>
            <div class="col-lg">
                <div class="card mx-auto" style="width:400px">
                    <img class="card-img-top" src="img/interview.jpg" alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">Interviews</h4>
                        <p class="card-text"><a class="link" href="https://www.forbes.com/sites/jacquelynsmith/2013/01/11/how-to-ace-the-50-most-common-interview-questions/?sh=3e8605ef4624" style="color: #005086" target="_blank">Forbe's 50 Most Common Interview Questions</a></p>
                        <p class="card-text"><a class="link" href="https://www.youtube.com/watch?v=wwIysnVmAUg&t=" style="color: #005086" target="_blank"><i class="fab fa-google"></i> Google Coding Interview</a></p>
                        <p class="card-text"><a class="link" href="https://www.youtube.com/watch?v=lIuHpBq4jJw&ab_channel=GoogleStudents" style="color: #005086" target="_blank"><i class="fab fa-google"></i> Google's Business Interview Tips</a></p>
                        <p class="card-text"><a class="link" href="https://www.bain.com/careers/interview-prep/case-interview/" style="color: #005086" target="_blank">Bain Case Interview Prep</a></p>
                        <p class="card-text"><a class="link" href="https://yncnuoft.medium.com/yncns-student-interviewing-guide-417a69f913f4" style="color: #005086" target="_blank">YNCN's Student interviewing Guide</a></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-1"></div>
        </div>
    </div>
</body>
</html>