
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <header id="tg-header" class="tg-header tg-haslayout">
            <div class="tg-topbar">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <ul class="tg-addnav">
                                <li>
                                    <a href="javascript:void(0);">
                                        <i class="icon-envelope"></i>
                                        <em>Contact</em>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">
                                        <i class="icon-question-circle"></i>
                                        <em>Help</em>
                                    </a>
                                </li>
                            </ul>
                            <c:if test="${not empty sessionScope.username}">
                                <div class="tg-userlogin">
                                    <div class="dropdown tg-themedropdown tg-currencydropdown">
                                        <a href="javascript:void(0);" id="tg-currenty" class="tg-btnthemedropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span>Hi, ${sessionScope.username.getUsername()}</span>
                                        </a>
                                        <ul class="dropdown-menu tg-themedropdownmenu" aria-labelledby="tg-currenty">
                                            <li>
                                                <a href="profile">
                                                    <span>Profile</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="logout">
                                                    <span>Logout</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${empty sessionScope.username}">
                                <div class="tg-userlogin">
                                    <a href="login.jsp">
                                        <span>Login/Register</span>
                                    </a>
                                </div>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
            <div class="tg-middlecontainer">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <strong class="tg-logo"><a href="home">
                                    <img src="images/BookWorld.png" alt="company name here"
                                         style="width: 150px; height: 80px; border-radius: 15px; object-fit: cover; margin-bottom: 0;">

                                </a></strong>
                            <div class="tg-wishlistandcart">
                                <div>
                                    <a href="cart" id="tg-minicart">
                                        <i class="icon-cart"></i>
                                        <span> ${countBookInCart} Book</span>
                                    </a>
                                </div>
                            </div>
                            <div class="tg-searchbox">
                                <form class="tg-formtheme tg-formsearch" method="get" action="list-book">
                                    <fieldset>
                                        <input type="text" name="search" class="typeahead form-control" placeholder="Search by name...">
                                        <button type="submit"><i class="icon-magnifier"></i></button>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tg-navigationarea">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <nav id="tg-nav" class="tg-nav">
                                <div id="tg-navigation" class="collapse navbar-collapse tg-navigation">
                                    <ul>
                                        <li class="menu-item-has-children current-menu-item">
                                            <a href="javascript:void(0);">Category</a>
                                            <ul class="sub-menu">
                                                <c:forEach var="listCategory" items="${listCategory}">
                                                    <li><a href="list-book?categoryId=${listCategory.getCategoryId()}">${listCategory.getCategoryName()}</a></li>
                                                    </c:forEach>

                                            </ul>
                                        </li>
                                        <li class="">
                                            <a href="author">Authors</a>
                                        </li>
                                        <li><a href="list-book">Best Selling</a></li>
                                        <li><a href="list-order">List Order</a></li>

                                        <c:if test="${sessionScope.username.getRoleId().getRoleId() == 1}">
                                            <li><a href="manager-user">Manager User</a></li>
                                            <li><a href="manager-order">Manager Order</a></li>
                                            <li><a href="manager-book">Manager Book</a></li>
                                            <li><a href="manager-author">Manager Author</a></li>
                                            </c:if>

                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>

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
