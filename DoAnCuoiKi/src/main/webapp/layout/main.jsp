<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<title><tiles:getAsString name="title" /></title>
<link rel="shortcut icon" href="#">
<style type="text/css">
header {
	height: 44px;
}
.row:after {
	content: "";
	display: table;
	clear: both;
}
.menu {
	float: left;
	width: 280px;
	height: 100%;
}
.section {
	float: left;
	margin-left: 320px;
    margin-top: 20px;
	min-height: 500px;
}
</style>
</head>
<body>
	<header>
		<tiles:insertAttribute name="header" />
	</header>
	
	<div class="row">
		<div class="menu">
			<tiles:insertAttribute name="menu" />
		</div>
		<div class="section">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</body>
</html>