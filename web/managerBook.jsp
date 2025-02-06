
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html class="no-js" lang="">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>List Book</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/transitions.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/color.css">
        <link rel="stylesheet" href="css/responsive.css">
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <body>

        <div id="tg-wrapper" class="tg-wrapper tg-haslayout">
            <!--************************************
                            Header Start
            *************************************-->
            <jsp:include page="header.jsp" />
            <!--************************************
                            Header End
            *************************************-->
            <!--************************************
                            Inner Banner Start
            *************************************-->
            <div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner" data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-07.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="tg-innerbannercontent">
                                <h1>Manager Book</h1>
                                <ol class="tg-breadcrumb">
                                    <li><a href="home">home</a></li>
                                    <li class="tg-active">Manager Book</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--************************************
                            Inner Banner End
            *************************************-->
            <!--************************************
                            Main Start
            *************************************-->
    <div class="container">
        <h1>List Books</h1>
        <a class="btn btn-primary" href="addNewBook">Add new book</a>

        <!-- Table to display books -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Category</th>
                    <th>Title</th>
                    <th>Rating</th>
                    <th>Price</th>
                    <th>View Count</th>
                    <th>Quantity in Stock</th>
                    <th>Quantity Sold</th>
                    <th>Release Date</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listBook}" var="book">
                    <tr>
                        <td>${book.getBookId()}</td>
                        <td>${book.categoryId.categoryName}</td>
                        <td>${book.title}</td>
                        <td>${book.rating}</td>
                        <td>${book.price}</td>
                        <td>${book.viewCount}</td>
                        <td>${book.quantityInStock}</td>
                        <td>${book.quantitySold}</td>
                        <td>${book.releaseDate}</td>
                        <td>${book.description}</td>
                        <td><img src="${book.image}" alt="Book Image" style="max-width: 100px;"></td>
                        <th>
                            <a class="btn btn-warning" href="editBook?bookId=${book.getBookId()}">Edit</a>
                            <a class="btn btn-danger" href="delete?bookId=${book.getBookId()}&delete=deleteBook">Delete</a>
                        </th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Pagination controls -->
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${currentPage > 1}">
                    <li>
                        <a href="manager-book?page=${currentPage - 1}&pageSize=${pageSize}&sort=${sort}&categoryId=${categoryId}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="${i == currentPage ? 'active' : ''}">
                        <a href="manager-book?page=${i}&pageSize=${pageSize}&sort=${sort}&categoryId=${categoryId}">${i}</a>
                    </li>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <li>
                        <a href="manager-book?page=${currentPage + 1}&pageSize=${pageSize}&sort=${sort}&categoryId=${categoryId}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>

    </div>
            <!--************************************
                            Main End
            *************************************-->
            <!--************************************
                            Footer Start
            *************************************-->
            <jsp:include page="footer.jsp" />
            <!--************************************
                            Footer End
            *************************************-->
        </div>
        <!--************************************
                        Wrapper End
        *************************************-->
        <script src="js/vendor/jquery-library.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="https://maps.google.com/maps/api/js?key=AIzaSyCR-KEWAVCn52mSdeVeTqZjtqbmVJyfSus&amp;language=en"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.vide.min.js"></script>
        <script src="js/countdown.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/parallax.js"></script>
        <script src="js/countTo.js"></script>
        <script src="js/appear.js"></script>
        <script src="js/gmap3.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>