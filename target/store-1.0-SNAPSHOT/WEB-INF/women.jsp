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
    <title>Gretong a Ecommerce Category Flat Bootstarp Responsive Website Template | Women :: w3layouts</title>
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
                <myTag:login price="${user.priceBasket}" items="${user.itemsBasket}" search="${search}"/>
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
            <!-- end header menu -->
        </div>
    </div>
</div>
<!-- content -->
<div class="container">
    <div class="women_main">
        <!-- start sidebar -->
        <myTag:filter/>

        <!-- start content -->
        <div class="col-md-9 w_content">
            <div class="women">
                <a href="#"><h4>Enthecwear - <span>${products.totalElements} itemms</span></h4></a>
                <ul class="w_nav">

                    <li>Sort:</li>
                    <li class="page-item"><a class="page-link" href="${url}?page=1&size=${products.size}&sort=rating,desc">Rating</a></li>
                    |
                    <li class="page-item"><a class="page-link" href="${url}?page=1&size=${products.size}&sort=price,desc">price: High Low</a></li>
                    |
                    <li class="page-item"><a class="page-link" href="${url}?page=1&size=${products.size}&sort=price,asc">price: Low High</a></li>
                    |
                    <li>Page size:</li>
                    <li class="page-item"><a class="page-link" href="${url}?page=1&size=16&sort=${sortParam}">16</a></li>
                    <li class="page-item"><a class="page-link" href="${url}?page=1&size=32&sort=${sortParam}">32</a></li>
                    <li class="page-item"><a class="page-link" href="${url}?page=1&size=48&sort=${sortParam}">48</a></li>
                    <li class="page-item"><a class="page-link" href="${url}?page=1&size=64&sort=${sortParam}">64</a></li>



                    <div class="clear"></div>
                </ul>
                <div class="clearfix"></div>
            </div>

            <!-- grids_of_4 -->

            <div class="grids_of_4">
                <c:forEach items="${products.content}" var="product">
                    <div class="grid1_of_4">
                        <div class="content_box"><a href="/details/${product.id}">
                            <img src="/img/${product.mainPhoto}"
                                 class="img-responsive"
                                 alt=""/>
                        </a>
                            <h4><a href="/details/${product.id}"> ${product.name}</a></h4>
                                <%--<p>It is a long established fact that</p>--%>
                            <div class="grid_1 simpleCart_shelfItem">

                                <div class="item_add"><span class="item_price"><h6>ONLY $${product.price}</h6></span>
                                </div>
                                    <%--<div class="item_add"><span class="item_price"><a href="#">add to cart</a></span></div>--%>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="clearfix"></div>
        <!-- end content -->
    </div>
</div>
<div class="container">
    <nav aria-label="...">
        <ul class="pagination">
            <li class="page-item disabled"><span class="page-link">Page Number:</span></li>

            <li class="page-item"><a class="page-link" href="${url}?page=${1}&size=${products.size}&sort=${sortParam}">1</a></li>

            <c:set var="totalPages" value="${products.totalPages}"/>

            <c:if test="${products.totalPages ge 2}">
                <li class="page-item"><a class="page-link" href="${url}?page=${2}&size=${products.size}&sort=${sortParam}">2</a></li>
            </c:if>

            <c:if test="${products.totalPages ge 3}">
                <li class="page-item"><a class="page-link" href="${url}?page=${3}&size=${products.size}&sort=${sortParam}">3</a></li>
            </c:if>

            <c:if test="${products.totalPages ge 4}">
                <li class="page-item"><a class="page-link" href="${url}?page=${4}&size=${products.size}&sort=${sortParam}">4</a></li>
            </c:if>

            <c:if test="${products.totalPages ge 5}">
                <li class="page-item"><a class="page-link" href="${url}?page=${5}&size=${products.size}&sort=${sortParam}">5</a></li>
            </c:if>

            <c:if test="${products.totalPages ge 6}">
                <li class="page-item"><a class="page-link" href="${url}?page=${6}&size=${products.size}&sort=${sortParam}">6</a></li>
            </c:if>

            <c:if test="${products.hasNext()}">
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </c:if>

        </ul>
    </nav>
</div>

<myTag:container/>
</body>
</html>