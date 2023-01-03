<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Details</title>
</head>
<body>
<div><a href="/jobs">back to the shelfs</a></div>
<div class="container mt-5">
<h1><c:out value="${job.title}"></c:out></h1>

<h4> <c:out value="${job.description}"></c:out></h4>
<h4><c:out value="${job.location}"></c:out></h4>
 <h4><c:out value="${job.salary}"/></h4>
 <hr>
 
<c:if test ="${sessionScope.userId == job.user.id}">

<a href ="/jobs/edit/${job.id}">Edit</a>
<form action="/jobs/delete/${job.id}" method="post">
			<input type="hidden" name="_method" value="delete">
			<input type="submit" value="Delete">
</form>

</c:if>

</div>

</body>
</html>