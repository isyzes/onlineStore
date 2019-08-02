<%@ taglib prefix="myTag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
    <title>Gretong a Ecommerce Category Flat Bootstarp Responsive Website Template | Register :: w3layouts</title>
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

        <div class="registration_form">
            <p class="text-success h5"> ${changeSuccessful}</p>

            <form id="registration_form" action="/editProfile" method="post">
                <div>
                    <label>
                        <input name="first name" placeholder="first name:" type="text" value="${user.firstName}">
                        <p class="text-danger h6"> ${firstNameError}</p>

                    </label>
                </div>
                <div>
                    <label>
                        <input name="last name" placeholder="last name:" type="text"  value="${user.lastName}">
                        <p class="text-danger h6"> ${lastNameError}</p>

                    </label>
                </div>
                <div>
                    <label>
                        <input name="email" placeholder="email address:" type="email"  value="${user.email}">
                        <p class="text-danger h6"> ${emailError}</p>


                    </label>
                </div>
                <div class="sky-form">
                    <div class="sky_form1">
                        <ul>
                            <li><label class="radio left"><input type="radio" name="radio" value="MALE"
                                                                 checked=""><i></i>Male</label></li>
                            <li><label class="radio"><input type="radio" name="radio"
                                                            value="FEMALE"><i></i>Female</label></li>
                            <div class="clearfix"/>
                        </ul>
                    </div>
                </div>
                <div>
                    <label>
                        <input name="old password" placeholder="old password" type="password" \>
                        <p class="text-danger h6"> ${oldPasswordError}</p>

                    </label>
                </div>
                <div>
                    <label>
                        <input name="new password" placeholder="new password" type="password">
                        <p class="text-danger h6"> ${passwordError}</p>

                    </label>
                </div>
                <div>
                    <label>
                        <input name="retype password" placeholder="retype password" type="password">
                        <p class="text-danger h6"> ${passwordError}</p>

                    </label>
                </div>
                <div>
                    <input type="submit" value="Edit" id="register-submit1" name="submit">
                    <input type="submit" value="Cancel" id="register-submit2" name="submit">

                </div>
            </form>
        </div>

        <div class="clearfix"></div>
    </div>
    </div>
</div>

<myTag:container/>
</body>
</html>
