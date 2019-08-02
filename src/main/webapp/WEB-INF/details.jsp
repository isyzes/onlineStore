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
    <title>Gretong a Ecommerce Category Flat Bootstarp Responsive Website Template | Details :: w3layouts</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/etalage.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/megamenu.js"></script>
    <script>$(document).ready(function () {
        $(".megamenu").megamenu();
    });</script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.etalage.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/menu_jquery.js"></script>
    <script>
        jQuery(document).ready(function ($) {

            $('#etalage').etalage({
                thumb_image_width: 300,
                thumb_image_height: 400,
                source_image_width: 900,
                source_image_height: 1200,
                show_hint: true,
                click_callback: function (image_anchor, instance_id) {
                    alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                }
            });

        });
    </script>

</head>
<body>
<!-- header_top -->
<myTag:navbar/>
<!-- header -->
<div class="header_bg">
    <div class="container">
        <div class="header">
            <div class="head-t">
                <div class="logo">
                    <a href="/"><img src="${pageContext.request.contextPath}/resources/images/logo.png"
                                     class="img-responsive" alt=""/> </a>
                </div>
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
                                                <li><a href="/list/${false}/${categories}/${section}"><c:out
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
<div class="container">
    <div class="women_main">
        <!-- start content -->
        <div class="row single">
            <div class="col-md-9 det">
                <div class="single_left">
                    <div class="grid images_3_of_2">
                        <ul id="etalage">

                            <li>
                                <img class="etalage_thumb_image"
                                     src="/img/${product.avatarPhoto}"
                                     class="img-responsive"/>
                                <img class="etalage_source_image"
                                     src="/img/${product.avatarPhoto}"
                                     class="img-responsive" title=""/>
                            </li>
                            <c:forEach items="${product.photos}" var="photo">
                                <li>
                                    <img class="etalage_thumb_image"
                                         src="/img/${photo}"
                                         class="img-responsive"/>
                                    <img class="etalage_source_image"
                                         src="/img/${photo}"
                                         class="img-responsive" title=""/>
                                </li>

                            </c:forEach>

                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="desc1 span_3_of_2">
                        <h3>${product.name}</h3>
                        <span class="brand">Brand: <a href="#">${product.brand} </a></span>
                        <br>
                        <span class="code">Product Code: Product ${product.id}</span>
                        <%--<p>when an unknown printer took a galley of type and scrambled it to make</p>--%>
                        <div class="price">
                            <span class="text">Price:</span>
                            <span class="price-new">$ ${product.price}</span>
                            <%--<span class="price-old">$100.00</span>--%>
                            <%--<span class="price-tax">Ex Tax: $90.00</span><br>--%>
                            <%--<span class="points"><small>Price in reward points: 400</small></span><br>--%>
                        </div>

                        <form action="/buyProduct/${product.id}" method="get">
                        <div class="det_nav1">
                            <h4>Select a size :</h4>
                            <div class=" sky-form col col-4">
                                <ul>

                                    <c:forEach items="${product.size}" var="size">
                                        <li>
                                            <label class="radio"><input type="radio" name="sizes" value="${size}"><i></i>${size}</label>
                                        </li>
                                    </c:forEach>

                                </ul>
                            </div>
                        </div>


                            <div class="registration_form">
                                <input type="submit" name="action" value="Add to Cart">
                                <input type="submit" name="action" value="Buy">
                            </div>

                            <%--<div class="btn_form">--%>
                                <%--<a href="/addToCart/${product.id}">Add to Cart</a>--%>
                                <%--<a href="/buyProduct/${product.id}">Buy</a>--%>
                            <%--</div>--%>
                        </form>
                        <%--<a href="#"><span>login to save in wishlist </span></a>--%>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-bottom1">
                    <h6>Details</h6>
                    <p class="prod-desc">${product.details}</p>
                </div>
                <div class="single-bottom2">
                    <h6>Related Products</h6>
                    <c:forEach items="${product.relatedProducts}" var="related">
                        <div class="product">
                            <div class="product-desc">
                                <div class="product-img">
                                    <img src="/img/${related.mainPhoto}"
                                         class="img-responsive " alt=""/>
                                </div>
                                <div class="prod1-desc">
                                    <h5><a class="product_link" href="/details/${related.id}">${related.name}</a></h5>
                                    <p class="product_descr"> ${related.details} </p>
                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="product_price">
                                <span class="price-access">$${related.price}</span>
                                <%--<button class="button1"><span>Add to cart</span></button>--%>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </c:forEach>

                </div>
            </div>
                        <div class="clearfix"></div>
        </div>
        <!-- end content -->
    </div>
</div>
<myTag:container/>
</body>
</html>