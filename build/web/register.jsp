<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Register - Book Library</title>
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
                            <h1>Register</h1>
                            <ol class="tg-breadcrumb">
                                <li><a href="home">home</a></li>
                                <li class="tg-active">Register</li>
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
                    Register Start
            *************************************-->
            <div class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="tg-contactus">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-md-offset-3 col-lg-offset-3">
                                <div class="tg-sectionhead">
                                    <h2><span>Welcome!</span>Register a New Account</h2>
                                </div>
                                <form class="tg-formtheme" action="register" method="post">
                                    <fieldset>
                                        <div class="form-group">
                                            <label>Username</label>
<input type="text" name="username" class="form-control" placeholder="Username" style="text-transform: none;" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
<input type="email" name="email" class="form-control" placeholder="Email" style="text-transform: none;" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
<input type="password" name="password" class="form-control" placeholder="Password" style="text-transform: none;" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Confirm Password</label>
<input type="password" name="confirmPassword" class="form-control" placeholder="Confirm Password" style="text-transform: none;" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Full Name</label>
<input type="text" name="fullName" class="form-control" placeholder="Full Name" style="text-transform: none;" required>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="tg-btn tg-active">Register</button>
                                        </div>
                                        <div class="form-group">
                                            <p>Already have an account? <a href="login">Login here</a></p>
                                        </div>
                                        <div>
                                            ${registerError}
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--************************************
                    Register End
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
