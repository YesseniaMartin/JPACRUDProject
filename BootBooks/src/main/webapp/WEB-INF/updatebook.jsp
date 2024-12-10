<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Book</title>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
				<h1 class="display-5">Update Book</h1>
				<p class="lead">Update Book Information Below</p>
			</div>
		</div>
	</div>
	<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">

      <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
      </c:if>

      <!-- Show form if 'book' is not empty -->
      <c:if test="${not empty book}">
        <div class="card p-4 shadow-sm">
          <form action="updateBook.do" method="POST">
            <input type="hidden" name="bookId" value="${book.id}" />

            <div class="mb-3">
              <label for="bookTitle" class="form-label">Book Title</label>
              <input type="text" class="form-control" id="bookTitle" name="bookTitle"
                     value="${book.bookTitle}" required>
            </div>

            <div class="mb-3">
              <label for="author" class="form-label">Author</label>
              <input type="text" class="form-control" id="author" name="author"
                     value="${book.author}" required>
            </div>

            <div class="mb-3">
              <label for="genre" class="form-label">Genre</label>
              <input type="text" class="form-control" id="genre" name="genre"
                     value="${book.genre}">
            </div>

            <div class="mb-3">
              <label for="year" class="form-label">Year</label>
              <input type="number" class="form-control" id="year" name="year"
                     value="${book.year}" min="1">
            </div>

            <button type="submit" class="btn btn-primary w-100">Update Book</button>
          </form>
        </div>

        <!-- Display updated book info after update -->
        <h3 class="mt-5">Updated Book Information</h3>
        <div class="card shadow-sm mt-3">
          <div class="card-body">
            <h5 class="card-title">
              ${book.bookTitle} <span class="text-muted">(${book.year})</span>
            </h5>
            <p class="card-text"><strong>Author:</strong> ${book.author}</p>
            <p class="card-text"><strong>Genre:</strong> ${book.genre}</p>
          </div>
        </div>
      </c:if>

      <!-- If no book found -->
      <c:if test="${empty book}">
        <div class="alert alert-warning text-center mt-3">
          No book found to update. <a href="home.do" class="alert-link">Go back</a>.
        </div>
      </c:if>
      
      <div class="text-center mt-4">
        <a href="home.do" class="btn btn-secondary">Back to Home</a>
      </div>

    </div>
  </div>
</div>
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>