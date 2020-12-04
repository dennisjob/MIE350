<nav class="navbar navbar-expand-lg" style="padding-top: 25px; padding-bottom: 25px; background-color: #b0cac7; box-shadow: 0px 12px 10px -5px rgba(0,0,0,0.15);">
    <a class="navbar-brand" href="#">
        <img src="img/logo.png" alt="Logo" style="height: 56px; width: 245px;">
    </a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="fas fa-chevron-circle-down fa-lg" style="color: #001244;"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <li class="nav-item" style="padding-right:120px;"><a class="nav-link" href="" style="color: #005086"><i class="fas fa-globe"></i> My Groups</a></li>
            <li class="nav-item" style="padding-right:120px;"><a class="nav-link" href="tracker" style="color: #005086"><i class="fas fa-tasks"></i> Job Tracker</a> </li>
            <li class="nav-item" style="padding-right:120px;"><a class="nav-link" href="dashboard.jsp" style="color: #005086"><i class="fas fa-chart-bar"></i> Performance Dashboard</a></li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" style="color: #005086">
                    <i class="fas fa-cog"></i>
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="LogoutServlet">Sign Out</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% session.setAttribute("userId", request.getAttribute("userId")); %>