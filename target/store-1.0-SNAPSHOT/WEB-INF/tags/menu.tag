<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div class="col-md-3 cart-total">
    <a class="continue" href="/editProfile">Edit profile</a>
    <a class="continue" href="/purchases">My purchases</a>
    <sec:authorize access="hasRole('ADMIN')">
        <a class="continue" href="/admin/editUser">Edit user list</a>
        <a class="continue" href="/admin/addNewProduct">Add new product</a>
        <a class="continue" href="/admin/editProduct">Edit product list</a>
    </sec:authorize>
    <div class="clearfix"></div>
</div>

<%--<div class="clearfix"></div>--%>
<%--<div class="clearfix"></div>--%>
