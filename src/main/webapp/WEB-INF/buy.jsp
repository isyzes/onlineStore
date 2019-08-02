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
    <meta charset="utf-8" name="keywords" content="Gretong Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
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
            <!-- start header menu -->
        </div>
    </div>
</div>
<!-- content -->
<div class="arriv">
    <div class="container">
        <h2>Shipping Information </h2>
        <form action="/buy" method="post">
            <h4>Contact: </h4>
            <div class="form-row">
                <div class="col-md-4 mb-3">
                    <label for="validationCustom01">Name :</label>
                    <input type="text" class="form-control" id="validationCustom01" placeholder="Example: Ivanov Ivan Ivanovich" value="" name="name">
                    <%--<div class="valid-feedback">--%>
                        <%--Looks good!--%>
                    <%--</div>--%>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="validationCustom02">Mobile :</label>
                    <input type="text" class="form-control" id="validationCustom02" placeholder="Mobile" value="" name="mobile">
                    <%--<div class="valid-feedback">--%>
                        <%--Looks good!--%>
                    <%--</div>--%>
                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <h4>Address: </h4>

            <div class="form-row">
                <div class="col-md-3 mb-3">
                    <label for="validationCustom03">Street</label>
                    <input type="text" class="form-control" id="validationCustom03" placeholder="Street" name="street">
                    <%--<div class="invalid-feedback">--%>
                        <%--Please provide a valid city.--%>
                    <%--</div>--%>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationCustom04">Apartment, Unit, etc</label>
                    <input type="text" class="form-control" id="validationCustom04" placeholder="Apartment, Unit, etc" name="apartment">
                    <%--<div class="invalid-feedback">--%>
                        <%--Please provide a valid state.--%>
                    <%--</div>--%>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationCustom05">Country</label>
                    <input type="text" class="form-control" id="validationCustom05" placeholder="Country" name="country">
                    <%--<div class="invalid-feedback">--%>
                        <%--Please provide a valid zip.--%>
                    <%--</div>--%>
                </div>
            </div>

            <div class="form-row">
                <div class="col-md-3 mb-3">
                    <label for="validationCustom03">State/Province/Region</label>
                    <input type="text" class="form-control" id="validationCustom03" placeholder="State/Province/Region" name="state">
                    <%--<div class="invalid-feedback">--%>
                    <%--Please provide a valid city.--%>
                    <%--</div>--%>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationCustom04">City</label>
                    <input type="text" class="form-control" id="validationCustom04" placeholder="City" name="city">
                    <%--<div class="invalid-feedback">--%>
                    <%--Please provide a valid state.--%>
                    <%--</div>--%>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationCustom05">Zip Code</label>
                    <input type="text" class="form-control" id="validationCustom05" placeholder="Zip Code" name="zip">
                    <%--<div class="invalid-feedback">--%>
                    <%--Please provide a valid zip.--%>
                    <%--</div>--%>
                </div>
            </div>

            <br>
            <br>
            <br>
            <br>
            <br>
            <br>

            <div class="registration_form">
                <input type="submit" value="Confirm" name="submit">
                <input type="submit" value="Cancel" name="submit">
            </div>
        </form>
    </div>
</div>
<myTag:container/>
</body>
</html>