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
        <style>
            #addAuthorForm {
                display: none;
            }
        </style>
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
                                <h1>Manager Author</h1>
                                <ol class="tg-breadcrumb">
                                    <li><a href="home">home</a></li>
                                    <li><a href="javascript:void(0);">Manager</a></li>
                                    <li class="tg-active">Manager Author</li>
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
                            <div class="container">

                                <!-- Button to show the form -->
                                <button id="showFormBtn" class="btn btn-success mb-3">Add New Author</button>

                                <!-- Form to add a new author -->
                                <form id="addAuthorForm" action="add-edit-author" method="post" class="mb-4">
                                    <input type="hidden" name="action" value="add">

                                    <div class="form-row">
                                        <div class="col-md-4 mb-3">
                                            <input type="text" class="form-control" name="authorName" placeholder="Name" required>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <input type="text" class="form-control" name="authorImage" placeholder="Link image">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <input type="text" class="form-control" name="authorDescription" placeholder="description">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <button type="submit" class="btn btn-primary">Add New Author</button>
                                        </div>
                                    </div>
                                </form>

                                <br>
                                <br>
                                <br>

                                <!-- Form to edit an author -->
                                <form id="editAuthorForm" action="add-edit-author" method="post" class="mb-4" style="display: none;">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="authorId" id="editAuthorId">
                                    <div class="form-row">
                                        <div class="col-md-4 mb-3">
                                            <input type="text" class="form-control" name="authorName" id="editAuthorName" placeholder="Author Name" required>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <input type="text" class="form-control" name="authorImage" id="editAuthorImage" placeholder="Image URL">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <input type="text" class="form-control" name="authorDescription" id="editAuthorDescription" placeholder="Description">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <button type="submit" class="btn btn-primary">Update Author</button>
                                        </div>
                                    </div>
                                </form>

                                <table id="order-list" class="display table table-striped table-hover tg-order-table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th>Image</th>
                                            <th>Description</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="listAuthor" items="${listAuthor}">
                                            <tr>
                                                <td>${listAuthor.authorId}</td>
                                                <td>${listAuthor.authorName}</td>
                                                <td><img src="${listAuthor.image}" alt="Ảnh" width="50"></td>
                                                <td>${listAuthor.description}</td>
                                                <td>
                                                    <button type="button" class="btn btn-warning btn-sm" 
                                                            onclick="showEditForm('${listAuthor.authorId}', '${listAuthor.authorName}', '${listAuthor.image}', '${listAuthor.description}')">
                                                        Edit
                                                    </button>
                                                    <a href="delete?authorId=${listAuthor.authorId}&delete=deleteAuthor" class="btn btn-danger btn-sm" 
                                                       onclick="return confirm('Bạn có chắc chắn muốn xóa tác giả này?');">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

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

        <script>
                                                           // JavaScript to show/hide the form
                                                           document.getElementById("showFormBtn").addEventListener("click", function () {
                                                               var form = document.getElementById("addAuthorForm");
                                                               if (form.style.display === "none" || form.style.display === "") {
                                                                   form.style.display = "block";
                                                               } else {
                                                                   form.style.display = "none";
                                                               }
                                                           });

                                                           // JavaScript to show/hide the edit form and populate it with data
                                                           function showEditForm(authorId, authorName, authorImage, authorDescription) {
                                                               var form = document.getElementById("editAuthorForm");
                                                               form.style.display = "block";
                                                               document.getElementById("editAuthorId").value = authorId;
                                                               document.getElementById("editAuthorName").value = authorName;
                                                               document.getElementById("editAuthorImage").value = authorImage;
                                                               document.getElementById("editAuthorDescription").value = authorDescription;
                                                           }
        </script>

    </body>
</html>
