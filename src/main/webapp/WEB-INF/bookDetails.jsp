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
</head>
<body>
<div><a href="/books">back to the shelfs</a></div>
<div class="container mt-5">
<h1><c:out value="${book.title}"></c:out></h1>

<h4> <c:out value="${userName}"/> read <c:out value="${book.title}"></c:out>
 by <c:out value="${book.author}"></c:out></h4>
 
 <p>Here are <c:out value="${userName}"/> 's thoughts
 
 <hr>
 <c:out value="${book.thoughts}"/>
 <hr>
 
<c:if test ="${sessionScope.userId == book.user.id}">

<a href ="/books/edit/${book.id}">Edit</a>
<form action="/books/delete/${book.id}" method="post">
			<input type="hidden" name="_method" value="delete">
			<input type="submit" value="Delete">
</form>



</c:if>



</div>

</body>
</html>