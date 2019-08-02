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

    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
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
                <div class="header_right">
                    <div class="rgt-bottom">
                        <div class="log">
                            <div class="login">
                                <div id="loginBox">
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                    <div class="search">
                        <form action="/search" method="post">
                            <input type="text" value="" placeholder="search..." name="search">
                            <input type="submit" value="">
                        </form>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>

            </div>
        </div>
        <!-- content -->
        <div class="container">
            <div class="main">
                <!-- start registration -->
                <div class="registration">
                    <div class="registration_left">
                        <h2>new user? <span> create an account </span></h2>
                        <!-- [if IE]
                            < link rel='stylesheet' type='text/css' href='ie.css'/>
                         [endif] -->

                        <!-- [if lt IE 7]>
                            < link rel='stylesheet' type='text/css' href='ie6.css'/>
                        <! [endif] -->

                        <script>
                            (function () {

                                // Create input element for testing
                                var inputs = document.createElement('input');

                                // Create the supports object
                                var supports = {};

                                supports.autofocus = 'autofocus' in inputs;
                                supports.required = 'required' in inputs;
                                supports.placeholder = 'placeholder' in inputs;

                                // Fallback for autofocus attribute
                                if (!supports.autofocus) {

                                }

                                // Fallback for required attribute
                                if (!supports.required) {

                                }

                                // Fallback for placeholder attribute
                                if (!supports.placeholder) {

                                }

                                // Change text inside send button on submit
                                var send = document.getElementById('register-submit');
                                if (send) {
                                    send.onclick = function () {
                                        this.innerHTML = '...Sending';
                                    }
                                }

                            })();
                        </script>

                        <div class="registration_form">
                            <!-- Form //id="registration_form"  -->
                            <form id="registration_form" action="/register" method="post">
                                <div>
                                    <label>
                                        <input name="first name" placeholder="first name:" type="text" tabindex="1"
                                               required autofocus value="${firstName}">
                                        <p class="text-danger h6"> ${firstNameError}</p>

                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <input name="last name" placeholder="last name:" type="text" tabindex="2"
                                               required autofocus value="${lastName}">
                                        <p class="text-danger h6"> ${lastNameError}</p>

                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <input name="email" placeholder="email address:" type="email" tabindex="3"
                                               required value="${email}">
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
                                        <input name="password" placeholder="password" type="password" tabindex="4"
                                               required>
                                        <p class="text-danger h6"> ${passwordError}</p>

                                    </label>
                                </div>
                                <div>
                                    <label>
                                        <input name="retype password" placeholder="retype password" type="password"
                                               tabindex="4" required>
                                        <p class="text-danger h6"> ${retypePasswordError}</p>

                                    </label>
                                </div>

                                <div>
                                    <div class="g-recaptcha" data-sitekey="6LcJz68UAAAAAH3bJLsp5O5eYURb26o8e5KQHuCK"></div>
                                    <p class="text-danger h6"> ${recaptchaError}</p>
                                </div>

                                <div class="sky-form">
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>
                                        i agree to shoppe.com &nbsp;<a class="terms" href="#"> terms of service</a> </label>
                                </div>

                                <div>
                                    <input type="submit" value="create an account" id="register-submit">
                                </div>


                            </form>
                            <!-- /Form -->
                        </div>
                    </div>
                    <div class="registration_left">
                        <h2>existing user</h2>
                        <div class="registration_form">
                            <!-- Form -->
                            <form action="/login" method="post">
                                <div>
                                    <label><input placeholder="email:" type="email" name="username" tabindex="3"
                                                  required></label>
                                </div>
                                <div>
                                    <label><input placeholder="password" type="password" name="password" tabindex="4"
                                                  required></label>
                                </div>
                                <div><input type="submit" value="sign in"></div>
                                <div class="forget">
                                    <a href="#">forgot your password</a>
                                </div>
                            </form>
                            <!-- /Form -->
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!-- end registration -->
            </div>
        </div>
        <myTag:container/>

</body>
</html>