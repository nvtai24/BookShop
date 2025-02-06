
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
                                <h1>List Book</h1>
                                <ol class="tg-breadcrumb">
                                    <li><a href="home">home</a></li>
                                    <li class="tg-active">Products</li>
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
            <main id="tg-main" class="tg-main tg-haslayout">
                <!--************************************
                                News Grid Start
                *************************************-->
                <div class="tg-sectionspace tg-haslayout">
                    <div class="container">
                        <div class="row">
                            <div id="tg-twocolumns" class="tg-twocolumns">
                                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-9 pull-right">
                                    <div id="tg-content" class="tg-content">
                                        <div class="tg-products">
                                            <div class="tg-sectionhead">
                                                <h2><span>People’s Choice</span>Bestselling Books</h2>
                                            </div>

                                            <div class="tg-productgrid">
                                                <div class="tg-refinesearch">
                                                    <span>showing 1 to 8 of 20 total</span>
                                                    <form class="tg-formtheme tg-formsortshoitems" action="list-book" method="GET">
                                                        <fieldset>
                                                            <div class="form-group">
                                                                <label for="sort">Sort by:</label>
                                                                <span class="tg-select">
                                                                    <select id="sort" name="sort" class="select">
                                                                        <option value="default">Default</option>
                                                                        <option value="priceAsc">Price: Low to High</option>
                                                                        <option value="priceDesc">Price: High to Low</option>
                                                                    </select>
                                                                </span>
                                                            </div>
                                                            <input value="${categoryId}" name="categoryId" hidden="">

                                                            <button type="submit" class="btn btn-success">Sort</button>
                                                        </fieldset>
                                                    </form>

                                                </div>


                                                <div class="tg-productgrid">
                                                    <h3>${mess}</h3>

                                                    <c:forEach items="${listBook}" var="book">
                                                        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3">
                                                            <div class="tg-postbook">
                                                                <figure class="tg-featureimg">
                                                                    <div class="tg-bookimg">
                                                                        <div class="tg-frontcover">
                                                                            <img src="${book.getImage()}" alt="image description">
                                                                        </div>
                                                                        <div class="tg-backcover">
                                                                            <img src="${book.getImage()}" alt="image description">
                                                                        </div>
                                                                    </div>
                                                                    <c:if test="${book.quantityInStock == 0}">
                                                                        <a class="tg-btnaddtowishlist" href="javascript:void(0);">
                                                                            <i class="icon-heart"></i>
                                                                            <span> Cannot add cart</span>
                                                                        </a>              
                                                                    </c:if>
                                                                </figure>
                                                                <div class="tg-postbookcontent">
                                                                    <ul class="tg-bookscategories">
                                                                        <li><a href="javascript:void(0);">${book.categoryId.categoryName}</a></li>
                                                                    </ul>
                                                                    <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                                                                    <div class="tg-booktitle">
                                                                        <h3><a href="book-detail?bookId=${book.getBookId()}">${book.title}</a></h3>
                                                                    </div>
                                                                    <span class="tg-bookwriter">By:
                                                                        <c:forEach var="author" items="${book.listAuthor}" varStatus="status">
                                                                            <a href="javascript:void(0);">${author.authorName}</a>
                                                                            <c:if test="${!status.last}">, </c:if>
                                                                        </c:forEach>
                                                                    </span>
                                                                    <span class="tg-stars">
                                                                        <c:forEach var="star" begin="1" end="${book.rating}">
                                                                            <i class="fa fa-star" style="color: gold;"></i>
                                                                        </c:forEach>
                                                                        <c:forEach var="star" begin="${book.rating + 1}" end="5">
                                                                            <i class="fa fa-star-o"></i>
                                                                        </c:forEach>
                                                                    </span>
                                                                    <span class="tg-bookprice"><ins>$${book.price}</ins></span>
                                                                    <c:if test="${book.quantityInStock != 0}">
                                                                        <form action="cart" method="post">
                                                                            <input hidden="" title="text" name="bookId" value="${book.getBookId()}">
                                                                            <input type="submit" value="Add to cart" style="border: none; background: none">
                                                                        </form>
                                                                    </c:if>



                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>

                                                <!-- Pagination Controls -->
                                                <nav aria-label="Page navigation">
                                                    <ul class="pagination">
                                                        <c:if test="${currentPage > 1}">
                                                            <li>
                                                                <a href="list-book?page=${currentPage - 1}&pageSize=${pageSize}&sort=${sort}&categoryId=${categoryId}" aria-label="Previous">
                                                                    <span aria-hidden="true">&laquo;</span>
                                                                </a>
                                                            </li>
                                                        </c:if>
                                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                                            <li class="${i == currentPage ? 'active' : ''}">
                                                                <a href="list-book?page=${i}&pageSize=${pageSize}&sort=${sort}&categoryId=${categoryId}">${i}</a>
                                                            </li>
                                                        </c:forEach>
                                                        <c:if test="${currentPage < totalPages}">
                                                            <li>
                                                                <a href="list-book?page=${currentPage + 1}&pageSize=${pageSize}&sort=${sort}&categoryId=${categoryId}" aria-label="Next">
                                                                    <span aria-hidden="true">&raquo;</span>
                                                                </a>
                                                            </li>
                                                        </c:if>
                                                    </ul>
                                                </nav>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 pull-left">
                                    <aside id="tg-sidebar" class="tg-sidebar">
                                        <div class="tg-widget tg-catagories">
                                            <div class="tg-widgettitle">
                                                <h3>Categories</h3>
                                            </div>
                                            <div class="tg-widgetcontent">
                                                <ul>
                                                    <c:forEach var="listCategory" items="${countBookInCategory}">
                                                        <li><a  href="list-book?categoryId=${listCategory.getCategoryId()}">
                                                                <span>${listCategory.getCategoryName()}</span>
                                                                <em>${listCategory.getBookCount()}</em></a>
                                                        </li>

                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>

                                    </aside>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--************************************
                                News Grid End
                *************************************-->
            </main>
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