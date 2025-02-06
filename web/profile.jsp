<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Book Library - Profile</title>
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
            #editProfileForm {
                display: none;
            }
        </style>
    </head>
    <body>
        <div id="tg-wrapper" class="tg-wrapper tg-haslayout">
            <%@ include file="header.jsp" %>
            <div class="tg-innerbanner tg-haslayout tg-parallax tg-bginnerbanner" data-z-index="-100"
                 data-appear-top-offset="600" data-parallax="scroll"
                 data-image-src="images/parallax/bgparallax-07.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="tg-innerbannercontent">
                                <h1>Profile</h1>
                                <ol class="tg-breadcrumb">
                                    <li><a href="home">Home</a></li>
                                    <li class="tg-active">Profile</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <main id="tg-main" class="tg-main tg-haslayout">
                <div class="tg-sectionspace tg-haslayout">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="tg-authordetail">
                                    <figure class="tg-authorimg">
                                        <img src="images/author/imag-25.jpg" alt="${sessionScope.username}">
                                    </figure>
                                    <div class="tg-authorcontentdetail">
                                        <div class="tg-sectionhead">
                                            <h2><span></span>${sessionScope.username.getUsername()}</h2>
                                        </div>
                                        <div class="tg-description">
                                            <p><strong>Full Name:</strong> ${sessionScope.username.fullName}</p>
                                            <p><strong>Email:</strong> ${sessionScope.username.email}</p>
                                            <p><strong>Role:</strong> ${sessionScope.username.roleId.roleName}</p>
                                            <p><strong>Registration Date:</strong> ${sessionScope.username.registrationDate}</p>
                                            <p><strong>Status:</strong> ${sessionScope.username.status}</p>
                                        </div>
                                    </div>
                                    <button id="editProfileBtn" class="btn btn-success">
                                        Edit Profile
                                    </button>
                                </div>

                                <form id="editProfileForm" class="tg-formtheme" action="profile" method="post">
                                    <fieldset>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" name="email" class="form-control" placeholder="Email" value="${sessionScope.username.email}" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Confirm Password</label>
                                            <input type="password" name="confirmPassword" class="form-control" placeholder="Confirm Password" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Full Name</label>
                                            <input type="text" name="fullName" class="form-control" placeholder="Full Name" value="${sessionScope.username.fullName}" required>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="tg-btn tg-active">Edit Profile</button>
                                        </div>
                                    </fieldset>
                                </form>
                                          <div>
                                            <c:if test="${not empty updateMessage}">
                                                <div class="alert alert-info">${updateMessage}</div>
                                            </c:if>
                                        </div>

                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <%@ include file="footer.jsp" %>
        </div>
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
        <script>
            document.getElementById('editProfileBtn').addEventListener('click', function () {
                document.getElementById('editProfileForm').style.display = 'block';
            });
        </script>
    </body>
</html>
