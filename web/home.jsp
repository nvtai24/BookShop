

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html class="no-js" lang="">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Book Library</title>
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

        <!-- Thêm Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    </head>
    <body class="tg-home tg-homeone">

        <div id="tg-wrapper" class="tg-wrapper tg-haslayout">
            <!--************************************
                            Header Start
            *************************************-->


            <jsp:include page="header.jsp" />
            <!--************************************
                            Header End
            *************************************-->

            <!--************************************
                            Best Selling Start
            *************************************-->
            <section class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="tg-sectionhead">
                                <h2><span>People’s Choice</span>Bestselling Books</h2>
                                <a class="tg-btn" href="javascript:void(0);">View All</a>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div id="tg-bestsellingbooksslider" class="tg-bestsellingbooksslider tg-bestsellingbooks owl-carousel">
                                <c:forEach var="listBook" items="${listTop10SoldBook}">
                                    <div class="item" >
                                        <div class="tg-postbook tg-notag">
                                            <figure class="tg-featureimg">
                                                <div class="tg-bookimg">
                                                    <div class="tg-frontcover"><img src="${listBook.getImage()}" alt="image description"></div>
                                                    <div class="tg-backcover"><img src="images/books/img-05.jpg" alt="image description"></div>
                                                </div>
                                                <c:if test="${listBook.quantityInStock == 0}">
                                                    <a class="tg-btnaddtowishlist" href="javascript:void(0);">
                                                        <i class="icon-heart"></i>
                                                        <span> Cannot add cart</span>
                                                    </a>              
                                                </c:if>


                                                </figure>
                                                <div class="tg-postbookcontent">
                                                    <ul class="tg-bookscategories">
                                                        <li><a href="javascript:void(0);">${listBook.getCategoryId().getCategoryName()}</a></li>
                                                </ul>
                                                <div class="tg-booktitle">
                                                    <h3><a href="book-detail?bookId=${listBook.getBookId()}">${listBook.getTitle()}</a></h3>
                                                </div>
                                                <span class="tg-bookwriter">By: 
                                                    <c:forEach var="authorList" items="${listBook.getListAuthor()}" varStatus="status">
                                                        <a href="javascript:void(0);">
                                                            ${authorList.getAuthorName()}
                                                        </a>
                                                        <c:if test="${!status.last}">
                                                            ,
                                                        </c:if>
                                                    </c:forEach>

                                                </span>
                                                <span class="tg-stars">
                                                    <c:forEach var="star" begin="1" end="${listBook.getRating()}">
                                                        <i class="fa fa-star" style="color: gold;"></i>
                                                    </c:forEach>
                                                    <c:forEach var="star" begin="${listBook.getRating() + 1}" end="5">
                                                        <i class="fa fa-star-o"></i>
                                                    </c:forEach>
                                                </span>

                                                <span class="tg-bookprice">
                                                    <ins>$${listBook.getPrice()} </ins>
                                                </span>
                                                <a class="tg-btn tg-btnstyletwo" href="javascript:void(0);">
                                                    <i class="fa fa-shopping-basket"></i>
                                                    <form action="cart" method="post">
                                                        <input hidden="" title="text" name="bookId" value="${listBook.getBookId()}">
                                                        <input type="submit" value="Add to cart" style="border: none; background: none">
                                                    </form>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                </c:forEach>



                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--************************************
                            Best Selling End
            *************************************-->

            <!--************************************
                New Release Start
