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
        <div class="col-md-3">
            <div class="w_sidebar">
                <div class="w_nav1">
                    <h4>All</h4>
                    <ul>
                        <li><a href="/listProduct/${false}/WOMEN/false">women</a></li>
                        <li><a href="/listProduct/${false}/MEN/false">men</a></li>
                        <li><a href="/listProduct/${true}/false/false">new arrivals</a></li>
                        <li><a href="/listProduct/${false}/SHOES/false">shoes</a></li>
                        <li><a href="/listProduct/${false}/WATCHES/false">watches</a></li>
                        <li><a href="/listProduct/${false}/LUGGAGE_AND_BAGS/false">luggage & bags</a></li>
                    </ul>
                </div>
                <h3>filter by</h3>
                <form>
                    <%--brand--%>
                    <section class="sky-form">
                        <h4>brand</h4>
                        <div class="row1 scroll-pane">
                            <div class="col col-4">
                                <label class="checkbox"><input type="checkbox" name="brand" value="Adidas"              <c:if test="${brand.contains('Adidas')}" >checked </c:if> ><i></i>Adidas</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Agent Provocateur"   <c:if test="${brand.contains('Agent Provocateur')}" >checked </c:if> ><i></i>Agent Provocateur</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Alexander McQween"   <c:if test="${brand.contains('Alexander McQween')}" >checked </c:if> ><i></i>Alexander McQween</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Burberry"            <c:if test="${brand.contains('Burberry')}" >checked </c:if> ><i></i>Burberry</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Calvin Klein"        <c:if test="${brand.contains('Calvin Klein')}" >checked </c:if> ><i></i>Calvin Klein</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Chanel"              <c:if test="${brand.contains('Chanel')}" >checked </c:if> ><i></i>Chanel</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Chantal Thomass"     <c:if test="${brand.contains('Chantal Thomass')}" >checked </c:if> ><i></i>Chantal Thomass</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Chloe"               <c:if test="${brand.contains('Chloe')}" >checked </c:if> ><i></i>Chloe</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Colins"              <c:if test="${brand.contains('Colins')}" >checked </c:if> ><i></i>Colins</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Converse"            <c:if test="${brand.contains('Converse')}" >checked </c:if> ><i></i>Converse</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Dior"                <c:if test="${brand.contains('Dior')}" >checked </c:if> ><i></i>Dior</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Dolce & Gabbana"     <c:if test="${brand.contains('Dolce & Gabbana')}" >checked </c:if> ><i></i>Dolce & Gabbana</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Dunhill"             <c:if test="${brand.contains('Dunhill')}" >checked </c:if> ><i></i>Dunhill</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Esprit"              <c:if test="${brand.contains('Esprit')}" >checked </c:if> ><i></i>Esprit</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Giorgio Armani"      <c:if test="${brand.contains('Giorgio Armani')}" >checked </c:if> ><i></i>Giorgio Armani</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Givenchy"            <c:if test="${brand.contains('Givenchy')}" >checked </c:if> ><i></i>Givenchy</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Gucci"               <c:if test="${brand.contains('Gucci')}" >checked </c:if> ><i></i>Gucci</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Guess"               <c:if test="${brand.contains('Guess')}" >checked </c:if> ><i></i>Guess</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="H&M"                 <c:if test="${brand.contains('H&M')}" >checked </c:if> ><i></i>H&M</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Hermes"              <c:if test="${brand.contains('Hermes')}" >checked </c:if> ><i></i>Hermes</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Intimissimi"         <c:if test="${brand.contains('Intimissimi')}" >checked </c:if> ><i></i>Intimissimi</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Kenzo"               <c:if test="${brand.contains('Kenzo')}" >checked </c:if> ><i></i>Kenzo</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Kira Plastinina"     <c:if test="${brand.contains('Kira Plastinina')}" >checked </c:if> ><i></i>Kira Plastinina</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Lacoste"             <c:if test="${brand.contains('Lacoste')}" >checked </c:if> ><i></i>Lacoste</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Lormar"              <c:if test="${brand.contains('Lormar')}" >checked </c:if> ><i></i>Lormar</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Louis Vuitton"       <c:if test="${brand.contains('Louis Vuitton')}" >checked </c:if> ><i></i>Louis Vuitton</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Mango"               <c:if test="${brand.contains('Mango')}" >checked </c:if> ><i></i>Mango</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Mexx"                <c:if test="${brand.contains('Mexx')}" >checked </c:if> ><i></i>Mexx</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Milavitsa"           <c:if test="${brand.contains('Milavitsa')}" >checked </c:if> ><i></i>Milavitsa</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Miu Miu"             <c:if test="${brand.contains('Miu Miu')}" >checked </c:if> ><i></i>Miu Miu</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Monica Ricci"        <c:if test="${brand.contains('Monica Ricci')}" >checked </c:if> ><i></i>Monica Ricci</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Morgan"              <c:if test="${brand.contains('Morgan')}" >checked </c:if> ><i></i>Morgan</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="NAF-NAF"             <c:if test="${brand.contains('NAF-NAF')}" >checked </c:if> ><i></i>NAF-NAF</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="New Look"            <c:if test="${brand.contains('New Look')}" >checked </c:if> ><i></i>New Look</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Nike"                <c:if test="${brand.contains('Nike')}" >checked </c:if> ><i></i>Nike</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="OGGI"                <c:if test="${brand.contains('OGGI')}" >checked </c:if> ><i></i>OGGI</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Ostin"               <c:if test="${brand.contains('Ostin')}" >checked </c:if> ><i></i>Ostin</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Prada"               <c:if test="${brand.contains('Prada')}" >checked </c:if> ><i></i>Prada</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Puma"                <c:if test="${brand.contains('Puma')}" >checked </c:if> ><i></i>Puma</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Ralph Lauren"        <c:if test="${brand.contains('Ralph Lauren')}" >checked </c:if> ><i></i>Ralph Lauren</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Reebok"              <c:if test="${brand.contains('Reebok')}" >checked </c:if> ><i></i>Reebok</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Reserved"            <c:if test="${brand.contains('Reserved')}" >checked </c:if> ><i></i>Reserved</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Salvatore Ferragamo" <c:if test="${brand.contains('Salvatore Ferragamo')}" >checked </c:if> ><i></i>Salvatore Ferragamo</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Savage"              <c:if test="${brand.contains('Savage')}" >checked </c:if> ><i></i>Savage</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Sela"                <c:if test="${brand.contains('Sela')}" >checked </c:if> ><i></i>Sela</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Topshop"             <c:if test="${brand.contains('Topshop')}" >checked </c:if> ><i></i>Topshop</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Triumph"             <c:if test="${brand.contains('Triumph')}" >checked </c:if> ><i></i>Triumph</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Versace"             <c:if test="${brand.contains('Versace')}" >checked </c:if> ><i></i>Versace</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Victorias Secret"    <c:if test="${brand.contains('Victorias Secret')}" >checked </c:if> ><i></i>Victorias Secret</label>
                                <label class="checkbox"><input type="checkbox" name="brand" value="Zara"                <c:if test="${brand.contains('Zara')}" >checked </c:if> ><i></i>Zara</label>
                            </div>
                        </div>
                    </section>
                    <%--colour--%>
                    <section class="sky-form">
                        <h4>colour</h4>
                        <div class="row1 scroll-pane">
                            <div class="col col-4">
                                <div class="det_nav1">
                                    <div class="sky-form col col-4">
                                        <c:forEach items="${colorAll}" var="col">
                                            <c:if test="${col.ordinal() == 0}">
                                                <ul>
                                            </c:if>

                                            <li>
                                                <label class="checkbox"><input type="checkbox" name="colour"
                                                                               value=${col}
                                                                               <c:if test="${colour != null}">
                                                                               <c:if test="${colour.contains(col)}"> checked </c:if>
                                                </c:if>><i></i>
                                                    <ul class="w_nav2">
                                                        <li><a class="<c:out value="${col}"/>"></a></li>
                                                    </ul>
                                                </label>
                                            </li>

                                            <c:if test="${(col.ordinal()+1) % 3 == 0}">
                                                </ul>
                                                <ul>
                                            </c:if>


                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <%--size--%>
                    <section class="sky-form">
                        <h4>size</h4>
                        <div class="row1 scroll-pane">
                            <div class="col col-4">
                                <c:forEach items="${sizeAll}" var="size">
                                    <label class="checkbox"><input type="checkbox" name="sizeProduct" value="${size}" .
                                    <c:if test="${sizeProduct != null}">
                                    <c:if test="${sizeProduct.contains(size)}"> checked </c:if>
                                    </c:if>
                                    ><i></i>${size}</label>
                                </c:forEach>
                            </div>
                        </div>
                    </section>

                    <div class="row1 scroll-pane">
                        <div class="registration_form">
                            <input type="submit" value="Show Result" name="submit">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- start content -->
        <div class="col-md-9 w_content">
            <div class="women">
                <a href="#"><h4>Enthecwear - <span>${products.totalElements} itemms</span></h4></a>
                <ul class="w_nav">

                    <li>Sort:</li>
                    <li class="page-item"><a class="page-link"
                                             href="${url}?page=1&size=${products.size}&sort=rating,desc">Rating</a></li>
                    |
                    <li class="page-item"><a class="page-link"
                                             href="${url}?page=1&size=${products.size}&sort=price,desc">price: High
                        Low</a></li>
                    |
                    <li class="page-item"><a class="page-link"
                                             href="${url}?page=1&size=${products.size}&sort=price,asc">price: Low
                        High</a></li>
                    |
                    <li>Page size:</li>
                    <li class="page-item"><a class="page-link" href="${url}?page=1&size=16&sort=${sortParam}">16</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="${url}?page=1&size=32&sort=${sortParam}">32</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="${url}?page=1&size=48&sort=${sortParam}">48</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="${url}?page=1&size=64&sort=${sortParam}">64</a>
                    </li>


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

            <li class="page-item"><a class="page-link"
                                     href="${url}?page=${1}&size=${products.size}&sort=${sortParam}">1</a></li>

            <c:set var="totalPages" value="${products.totalPages}"/>

            <c:if test="${products.totalPages ge 2}">
                <li class="page-item"><a class="page-link"
                                         href="${url}?page=${2}&size=${products.size}&sort=${sortParam}">2</a></li>
            </c:if>

            <c:if test="${products.totalPages ge 3}">
                <li class="page-item"><a class="page-link"
                                         href="${url}?page=${3}&size=${products.size}&sort=${sortParam}">3</a></li>
            </c:if>

            <c:if test="${products.totalPages ge 4}">
                <li class="page-item"><a class="page-link"
                                         href="${url}?page=${4}&size=${products.size}&sort=${sortParam}">4</a></li>
            </c:if>

            <c:if test="${products.totalPages ge 5}">
                <li class="page-item"><a class="page-link"
                                         href="${url}?page=${5}&size=${products.size}&sort=${sortParam}">5</a></li>
            </c:if>

            <c:if test="${products.totalPages ge 6}">
                <li class="page-item"><a class="page-link"
                                         href="${url}?page=${6}&size=${products.size}&sort=${sortParam}">6</a></li>
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