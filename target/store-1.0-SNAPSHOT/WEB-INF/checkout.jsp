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
    <link href="${pageContext.request.contextPath}/resources/css/megamenu.css" rel="stylesheet" type="text/css" media="all"/>
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
        <div class="col-md-3 cart-total">
            <a class="continue" href="/">Continue to basket</a>
            <div class="price-details">
                <h3>Price Details</h3>
                <span>Total</span>
                <span class="total1">${user.priceBasket}</span>
                <span>Discount</span>
                <span class="total1">---</span>
                <span>Delivery Charges</span>
                <span class="total1"> 150.00</span>
                <div class="clearfix"></div>
            </div>
            <ul class="total_price">
                <li class="last_price"><h4>TOTAL</h4></li>
                <li class="last_price"><span>${user.priceBasket + 150.00}</span></li>
                <div class="clearfix"></div>
            </ul>


            <div class="clearfix"></div>
            <a class="order" href="/buy">Place Order</a>
            <%--<div class="total-item">--%>
                <%--<h3>OPTIONS</h3>--%>
                <%--<h4>COUPONS</h4>--%>
                <%--<a class="cpns" href="#">Apply Coupons</a>--%>
                <%--<p><a href="#">Log In</a> to use accounts - linked coupons</p>--%>
            <%--</div>--%>
        </div>
        <div class="col-md-9 cart-items">
            <h1>My Shopping Bag (${user.itemsBasket})</h1>
            <c:forEach items="${user.basket}" var="order">
                <div class="cart-header">
                    <div class="close1"><a href="/removeFromBasket/${order.id}"><img src="${pageContext.request.contextPath}/resources/images/close_1.png"></a></div>
                    <div class="cart-sec simpleCart_shelfItem">
                        <div class="cart-item cyc">
                            <img src="/img/${order.product.avatarPhoto}"
                                 class="img-responsive"
                                 alt=""
                            />
                        </div>
                        <div class="cart-item-info">
                            <h3>
                                <a href="/details/${order.product.productId}">${order.product.name}</a>
                                <span>Model No: ${order.product.productId}</span>
                            </h3>
                            <ul class="qty">
                                <li><p>Size : ${order.product.size}</p></li>
                                <li><p>Qty : 1</p></li>
                            </ul>

                            <div class="delivery">
                                <c:if test="${order.product.onSale == false}">
                                   <p class="text-danger h6">Sales!</p>
                                </c:if>

                                <c:if test="${order.product.onSale == true}">
                                    <p>Price: : ${order.product.price}</p>
                                </c:if>

                                <span>Delivered in 2-3 bussiness days</span>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </c:forEach>

        <div class="clearfix"></div>
    </div>
</div>
</div>
<myTag:container/>
</body>
</html>