<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5" > 
<h1>Welcome! <c:out value="${userName}"/></h1>

   <p><a href="/logout">Logout</a></p>
   <p> <a href="/books/new">Add a Book to my Shelf</a></p>
   <table class="table">
<thead>
      <tr>
          <th>ID</th>
          <th>Title</th>
          <th>Author</th>
          <th>Posted By</th>
         </tr>
</thead>
<tbody>
  <c:forEach var="book" items="${bookList}">
			<tr>
			    <td> ${book.id} </td>
				<td><a href="/books/show/${book.id}"> <c:out value="${book.title}"/></a></td>				
				<td><c:out value="${book.author}"/></td>
				<td><c:out value="${book.user.userName}"/></td>				
			</tr>
	</c:forEach>
  </tbody>
</table>
   
   
   
   
   </div>
</body>
  
</html>
