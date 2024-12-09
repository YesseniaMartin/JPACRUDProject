<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Book</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="my-styles.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.do">My Favorite Books</a>
  </div>
</nav>

<div class="container">
  <div class="row mb-4">
    <div class="col text-center">
      <h1 class="display-5">Delete Book</h1>
      <p class="lead">Delete Book</p>
    </div>
  </div>
  
 <div class="container mt-5">
    <h3>Book List</h3>
    <c:if test="${not empty book}">
      <table class="table table-striped table-hover">
        <thead>
          <tr>
          	<th>Book ID:</th>
            <th>Title:</th>
            <th>Author:</th>
            <th>Genre</th>
            <th>Year:</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="book" items="${book}">
            <tr>
              <td>${book.id}</td>
              <td>${book.bookTitle}</td>
              <td>${book.author}</td>
              <td>${book.year}</td>
              <td>
                <!-- Delete Book Form -->
                <form action="deleteBooks.do" method="POST" style="display:inline;">
                  <input type="hidden" name="bookId" value="${book.id}" />
                  <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                </form>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:if>

    <c:if test="${empty book}">
      <div class="alert alert-warning text-center">
        No books available to display.
      </div>
    </c:if>

  <div class="text-center mt-4">
    <a href="home.do" class="btn btn-secondary">Back to Home</a>
  </div>
</div>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>