*************************************-->
            <section class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="tg-newrelease">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="tg-sectionhead">
                                    <h2><span>Taste The New Spice</span>New Release Books</h2>
                                </div>
                                <div class="tg-description">
                                    <p>On the latest bookshelf of the library, 
                                        the pages of brilliant books with unprecedented stories are waiting for the reader. 
                                        Each book is an open window with the world of energetic characters and relentless adventures. 
                                        The pages also have a new scent of printing, inviting us to enter the fictional worlds or learn from big thinkers.
                                        The new book is an endless source of inspiration, a bridge connected to knowledge and a loyal companion of readers.</p>
                                </div>
                                <div class="tg-btns">
                                    <a class="tg-btn tg-active" href="javascript:void(0);">View All</a>
                                    <a class="tg-btn" href="javascript:void(0);">Read More</a>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <div class="row">
                                    <div class="tg-newreleasebooks">
                                        <c:forEach var="listBook" items="${listTop3ReleaseDate}">
                                            <div class="col-xs-4 col-sm-4 col-md-6 col-lg-4">
                                                <div class="tg-postbook">
                                                    <figure class="tg-featureimg">
                                                        <div class="tg-bookimg">
                                                            <div class="tg-frontcover"><img src="${listBook.getImage()}" alt="image description"></div>
                                                            <div class="tg-backcover"><img src="${listBook.getImage()}" alt="image description"></div>
                                                        </div>
                                                        <a class="tg-btnaddtowishlist" href="javascript:void(0);">
                                                            <i class="icon-heart"></i>
                                                            <span>add to wishlist</span>
                                                        </a>
                                                    </figure>
                                                    <div class="tg-postbookcontent">
                                                        <ul class="tg-bookscategories">
                                                            <li><a href="javascript:void(0);">${listBook.getCategoryId().getCategoryName()}</a></li>
                                                        </ul>
                                                        <div class="tg-booktitle">
                                                            <h3><a href="book-detail?bookId=${listBook.getBookId()}">${listBook.getTitle()}</a></h3>
                                                        </div>
                                                        <span class="tg-bookwriter">By: 
                                                            <c:forEach var="authorList" items="${listBook.getListAuthor()}" varStatus="status">
                                                                <a href="javascript:void(0);">
                                                                    ${authorList.getAuthorName()}
                                                                </a>
                                                                <c:if test="${!status.last}">
                                                                    ,
                                                                </c:if>
                                                            </c:forEach></span>
                                                        <span class="tg-stars">
                                                            <c:forEach var="star" begin="1" end="${listBook.getRating()}">
                                                                <i class="fa fa-star" style="color: gold;"></i>
                                                            </c:forEach>
                                                            <c:forEach var="star" begin="${listBook.getRating() + 1}" end="5">
                                                                <i class="fa fa-star-o"></i>
                                                            </c:forEach>
                                                        </span>                                                    </div>
                                                </div>
                                            </div>

                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--************************************
                            New Release End
            *************************************-->
            <!--************************************
                            Collection Count Start
            *************************************-->
            <section class="tg-parallax tg-bgcollectioncount tg-haslayout" data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-04.jpg">
                <div class="tg-sectionspace tg-collectioncount tg-haslayout">
                    <div class="container">
                        <div class="row">
                            <div id="tg-collectioncounters" class="tg-collectioncounters">

                                <c:forEach var="category" items="${countBookInCategory}">
                                    <div class="tg-collectioncounter tg-fashion">
                                        <div class="tg-collectioncountericon">
                                            <i class="icon-star"></i>
                                        </div>
                                        <div class="tg-titlepluscounter">
                                            <h2>${category.getCategoryName()}</h2>
                                            <h3 data-from="0" data-to="${category.getBookCount()}" data-speed="8000" data-refresh-interval="50">${category.getBookCount()}</h3>
                                        </div>
                                    </div>
                                </c:forEach>




                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--************************************
                            Collection Count End
            *************************************-->
            <!--************************************
                            Picked By Author Start
            *************************************-->
            <section class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="tg-sectionhead">
                                <h2><span>Some Great Books</span>The most views</h2>
                                <a class="tg-btn" href="javascript:void(0);">View All</a>
                            </div>
                        </div>
                        <div id="tg-pickedbyauthorslider" class="tg-pickedbyauthor tg-pickedbyauthorslider owl-carousel">

                            <c:forEach var="listBook" items="${listTop10View}">


                                <div class="item">
                                    <div class="tg-postbook">
                                        <figure class="tg-featureimg">
                                            <div class="tg-bookimg">
                                                <div class="tg-frontcover"><img src="${listBook.getImage()}" alt="image description"></div>
                                            </div>
                                            <div class="tg-hovercontent">
                                                <strong class="tg-bookcategory">Category: ${listBook.getCategoryId().getCategoryName()}</strong>
                                                <strong class="tg-bookprice">Price: $${listBook.getPrice()} <br>
                                                    <span class="tg-stars" style="width: 100%">
                                                        <c:forEach var="star" begin="1" end="${listBook.getRating()}">
                                                            <i class="fa fa-star" style="color: gold;"></i>
                                                        </c:forEach>
                                                        <c:forEach var="star" begin="${listBook.getRating() + 1}" end="5">
                                                            <i class="fa fa-star-o"></i>
                                                        </c:forEach>
                                                    </span>  
                                                </strong>
                                                <strong class="tg-bookpage">
                                                    View: ${listBook.getViewCount()}                                         
                                                </strong>    

                                            </div>
                                        </figure>
                                        <div class="tg-postbookcontent">
                                            <div class="tg-booktitle">
                                                <h3><a href="book-detail?bookId=${listBook.getBookId()}">${listBook.getTitle()}</a></h3>
                                            </div>                                            <span class="tg-bookwriter">By: 
                                                <c:forEach var="authorList" items="${listBook.getListAuthor()}" varStatus="status">
                                                    <a href="javascript:void(0);">
                                                        ${authorList.getAuthorName()}
                                                    </a>
                                                    <c:if test="${!status.last}">
                                                        ,
                                                    </c:if>
                                                </c:forEach>    
                                            </span>
                                            <form action="cart" method="post">
                                                <input hidden="" title="text" name="bookId" value="${listBook.getBookId()}">
                                                <input type="submit" value="Add to cart" style="border: none; background: none">
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </div>
            </section>

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