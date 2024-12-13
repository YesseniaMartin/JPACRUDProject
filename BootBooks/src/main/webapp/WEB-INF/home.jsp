<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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

<div class="container">
  <div class="row">

    <!-- Left column: Forms and controls -->
    <div class="col-md-4">
      <!-- Find a Book by ID -->
      <div class="card mb-4">
      <div class="p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">
        <div class="card-header">Find a Book by ID</div>
        <div class="card-body">
          <form action="getBooks.do" method="GET" class="d-flex">
            <input type="text" name="bookId" class="form-control me-2" placeholder="Enter Book ID" required>
            <button type="submit" class="btn btn-primary">Show</button>
          </form>
          </div>
        </div>
      </div>

      <!-- Add Book -->
      <div class="card mb-4">
      <div class="p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">
   
        <div class="card-header">Add Book </div>
        <div class="card-body d-flex justify-content-end">
          <button class="btn btn-primary" onclick="window.location.href='addBookForm.do'">Add</button>
          </div>
          </div>
        </div>
 

      <!-- Delete Book -->
      <div class="card mb-4">
      <div class="p-3 bg-info bg-opacity-10 border border-info border-start-1 rounded-end">
      
        <div class="card-header">Delete Book</div>
       <div class="card-body d-flex justify-content-end">
          <button class="btn btn-primary" onclick="window.location.href='deleteBookForm.do'">Delete</button>
          </div>
          </div>
        </div>
      

      <!-- Update Book -->
      <div class="card">
      <div class="p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">
        <div class="card-header">Update Book by ID</div>
        <div class="card-body">
          <form action="editBookForm.do" method="GET" class="d-flex">
            <input type="text" name="bookId" class="form-control me-2" placeholder="Book ID" required>
            <button type="submit" class="btn btn-primary">Edit</button>
          </form>
          </div>
        </div>
      </div>
    </div>


    <!-- Right column: Book list table -->
    <div class="col-md-8">
    <div class="alert alert-primary" role="alert"> <h3>LIST OF BOOKS</h3></div>
      <c:if test="${not empty book}">
        <table class="table table-striped table-hover table-light-blue">
   		 <thead class="table-light-blue">
            <tr>
              <th>Book ID</th>
              <th>Title</th>
              <th>Author</th>
              <th>Genre</th>
              <th>Year</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="b" items="${book}">
              <tr>
                <td>${b.id}</td>
                <td><a href="getBooks.do?bookId=${b.id}">${b.bookTitle}</a></td>
                <td>${b.author}</td>
                <td>${b.genre}</td>
                <td>${b.year}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
       
      </c:if>
      <c:if test="${empty book}">
        <div class="alert alert-warning mt-3">No books available</div>
      </c:if>
    </div>

  </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>