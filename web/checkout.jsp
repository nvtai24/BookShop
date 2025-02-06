<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout - Book Library</title>
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
        <style>
            body {
                font-family: Arial;
                font-size: 17px;
                padding: 8px;
            }

            .icon-container {
                margin-bottom: 20px;
                padding: 7px 0;
                font-size: 24px;
            }

            span.price {
                float: right;
                color: grey;
            }
        </style>
    </head>

    <body>

        <div id="tg-wrapper" class="tg-wrapper tg-haslayout">
            <!-- Header -->
            <%@ include file="header.jsp" %>

            <!-- Inner Banner -->
            <div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner" data-z-index="-100"
                 data-appear-top-offset="600" data-parallax="scroll" data-image-src="images/parallax/bgparallax-07.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="tg-innerbannercontent">
                                <h1>Checkout</h1>
                                <ol class="tg-breadcrumb">
                                    <li><a href="home">home</a></li>
                                    <li class="tg-active">Checkout</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Check if mess exists, then display it --%>
            <c:if test="${not empty mess}">
                <div>
                    ${mess}
                </div>
            </c:if>

            <%-- Check if mess does not exist, then display main content --%>
            <c:if test="${empty mess}">
                <!-- Main Content -->
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <h2>Checkout Form</h2>
                            <!-- Add your checkout form here -->
                        </div>

                        <div class="col-md-12">  
                            <form action="checkout" method="post">
                                <div class="container">
                                    <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i>
                                            <b>${order.getOrderDetail().size()}</b></span></h4>
                                            <c:forEach items="${order.getOrderDetail()}" var="orderDetail">
                                        <p><a href="book-detail?bookId=${orderDetail.getBookId().getBookId()}">${orderDetail.getBookId().getTitle()}</a>
                                            <span class="price">$ ${orderDetail.getPrice()}</span></p>
                                        </c:forEach>
                                    <hr>
                                    <p>Total <span class="price" style="color:black"><b>$ ${totalAmount}</b></span></p>
                                </div>
                                <div>
                                    <input class="btn btn-primary" type="submit" value="Checkout">
                                </div>
                                <input hidden="" value="${totalAmount}" name="totalAmount">
                                <input  value="${order.getOrderId()}" hidden="" name="orderId">

                            </form>

                        </div>
                    </div>
                </div>
            </c:if>

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
    </body>

</html>
