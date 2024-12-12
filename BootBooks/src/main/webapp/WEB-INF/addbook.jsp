<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="my-styles.css">
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
			<div class="alert alert-primary" role="alert">
				<div class="col text-center">
					<h1 class="display-5">Add a New Book</h1>
					<p class="lead">Add your favorite book with all necessary
						details</p>
				</div>
			</div>
		</div>

		<!-- Book addition form -->
		<div class="row mb-5">
			<div class="col-md-6 offset-md-3">
				<form action="addBooks.do" method="POST" class="card p-4 shadow-sm ">
					<div class="p-3 bg-info bg-opacity-10 border border-info border-start-0.1 rounded-end">
						<div class="mb-3">
							<label for="bookTitle" class="form-label">Book Title</label> <input
								type="text" class="form-control" id="bookTitle" name="bookTitle"
								required><br>
							<br>
						</div>
						<div class="mb-3">
							<label for="author" class="form-label">Author</label> <input
								type="text" class="form-control" id="author" name="author"
								required><br>
							<br>
						</div>
						<div class="mb-3">
							<label for="genre" class="form-label">Genre</label> <input
								type="text" class="form-control" id="genre" name="genre"><br>
							<br>
						</div>
						<div class="mb-3">
							<label for="year" class="form-label">Year</label> <input
								type="number" class="form-control" id="year" name="year" min="1"><br>
							<br>
						</div>
						<button type="submit" class="btn btn-primary w-100">Add
							Book</button>
							</div>
				</form>
					</div>
			</div>
		</div>

		<!-- Show the added book if present -->
		<c:if test="${not empty book}">
			<h3>New Book Added</h3>
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card shadow-sm mb-3">
						<div class="card-body">
							<h5 class="card-title">${book.bookTitle}(${book.year})</h5>
							<p class="card-text">
								<strong>Author:</strong> ${book.author}
							</p>
							<p class="card-text">
								<strong>Genre:</strong> ${book.genre}
							</p>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</div>

	<div class="text-center mt-4">
		<a href="home.do" class="btn btn-outline-info">Back to Home</a>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>