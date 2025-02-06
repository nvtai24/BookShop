<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Manage Orders - Book Library</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Include other necessary CSS files -->
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
                                <h1>Manage Orders</h1>
                                <ol class="tg-breadcrumb">
                                    <li><a href="home">home</a></li>
                                    <li class="tg-active">Manage Orders</li>
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
                                    <h4 class="card-title">List of Orders</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="order-list" class="display table table-striped table-hover tg-order-table">
                                            <thead>
                                                <tr>
                                                    <th>Order ID</th>
                                                    <th>User</th>
                                                    <th>Date</th>
                                                    <th>Total Amount</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="order" items="${listOrders}"  varStatus="loop">
                                                    <tr>
                                                        <td>${loop.index + 1}</td> 
                                                        <td>${order.getUserId().getUsername()}</td>
                                                        <td>${order.getOrderDate()}</td>
                                                        <td>${order.getTotalAmount()}</td>
                                                        <td>
                                                            <form action="manager-order" method="post">
                                                                <input value="${order.getOrderId()}" name="orderId" hidden="">
                                                                <select name="status"   onchange="this.form.submit()">
                                                                    <option value="Shipping" ${order.status == 'Shipping' ? 'selected' : ''}>Shipping</option>
                                                                    <option value="Delivered" ${order.status == 'Delivered' ? 'selected' : ''}>Delivered</option>
                                                                    <option value="Rejected" ${order.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                                                                    <option value="Rejected" ${order.status == 'checkout' ? 'selected' : ''}>checkout </option>
                                                                </select>
                                                            </form>

                                                        </td>
                                                        <td>
                                                            <a href="#" onclick="confirmDelete(${order.getOrderId()}); return false;" class="btn btn-danger btn-sm">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        
                                        
                                    </div>
                                </div>
                               <!-- Pagination -->
<div class="card-footer">
    <ul class="pagination justify-content-center">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <li class="page-item ${currentPage == i ? 'active' : ''}">
                <a class="page-link" href="manager-order?page=${i}">${i}</a>
            </li>
        </c:forEach>
    </ul>
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
        <!-- Include other necessary scripts -->
        <script>
                                                                function confirmDelete(orderId) {
                                                                    var result = confirm("Are you sure you want to delete this order?");
                                                                    if (result) {
                                                                        window.location.href = "delete?orderId=" + orderId + "&delete=deleteOrder";
                                                                    }
                                                                }
        </script>
    </body>
</html>
