<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Manage Users - Book Library</title>
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
            .tg-user-table {
                width: 100%;
                margin-bottom: 10px;
                border-collapse: collapse;
                border-spacing: 0;
            }
            .tg-user-table th,
            .tg-user-table td {
                padding: 6px;
                text-align: center;
                vertical-align: middle;
                border: 1px solid #ddd;
            }
            .tg-user-table th {
                background-color: #f5f5f5;
                color: #333;
            }
            .tg-user-table td {
                background-color: #fff;
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
                                <h1>Manage Users</h1>
                                <ol class="tg-breadcrumb">
                                    <li><a href="home">home</a></li>
                                    <li class="tg-active">Manage Users</li>
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
                                    <h4 class="card-title">List of Users</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="user-list" class="display table table-striped table-hover tg-user-table">
                                            <thead>
                                                <tr>
                                                    <th>User ID</th>
                                                    <th>Username</th>
                                                    <th>Email</th>
                                                    <th>Role</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="user" items="${listUser}">
                                                    <tr>
                                                        <td>${user.getUserId()}</td>
                                                        <td>${user.getUsername()}</td>
                                                        <td>${user.getEmail()}</td>
                                                        <td>${user.getRoleId().getRoleName()}</td>
                                                        <td>${user.getStatus()}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${user.getStatus() eq 'active'}">
                                                                    <a href="#" onclick="confirmBan(${user.getUserId()}); return false;" class="btn btn-warning btn-sm">Ban</a>
                                                                </c:when>
                                                                <c:when test="${user.getStatus() eq 'banned'}">
                                                                    <a href="#" onclick="confirmUnban(${user.getUserId()}); return false;" class="btn btn-success btn-sm">Unban</a>
                                                                </c:when>
                                                            </c:choose>
                                                            <a href="delete?userId=${user.getUserId()}&delete=deleteUser" class="btn btn-danger btn-sm" onclick="return confirmDelete();">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                            <script>
                                                function confirmBan(userId) {
                                                    var result = confirm("Are you sure you want to ban this user?");
                                                    if (result) {
                                                        window.location.href = "ban?UserId=" + userId;
                                                    }
                                                }

                                                function confirmUnban(userId) {
                                                    var result = confirm("Are you sure you want to unban this user?");
                                                    if (result) {
                                                        window.location.href = "ban?UserId=" + userId;
                                                    }
                                                }
                                                function confirmDelete() {
                                                    return confirm("Are you sure you want to delete this user?");
                                                }
                                            </script>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- Phân trang -->
                                <div class="card-footer">
                                    <c:if test="${totalPages > 1}">
                                        <ul class="pagination justify-content-center">
                                            <c:if test="${currentPage > 1}">
                                                <li class="page-item">
                                                    <a class="page-link" href="managerUser?page=1">First</a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link" href="managerUser?page=${currentPage - 1}">Previous</a>
                                                </li>
                                            </c:if>

                                            <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                <c:choose>
                                                    <c:when test="${loop.index == currentPage}">
                                                        <li class="page-item active">
                                                            <span class="page-link">${loop.index}</span>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item">
                                                            <a class="page-link" href="manager-user?page=${loop.index}">${loop.index}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                            <c:if test="${currentPage < totalPages}">
                                                <li class="page-item">
                                                    <a class="page-link" href="manager-user?page=${currentPage + 1}">Next</a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link" href="manager-user?page=${totalPages}">Last</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </c:if>
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
