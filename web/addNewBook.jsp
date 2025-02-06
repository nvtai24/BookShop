<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Book</title>
    
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Your Custom CSS -->
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<div id="tg-wrapper" class="tg-wrapper tg-haslayout">
    <!-- Header -->
    <%@ include file="header.jsp" %>

    <!-- Inner Banner -->
    <div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner"
         data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll"
         data-image-src="images/parallax/bgparallax-07.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="tg-innerbannercontent">
                        <h1>Manager Book</h1>
                        <ol class="tg-breadcrumb">
                            <li><a href="home">Home</a></li>
                            <li class="tg-active">Manager Book</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Add New Book</div>
                    <div class="card-body">
                        <form action="addNewBook" method="POST">
                            <div class="form-group">
                                <label for="title">Title:</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                            </div>
                            <div class="form-group">
                                <label for="categoryId">Category ID:</label>
                                <select class="form-control" id="categoryId" name="categoryId">
                                    <c:forEach items="${listC}" var="category">
                                        <option value="${category.getCategoryId()}">${category.getCategoryName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="rating">Rating:</label>
                                <select class="form-control" id="rating" name="rating">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="price">Price:</label>
                                <input type="number" class="form-control" id="price" name="price" step="0.01" required>
                            </div>
                            <div class="form-group" id="authorsContainer">
                                <label for="authors">Authors:</label>
                                <div class="author-input">
                                    <select class="form-control" id="authors" name="authors[]" required>
                                        <c:forEach items="${listAllAuthor}" var="author">
                                            <option value="${author.getAuthorId()}">${author.getAuthorName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button type="button" class="btn btn-sm btn-primary mt-1" id="addAuthorBtn">Add Another Author</button>
                            </div>
                            <div class="form-group">
                                <label for="description">Description:</label>
                                <textarea class="form-control" id="description" name="description" rows="4" cols="50"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="image">Image URL:</label>
                                <input type="text" class="form-control" id="image" name="image">
                            </div>
                            <div class="form-group">
                                <label for="quantity_in_stock">Quantity in stock:</label>
                                <input type="number" class="form-control" id="quantity_in_stock" name="quantity_in_stock">
                            </div>
                            <button type="submit" class="btn btn-primary">Add Book</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

</div> <!-- End #tg-wrapper -->

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Your Custom JS -->
<script src="js/main.js"></script>

<script>
$(document).ready(function () {
    $('#addAuthorBtn').click(function () {
        var selectedAuthorId = $('#authors').val();
        var selectedAuthorName = $('#authors option:selected').text();

        // Check if the author is already selected
        if ($('#authorsContainer').find('select[name="authors[]"][value="' + selectedAuthorId + '"]').length > 0) {
            alert('This author is already selected.');
            return;
        }

        // Create a new select element for the chosen author
        var newAuthorHtml = '<div><select class="form-control" name="authors[]">'
                         + '<option value="' + selectedAuthorId + '">' + selectedAuthorName + '</option>'
                         + '</select></div>';
        $('#authorsContainer').append(newAuthorHtml);
    });
});

</script>

</body>
</html>
