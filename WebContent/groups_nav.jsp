<!--SIDE NAV BAR FORMATTING-->
<nav class="navbar" id="navbar bg-light" style="background-color: #F7D6BF;">
    Add a Group
    <button type="button" class="fas fa-plus" data-toggle="modal" data-target="#GroupsAdd">
    </button>
    <!-- SIDE NAV BAR CONTENTS-->
    <ul class="navbar-nav">
    <c:forEach items="${groups}" var="group">
        <li class="nav-item">
            <a class="nav-link" href="groups?action=listPosts&groupId=${group.getGroupId()}">
            ${group.getName()}
            </a>
            <button type="button" class="fas fa-ellipsis-h" data-toggle="modal"
                data-target="#EditGroup">
            </button>
        </li>
    </c:forEach>
    </ul>       
</nav>