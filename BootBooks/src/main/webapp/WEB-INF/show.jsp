<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
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

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">

      <!-- Check if book is available -->
      <c:if test="${not empty book}">
        <div class="card shadow-sm">
          <div class="card-body">
            <h4 class="card-title">${book.bookTitle}</h4>
            <h6 class="card-subtitle mb-2 text-muted">${book.author}</h6>
            <p class="card-text">
              Genre: <strong>${book.genre != null ? book.genre : 'N/A'}</strong><br>
              Year: <strong>${book.year != null ? book.year : 'N/A'}</strong><br>
            </p>
            <hr>
            <p class="card-text"><small class="text-muted">ID: ${book.id}</small></p>
          </div>
        </div>
      </c:if>

      <!-- If no book found -->
      <c:if test="${empty book}">
        <div class="alert alert-warning text-center" role="alert">
          No book found with the given ID. <a href="home.do" class="alert-link" style="color: ba1a1aff;">Go back</a>.
        </div>
      </c:if>

    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>