<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function () {
	var timeDelay = 5000; 
	setTimeout( function (){
    		$(".view-content").removeClass("hide");
    		$(".loading").addClass("hide");
    	}, timeDelay);
});
</script>
</head>
<body>
	<%
		Integer id = (Integer) request.getSession().getAttribute("id"); 
	%>
	<sql:setDataSource var="mysql" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/DoAnCuoiKi?allowPublicKeyRetrieval=true&useSSL=false" user="root" password="root" />
	<sql:query dataSource="${mysql}" var="result">
        SELECT id, Title, Brief, DATE_FORMAT(CreatedDate, '%d/%m/%Y %H:%i') as CreatedDate from Content WHERE AuthorId = ?;
        <sql:param value="${id}" />
    </sql:query>
    <h2 class="loading">Loading</h2>
    <div class="view-content hide">
	<h1>View Content</h1>
    <hr style="border-color: #f3f3f3; margin: 12px 0;">
    <div id="form_profile">
        <div id="form_profile_title">
            View Content List
        </div>
        <form action="" method="post" id="form_profile_form">
            <table>
                <tr>
                    <td style="width:5%;text-align: center"><b>#</b></td>
                    <td style="width:30%"><b>Title</b></td>
                    <td style="width:35%"><b>Brief</b></td>
                    <td style="width:15%"><b>Create Date</b></td>
                    <td style="width:15%"><b>Action</b></td>
                </tr>
                <c:forEach var="row" items="${result.rows}">
				<tr>
					<td><c:out value="${row.id}" /></td>
					<td><c:out value="${row.Title}" /></td>
					<td><c:out value="${row.Brief}" /></td>
					<td><c:out value="${row.CreatedDate}" /></td>
					<td>
						<a href="editContent.tiles?contentID=<c:out value='${row.id}' />">
							<button class="btn btn-success btn-lg rounded-0 edit" type="button" data-toggle="tooltip" data-placement="top" title="Edit" id="editBtn" name="editBtn"><i class="fa fa-edit"></i></button>
						</a>
						<a href="deleteContent.jsp?contentID=<c:out value='${row.id}' />">
							<button class="btn btn-danger btn-lg rounded-0 delete" type="button" data-toggle="tooltip" data-placement="top" title="Delete"  id="deleteBtn" name="deleteBtn" value=""><i class="fa fa-trash"></i></button>
						</a>
					</td>
				</tr>
			</c:forEach>
            </table>
            </form>
        </div>
    </div>
</body>
</html>