<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>List Orders - Book Library</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <link rel="icon" href="../assets/img/kaiadmin/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="./css/bootstrap.min.css" />
        <link rel="stylesheet" href="./css/plugins.min.css" />
        <link rel="stylesheet" href="./css/kaiadmin.min.css" />
        <link rel="stylesheet" href="./css/demo.css" />
        <style>
            .tg-cart-table {
                width: 100%;
                margin-bottom: 10px;
                border-collapse: collapse;
                border-spacing: 0;
            }
            .tg-cart-table th,
            .tg-cart-table td {
                padding: 6px;
                text-align: center;
                vertical-align: middle;
                border: 1px solid #ddd;
            }
            .tg-cart-table th {
                background-color: #f5f5f5;
                color: #333;
            }
            .tg-cart-table td {
                background-color: #fff;
            }
            .tg-cart-image img {
                max-width: 60px;
                height: auto;
            }
            .tg-cart-name {
                text-align: left;
                padding-left: 10px;
            }
            .tg-cart-price,
            .tg-cart-quantity,
            .tg-cart-total {
                font-weight: bold;
            }
            .tg-cart-total strong {
                color: #c0392b;
            }
            .tg-minicartfoot {
                padding-top: 10px;
                text-align: right;
            }
            .tg-btnemptycart {
                margin-right: 5px;
            }
            .tg-btns {
                margin-top: 5px;
            }
        </style>
    </head>
    <body>
        <div id="tg-wrapper" class="tg-wrapper tg-haslayout">
            <!-- Header -->
            <%@ include file="header.jsp" %>
            <!-- Inner Banner -->
            <div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner" data-z-index="-100" data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-07.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="tg-innerbannercontent">
                                <h1>List Orders</h1>
                                <ol class="tg-breadcrumb">
                                    <li><a href="home">home</a></li>
                                    <li class="tg-active">List Orders</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">List Orders</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="order-list" class="display table table-striped table-hover tg-cart-table">
                                            <thead>
                                                <tr>
                                                    <th>Order ID</th>
                                                    <th>Status</th>
                                                    <th>Order Date</th>
                                                    <th>List Book</th>
                                                    <th>Total Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach var="order" items="${listOrder}" varStatus="loop">
                                                    <tr>
                                                        <td>${loop.index + 1}</td> 
                                                        <td>${order.getStatus()}</td>
                                                        <td>${order.getOrderDate()}</td>
                                                        <td>
                                                            <c:forEach var="list" items="${order.getOrderDetail()}" varStatus="loop">
                                                                ${list.getBookId().getTitle()}
                                                                <c:if test="${not loop.last}">,</c:if>
                                                            </c:forEach>

                                                        </td>
                                                        <td>$ ${order.getTotalAmount()}</td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer -->
            <%@ include file="footer.jsp" %>
        </div><!-- Wrapper End -->
        <!-- Scripts -->
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
        <script src="../assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="./js/core/popper.min.js"></script>
        <script src="./js/core/bootstrap.min.js"></script>
    </body>
</html>
