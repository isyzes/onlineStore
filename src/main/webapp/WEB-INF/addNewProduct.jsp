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
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <meta charset="utf-8" name="keywords" content="Gretong Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>

    <!-- start menu -->
    <link href="${pageContext.request.contextPath}/resources/css/megamenu.css" rel="stylesheet" type="text/css"
          media="all"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/etalage.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/megamenu.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.etalage.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menu_jquery.js"></script>
    <script type="text/javascript"> $(document).ready(function () {
        $(".megamenu").megamenu();
    });</script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/section.js"></script>

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
                <myTag:logo/>
                <!-- start header_right -->
                <myTag:login price="${user.priceBasket}" items="${user.itemsBasket}"/>
                <div class="clearfix"></div>
            </div>

        </div>
    </div>
</div>
<!-- content -->
<div class="container">
    <div class="check">
        <myTag:menu/>
        <div class="col-md-9 cart-items">
            <p class="text-success h5"> ${success}</p>
            <form action="/admin/addNewProduct" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" placeholder="Name" name="name">
                        <p class="text-danger h6"> ${nameError}</p>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" placeholder="Brand" name="brand">
                        <p class="text-danger h6"> ${brandError}</p>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-12">
                        <input type="number" step="0.01" class="form-control" placeholder="Price" name="price">
                        <p class="text-danger h6"> ${priceError}</p>
                    </div>
                </div>

                <div class="det_nav1">
                    <label class="col-sm-2 col-form-label">Select a size:</label>
                    <div class="sky-form col col-4">
                        <ul>
                            <c:forEach items="${size}" var="item">
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="size" value="${item}"><i></i><c:out
                                            value="${item}"/>
                                    </label>
                                </li>
                            </c:forEach>
                        </ul>
                        <p class="text-danger h6"> ${sizesError}</p>
                    </div>
                </div>

                <br>

                <div class="sky-form">
                    <label class="col-sm-2 col-form-label">Special Offers:</label>
                    <div class="sky_form1">
                        <ul>
                            <li><label class="radio left"><input type="radio" name="offers"
                                                                 value="true"><i></i>Yes</label>
                            </li>
                            <li><label class="radio"><input type="radio" name="offers" value="false" checked=""><i></i>No</label>
                            </li>
                            <p class="text-danger h6"> ${specialOffersError}</p>
                            <div class="clearfix"></div>
                        </ul>
                    </div>
                </div>

                <br>
                <br>

                <div class="sky-form">
                    <label class="col-sm-2 col-form-label">New Arrivals:</label>
                    <div class="sky_form1">
                        <ul>
                            <li><label class="radio left"><input type="radio" name="newArrivals"
                                                                 value="true"><i></i>Yes</label></li>
                            <li><label class="radio"><input type="radio" name="newArrivals" value="false"
                                                            checked=""><i></i>No</label></li>
                            <p class="text-danger h6"> ${newArrivalsError}</p>
                            <div class="clearfix"></div>
                        </ul>
                    </div>
                </div>

                <br>
                <br>

                <div class="det_nav1">
                    <label for="categories" class="col-sm-2 col-form-label">Categories:</label>
                    <div class="col-sm-8">
                        <select class="form-control" id="categories" name="categories"
                                onchange="makeSubmenuProduct(this.value)">
                            <option></option>
                            <c:forEach items="${categories}" var="categories">
                                <option value="${categories}"><c:out value="${categories}"/></option>
                            </c:forEach>
                        </select>
                        <p class="text-danger h6"> ${categoriesError}</p>
                    </div>
                </div>

                <br>
                <br>

                <div class="det_nav1">
                    <label for="section" class="col-sm-2 col-form-label">Section:</label>
                    <div class="col-sm-8">
                        <select class="form-control" id="section" name="section" size="1">

                        </select>
                        <p class="text-danger h6"> ${sectionError}</p>
                    </div>
                </div>

                <br>
                <br>

                <div class="det_nav1">
                    <h5>Select a colour :</h5>
                    <div class="sky-form col col-4">
                        <ul>
                            <c:forEach items="${colour}" var="item">
                                <li>
                                    <label class="checkbox"><input type="checkbox" name="colour"
                                                                   value="${item}"><i></i>
                                        <ul class="w_nav2">
                                            <li><a class="<c:out value="${item}"/>"></a></li>
                                        </ul>
                                    </label>
                                </li>
                            </c:forEach>
                        </ul>
                        <p class="text-danger h6"> ${colourError}</p>
                    </div>
                </div>

                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Details</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="4"
                              name="details"></textarea>
                    <p class="text-danger h6"> ${detailsError}</p>
                </div>

                <h5>Select a related products :</h5>

                <div class="form-group row">
                    <div class="col-sm-3">
                        <input type="number" step="1" class="form-control" placeholder="Id of product"
                               name="relatedProducts">
                    </div>

                    <div class="col-sm-3">
                        <input type="number" step="1" class="form-control" placeholder="Id of product"
                               name="relatedProducts">
                    </div>

                    <div class="col-sm-3">
                        <input type="number" step="1" class="form-control" placeholder="Id of product"
                               name="relatedProducts">
                    </div>
                </div>



                <h5>Select a photo :</h5>

                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Main Photo Size: 600x450</label>
                    <input type="file" class="form-control-file" name="photo">
                </div>

                <br>

                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Avatar Photo Size: 357x515</label>
                    <input type="file" class="form-control-file" name="photo">
                </div>

                <br>

                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Size: 357x515</label>
                    <input type="file" class="form-control-file" name="photo">
                </div>


                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Size: 357x515</label>
                    <input type="file" class="form-control-file" name="photo">
                </div>

                <div class="form-group">
                    <label class="col-sm-2 col-form-label">Size: 357x515</label>
                    <input type="file" class="form-control-file" name="photo">
                </div>

                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary">ADD</button>
                    </div>
                </div>
            </form>

            <div class="clearfix"></div>

            <div class="clearfix"></div>

            <!-- end content -->
        </div>

    </div>
</div>
<myTag:container/>
</body>
</html>