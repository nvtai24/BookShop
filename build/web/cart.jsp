<!doctype html>
<html class="no-js" lang="">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Your Cart - Book Library</title>
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
        <style>
            .tg-cart-table {
                width: 100%;
                margin-bottom: 10px;
                border-collapse: collapse;
                border-spacing: 0;
            }

            .tg-cart-table th,
            .tg-cart-table td {
                padding: 6px; /* Smaller padding */
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
                max-width: 60px; /* Smaller image size */
                height: auto;
            }

            .tg-cart-name {
                text-align: left;
                padding-left: 10px; /* Reduced padding */
            }

            .tg-cart-price,
            .tg-cart-quantity,
            .tg-cart-total {
                font-weight: bold;
            }

            .tg-cart-total strong {
                color: #c0392b; /* Red color for total */
            }

            .tg-minicartfoot {
                padding-top: 10px; /* Reduced padding */
                text-align: right;
            }

            .tg-btnemptycart {
                margin-right: 5px; /* Reduced margin */
            }

            .tg-btns {
                margin-top: 5px; /* Reduced margin */
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
                                <h1>Your Cart</h1>
                                <ol class="tg-breadcrumb">
                                    <li><a href="home">home</a></li>
                                    <li class="tg-active">Your Cart</li>
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
                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div> <!-- Empty column on the left -->
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                            <main id="tg-main" class="tg-main tg-haslayout">
                                <!-- Cart Items -->
                                <div class="tg-cart-table">
                                    <table class="tg-cart-table table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${order.getOrderDetail()}" var="orderDetail">
                                                <tr>
                                                    <td class="tg-cart-image">
                                                        <figure>
                                                            <img src="${orderDetail.getBookId().getImage()}" alt="${orderDetail.getBookId().getImage()}">
                                                        </figure>
                                                    </td>
                                                    <td class="tg-cart-name">
                                                        <h5><a href="book-detail?bookId=${orderDetail.getBookId().getBookId()}">${orderDetail.getBookId().getTitle()}</a></h5>
                                                    </td>
                                                    <td class="tg-cart-price">
                                                        <h6>$ ${orderDetail.getPrice()}</h6>
                                                    </td>
                                                    <td class="tg-cart-quantity">
                                                        <input type="number" class="form-control" value="${orderDetail.getQuantity()}">
                                                    </td>
                                                    <td class="tg-cart-total">
                                                        <strong>$ ${orderDetail.getPrice() * orderDetail.getQuantity()}</strong>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- Minicart Footer -->
                                <div class="tg-minicartfoot">
                                    <a class="tg-btnemptycart btn btn-danger" href="ClearCart?clear=true">
                                        <i class="fa fa-trash-o"></i>
                                        <span>Clear Cart</span>
                                    </a>
                                    <span class="tg-subtotal">Subtotal: <strong>$ ${totalAmount}</strong></span>
                                    <div class="tg-btns">
                                        <a class="tg-btn btn btn-success" href="checkout?totalAmount=${totalAmount}&orderId=${order.getOrderId()}">Checkout</a>
                                    </div>
                                </div>
                                <!-- End Cart Items -->
                            </main>
                        </div>
                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div> <!-- Empty column on the right -->
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
