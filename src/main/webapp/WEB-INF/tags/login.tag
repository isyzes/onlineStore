<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ attribute name="items"%>
<%@ attribute name="price"%>

<%--login--%>
<sec:authorize access="!isAuthenticated()">
    <div class="header_right">
        <div class="rgt-bottom">
            <div class="log">
                <div class="login">
                    <div id="loginContainer"><a href="#" id="loginButton"><span>Login</span></a>
                        <div id="loginBox">
                            <form id="loginForm" action="/login" method="post">
                                <fieldset id="body">
                                    <fieldset>
                                        <label for="email">Email Address</label>
                                        <input type="email" name="username" id="email">
                                    </fieldset>
                                    <fieldset>
                                        <label for="password">Password</label>
                                        <input type="password" name="password" id="password">
                                    </fieldset>
                                    <input type="submit" id="login" value="Sign in">
                                        <%--<label for="checkbox"><input type="checkbox" id="checkbox"> <i>Remember me</i></label>--%>
                                </fieldset>
                                <span><a href="#">Forgot your password?</a></span>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="reg">
                <a href="/register">REGISTER</a>
            </div>
            <div class="cart box_1">
                    <%--<a href="/checkout">--%>
                    <%--<h3><span class="simpleCart_total">$0.00</span> (<span id="simpleCart_quantity"--%>
                    <%--class="simpleCart_quantity">0</span>--%>
                    <%--items)<img src="${pageContext.request.contextPath}/resources/images/bag.png" alt="">--%>
                    <%--</h3>--%>
                    <%--</a>--%>
                    <%--<p><a href="javascript:" class="simpleCart_empty">(empty card)</a></p>--%>
                <div class="clearfix"></div>
            </div>
                <%--<div class="create_btn">--%>
                <%--<a href="/checkout">CHECKOUT</a>--%>
                <%--</div>--%>
            <div class="clearfix"></div>
        </div>
        <div class="search">
            <form action="/search">
                <%--action="/search" method="post"--%>
                <input type="text" value="" name="search" placeholder="search...">
                <input type="submit" value="">
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</sec:authorize>

<%--logout--%>
<sec:authorize access="isAuthenticated()">
    <div class="header_right">
        <div class="rgt-bottom">
            <div class="log">
                <h1></h1>
            </div>
            <div class="reg">
                <a href="/profile">My profile</a>
            </div>
            <div class="cart box_1">
                <a href="/checkout">
                    <h3>
                        <span >$ ${price}</span>
                        (<span >${items}</span> items)
                        <img src="${pageContext.request.contextPath}/resources/images/bag.png" alt=""></h3>
                </a>

                <div class="clearfix"></div>
            </div>
            <div class="create_btn">
                <form action="/logout" method="post">
                    <input type="submit" class="btn btn-primary" value="Log Out"/>
                </form>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="search">
            <form action="/search">
                <input type="text" value="" placeholder="search..." name="search">
                <input type="submit" value="">
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</sec:authorize>