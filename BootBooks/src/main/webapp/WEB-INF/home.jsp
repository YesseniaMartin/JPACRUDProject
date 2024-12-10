<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>My Favorite Books</title>
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

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="text-center mb-4">Find a Book by ID</h2>
            <form action="getBooks.do" method="GET" class="d-flex justify-content-center" style="display:inline;">
                <input type="text" name="bookId" class="form-control w-50 me-2" placeholder="Enter Book ID" required />
                <button type="submit" class="btn btn-primary">Show Book</button>
            </form>
        </div>
    </div>
</div>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6 text-center">
      <h2 class="text-center mb-4">Add Book To List</h2>
      <button class="btn btn-primary" onclick="window.location.href='addBookForm.do'">Add</button>
    </div>
  </div>
</div>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6 text-center">
      <h2 class="text-center mb-4">Delete Book</h2>
      <button class="btn btn-primary" onclick="window.location.href='deleteBookForm.do'">Delete</button>
    </div>
  </div>
</div>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6 text-center">
      <h2 class="text-center mb-4">Update Book by ID</h2>
      <form action="editBookForm.do" method="GET" class="d-flex justify-content-center" style="display:inline;">
        <input type="text" name="bookId" class="form-control w-50 me-2" placeholder="Book ID" required />
        <button type="submit" class="btn btn-primary">Edit Book</button>
      </form>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>