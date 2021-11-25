 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<div id="header">
    <ul id="header_nav">
        <li id="header_name">CMS</li>
        <li id="header_user_btn">
            <a href="userProfile.tiles" class="userButton">
                <i class="fas fa-user"></i><i class="fas fa-caret-down"></i>
            </a>
            <ul class="subnav">
                <li><a href="userProfile.tiles"><i class="fas fa-user"></i> User Profile</a></li>
                <li><a href="login.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </li>
    </ul>
</div>