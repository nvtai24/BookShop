
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">
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
                                <h1>Book Detail</h1>
                                <ol class="tg-breadcrumb">
                                    <li><a href="home">home</a></li>
                                    <li><a href="list-book">Book</a></li>
                                    <li class="tg-active">Book: ${book.getTitle()}</li>
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


                                        <div class="tg-productdetail">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                    <div class="tg-postbook">
                                                        <figure class="tg-featureimg"><img src="${book.getImage()}" alt="image description"></figure>
                                                        <div class="tg-postbookcontent">
                                                            <span class="tg-bookprice">
                                                                <ins>$${book.getPrice()}</ins>
                                                            </span>
                                                            <ul class="tg-delevrystock">
                                                                <li><i class="icon-rocket"></i><span>View: ${book.getViewCount()}</span></li>
                                                                <li><i class="icon-checkmark-circle"></i><span>Dispatch from the USA in 2 working days </span></li>
                                                                <li><i class="icon-store"></i><span>Status: <em>${book.getQuantityInStock()} books left in stock</em></span></li>
                                                            </ul>
                                                            <c:if test="${book.getQuantityInStock() != 0}">
                                                                <form action="cart" method="post">
                                                                    <input hidden type="hidden" name="bookId" value="${book.getBookId()}">
                                                                    <div class="input-group" style="display: inline-flex">
                                                         
                                                                        <div class="input-group-prepend">
                                                                            <button class="btn btn-outline-secondary" type="button" id="minusBtn">-</button>
                                                                        </div>
                                                                        <input type="number" class="form-control result" value="${temp}" id="quantity1" name="quantity"
                                                                               min="1" max="${book.getQuantityInStock()}">
                                                                        <div class="input-group-append">
                                                                            <button class="btn btn-outline-secondary" type="button" id="plusBtn">+</button>
                                                                        </div>
                                                                    </div>
                                                                    <button type="submit" class="tg-btn tg-active tg-btn-lg">Add to cart</button>
                                                                </form>
                                                            </c:if>

                                                            <script>
                                                                const minusBtn = document.getElementById('minusBtn');
                                                                const plusBtn = document.getElementById('plusBtn');
                                                                const quantityInput = document.getElementById('quantity1');

                                                                minusBtn.addEventListener('click', function () {
                                                                    let currentValue = parseInt(quantityInput.value) || 0;
                                                                    if (currentValue > 1) {
                                                                        quantityInput.value = currentValue - 1;
                                                                    }
                                                                });

                                                                plusBtn.addEventListener('click', function () {
                                                                    let currentValue = parseInt(quantityInput.value) || 0;
                                                                    if (currentValue < ${book.getQuantityInStock()}) {
                                                                        quantityInput.value = currentValue + 1;
                                                                    }
                                                                });

                                                            </script>



                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                                    <div class="tg-productcontent">
                                                        <ul class="tg-bookscategories">
                                                            <li><a href="javascript:void(0);">${book.getCategoryId().getCategoryName()}</a></li>
                                                        </ul>
                                                        <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                                                        <div class="tg-booktitle">
                                                            <h3>${book.getTitle()}</h3>
                                                        </div>
                                                        <span class="tg-bookwriter">By: <a href="javascript:void(0);">
                                                                <c:forEach var="authorList" items="${book.getListAuthor()}" varStatus="status">
                                                                    <a href="javascript:void(0);">
                                                                        ${authorList.getAuthorName()}
                                                                    </a>
                                                                    <c:if test="${!status.last}">
                                                                        ,
                                                                    </c:if>
                                                                </c:forEach>

                                                            </a></span>
                                                        <span class="tg-stars">
                                                            <c:forEach var="star" begin="1" end="${book.getRating()}">
                                                                <i class="fa fa-star" style="color: gold;"></i>
                                                            </c:forEach>
                                                            <c:forEach var="star" begin="${book.getRating() + 1}" end="5">
                                                                <i class="fa fa-star-o"></i>
                                                            </c:forEach>
                                                        </span>                                                       

                                                        <div class="tg-share">
                                                            <span>Share:</span>
                                                            <ul class="tg-socialicons">
                                                                <li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                                                                <li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
                                                                <li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
                                                                <li class="tg-googleplus"><a href="javascript:void(0);"><i class="fa fa-google-plus"></i></a></li>
                                                                <li class="tg-rss"><a href="javascript:void(0);"><i class="fa fa-rss"></i></a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="tg-description" style="min-height: 300px">
                                                            <p>
                                                                ${book.getDescription()}
                                                            </p>
                                                        </div>
                                                        <div class="tg-alsoavailable">
                                                            <form class="tg-formtheme tg-formcontactus" action="" method="post">
                                                                <fieldset>

                                                                    <div class="form-group">
                                                                        <input type="text" name="subject" class="form-control" placeholder="Subject (optional)">
                                                                    </div>
                                                                    <div class="form-group tg-hastextarea">
                                                                        <textarea placeholder="Comment"></textarea>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <button type="submit" class="tg-btn tg-active">Submit</button>
                                                                    </div>
                                                                </fieldset>
                                                            </form  >
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="tg-aboutauthor">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <div class="tg-sectionhead">
                                                            <h2>About Author</h2>
                                                        </div>

                                                        <c:forEach var="authorList" items="${book.getListAuthor()}" varStatus="status">

                                                            <div class="tg-authorbox">
                                                                <figure class="tg-authorimg">
                                                                    <img src="images/author/imag-24.jpg" alt="image description">
                                                                </figure>
                                                                <div class="tg-authorinfo">
                                                                    <div class="tg-authorhead">
                                                                        <div class="tg-leftarea">
                                                                            <div class="tg-authorname">
                                                                                <h2>
                                                                                    ${authorList.getAuthorName()}

                                                                                </h2>
                                                                            </div>
                                                                        </div>
                                                                        <div class="tg-rightarea">
                                                                            <ul class="tg-socialicons">
                                                                                <li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                                                                                <li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
                                                                                <li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
                                                                                <li class="tg-googleplus"><a href="javascript:void(0);"><i class="fa fa-google-plus"></i></a></li>
                                                                                <li class="tg-rss"><a href="javascript:void(0);"><i class="fa fa-rss"></i></a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="tg-description">
                                                                        <p>${authorList.getDescription()}</p>                                                                    </div>
                                                                    <a class="tg-btn tg-active" href="javascript:void(0);">View All Books</a>
                                                                </div>
                                                            </div>
                                                        </c:forEach>


                                                    </div>
                                                </div>
                                                <div class="tg-relatedproducts">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <div class="tg-sectionhead">
                                                            <h2><span>Related Products</span>You May Also Like</h2>
                                                            <a class="tg-btn" href="javascript:void(0);">View All</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <div id="tg-relatedproductslider" class="tg-relatedproductslider tg-relatedbooks owl-carousel">
                                                            <c:forEach items="${listTop10Book}" var="listBook">


                                                                <div class="item">
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
                                                                            <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
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
                                                                            </span>                                                                            <span class="tg-bookprice">
                                                                                <ins>$${listBook.getPrice()} </ins>
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
                                            </div>									</div>
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