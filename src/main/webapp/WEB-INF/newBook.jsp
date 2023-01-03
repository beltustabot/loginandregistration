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
<title>Insert title here</title>
 <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
</head>
<body>
<div class="container mt-5">
   <h1>Add a Book to Your Shelf</h1>
   
   <form:form action="/books/new" method="Post" modelAttribute="book">
	<div>
		<form:label path="title">Title: </form:label><br />
		<form:errors path="title" class="text-danger"/>
		<form:input path="title" class="form-control"/>
	</div>

	<div>
		<form:label path="author">Author: </form:label><br />
		<form:errors path="author" class="text-danger"/>
		<form:input path="author" class="form-control"/>
	</div>	
	<div>
		<form:label path="thoughts">My Thoughts </form:label><br />
		<form:errors path="thoughts" class="text-danger"/>
		<form:textarea rows="6" path="thoughts" class="form-control"/>
	</div>
	<form:hidden path="user" value="${userId}" />
	<div>
		<input type="submit" value="Submit"/>
	</div>
</form:form>
</div>
<div><a href="/books">back to the shelfs</a></div>
</body>
</html>