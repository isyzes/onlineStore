<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="myTag" tagdir="/WEB-INF/tags" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
    <title>Gretong a Ecommerce Category Flat Bootstarp Responsive Website Template | Home :: w3layouts</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <!-- jQuery (necessary JavaScript plugins) -->
    <script type='text/javascript' src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
    <!-- Custom Theme files -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel='stylesheet' type='text/css'/>
    <!-- Custom Theme files -->
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Gretong Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>
    <!-- start menu -->
    <link href="${pageContext.request.contextPath}/resources/css/megamenu.css" rel="stylesheet" type="text/css"
          media="all"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/megamenu.js"></script>
    <script>$(document).ready(function () {
        $(".megamenu").megamenu();
    });</script>
    <script src="${pageContext.request.contextPath}/resources/js/menu_jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/simpleCart.min.js"></script>
</head>
<body>
<!-- header_top -->
<myTag:navbar/>
<!-- header -->
<div class="header_bg">
    <div class="container">
        <div class="header">
            <div class="head-t">
                <myTag:logo/>
                <!-- start header_right -->
                <myTag:login price="${user.priceBasket}" items="${user.itemsBasket}"/>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="check">
        <myTag:menu/>

        <div class="col-md-9 cart-items">
            <h1>All users (${users.size()})</h1>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">id</th>
                    <th scope="col">First Name</th>
                    <th scope="col">LastName</th>
                    <th scope="col">Email</th>
                    <th scope="col">Role</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <th scope="row">${user.id}</th>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.email}</td>

                        <form action="/admin/editUser/${user.id}" method="post">
                        <td>
                            <div class="det_nav1">
                                <%--<label class="col-sm-2 col-form-label">Select a size :</label>--%>
                                <div class="sky-form col col-4">
                                    <ul>
                                        <c:forEach items="${roles}" var="item">
                                            <li>
                                                <label class="checkbox">
                                                    <input type="checkbox" name="role" value="${item}"
                                                    <c:if test="${user.roles.contains(item)}"> checked</c:if>
                                                    ><i></i><c:out value="${item}"/>
                                                </label>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>

                        </td>
                            <td><div class="form-group row">
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-primary">Edit</button>
                                </div>
                            </div></td>
                        </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="clearfix"></div>

            <div class="clearfix"></div>
        </div>
    </div>
</div>
<myTag:container/>
</body>
</html>