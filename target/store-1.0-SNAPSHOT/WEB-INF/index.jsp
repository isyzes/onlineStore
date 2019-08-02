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
            <ul class="megamenu skyblue">
                <li class="active grid"><a class="color1" href="/">Home</a></li>
                <li class="grid"><a class="color2" href="/listProduct/${true}/false/false">new arrivals</a>
                    <div class="megapanel">
                        <div class="row">

                            <c:forEach items="${categories}" var="categories">
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4><c:out value="${categories}"/></h4>
                                        <ul>
                                            <c:forEach items="${categories.listSection}" var="section">
                                                <li>
                                                    <a href="/listProduct/${true}/${categories}/${section}">${section}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </li>

                <c:forEach items="${categories}" var="categories">
                    <li class="grid"><a class="color6" href="/listProduct/${false}/${categories}/false"><c:out
                            value="${categories}"/></a>
                        <div class="megapanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                            <c:forEach items="${categories.listSection}" var="section">
                                                <li><a href="/listProduct/${false}/${categories}/${section}"><c:out
                                                        value="${section}"/></a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<!-- content -->
<div class="arriv">
    <div class="container">
        <div class="arriv-top">
            <div class="col-md-6 arriv-left">
                <img src="${pageContext.request.contextPath}/resources/images/1.jpg" class="img-responsive" alt="">
                <div class="arriv-info">
                    <h3>WOMEN'S CLOTHING</h3>
                    <p>REVIVE YOUR WARDROBE WITH CHIC KNITS</p>
                    <div class="crt-btn">
                        <a href="/listProduct/${false}/WOMEN/false">TAKE A LOOK</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 arriv-right">
                <img src="${pageContext.request.contextPath}/resources/images/2.jpg" class="img-responsive" alt="">
                <div class="arriv-info">
                    <h3>MEN'S CLOTHING</h3>
                    <p>REVIVE YOUR WARDROBE WITH CHIC KNITS</p>
                    <div class="crt-btn">
                        <a href="/listProduct/${false}/MEN/false">SHOP NOW</a>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="arriv-bottm">
            <div class="col-md-8 arriv-left1">
                <img src="${pageContext.request.contextPath}/resources/images/3.jpg" class="img-responsive" alt="">
                <div class="arriv-info1">
                    <h3>NEW ARRIVALS</h3>
                    <p>REVIVE YOUR WARDROBE WITH CHIC KNITS</p>
                    <div class="crt-btn">
                        <a href="/listProduct/${true}/false/false">SHOP NOW</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 arriv-right1">
                <img src="${pageContext.request.contextPath}/resources/images/4.jpg" class="img-responsive" alt="">
                <div class="arriv-info2">
                    <a href="/listProduct/${false}/SHOES/false"><h3>Trekking Shoes<i class="ars"></i></h3></a>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="arriv-las">
            <div class="col-md-4 arriv-left2">
                <img src="${pageContext.request.contextPath}/resources/images/5.jpg" class="img-responsive" alt="">
                <div class="arriv-info2">
                    <a href="#"><h3>Casual Glasses<i class="ars"></i></h3></a>
                </div>
            </div>
            <div class="col-md-4 arriv-middle">
                <img src="${pageContext.request.contextPath}/resources/images/6.jpg" class="img-responsive" alt="">
                <div class="arriv-info3">
                    <h3> LUGGAGE & BAGS </h3>
                    <div class="crt-btn">
                        <a href="/listProduct/${false}/LUGGAGE_AND_BAGS/false">SHOP NOW</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 arriv-right2">
                <img src="${pageContext.request.contextPath}/resources/images/7.jpg" class="img-responsive" alt="">
                <div class="arriv-info2">
                    <a href="/listProduct/${false}/WATCHES/false"><h3>Elegant Watches<i class="ars"></i></h3></a>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<%-- start special Offers--%>
<div class="special">
    <div class="container">
        <h3>Special Offers</h3>
        <div class="specia-top">
            <ul class="grid_2">
                <c:forEach items="${specialOffers}" var="product">
                    <li>
                        <a href="/details/${product.id}">
                            <img src="/img/${product.avatarPhoto}"
                                 class="img-responsive" alt="">
                        </a>
                        <div class="special-info grid_1 simpleCart_shelfItem">
                            <h5>${product.name}</h5>
                            <div class="item_add"><span class="item_price"><h6>ONLY $${product.price}</h6></span></div>
                                <%--<div class="item_add"><span class="item_price"><a href="/addToCart/${product.id}">add to cart</a></span></div>--%>
                        </div>
                    </li>
                </c:forEach>
                <div class="clearfix"></div>
            </ul>
        </div>
    </div>
</div>
<%-- end special Offers--%>
<myTag:container/>
</body>
</html>