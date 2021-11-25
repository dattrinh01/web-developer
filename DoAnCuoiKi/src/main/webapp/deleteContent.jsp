<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DeleteContent</title>
</head>
<body>
	<sql:setDataSource var="mysql" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/DoAnCuoiKi?allowPublicKeyRetrieval=true&useSSL=false" user="root" password="root" />
	<sql:update dataSource="${mysql}" var="result">
		DELETE FROM Content WHERE id = ?;
		<sql:param value="${param.contentID}"/>
	</sql:update>
	<jsp:forward page="viewContent.tiles"/>
</body>
</html>