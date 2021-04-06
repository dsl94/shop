<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
<!doctype html>
<html lang="en" xmlns:th="http://www.w3.org./1999/xhtml">


<body class="d-flex flex-column">

<div class="container page-content">
    <div class="row">

        <div class="col-md-4 col-lg-3">
            <div class="card">
                <div class="card-body text-center">
                    <img src="/image/user/user.png" width="100" height="100" alt="User" class="rounded-circle mb-3">
                    <h5 class="bold mb-0" >${#strings.capitalize(user.username)}</h5>
                    <small class="text-secondary" >Last seen ${#dates.format(#dates.createNow(), 'MMM dd, yyyy')}</small>
                </div>
                <div class="list-group list-group-flush">
                    <a href="/my-profile" class="list-group-item list-group-item-action"><i data-feather="user" class="mr-3"></i> Profile</a>
                    <a href="/my-orders" class="list-group-item list-group-item-action"><i data-feather="shopping-bag" class="mr-3"></i> Orders</a>
                    <a href="/my-address" class="list-group-item list-group-item-action active"><i data-feather="map" class="mr-3"></i> Address</a>
                    <a href="/logout" class="list-group-item list-group-item-action text-danger"><i data-feather="log-out" class="mr-3"></i> Logout</a>
                </div>
            </div>
        </div>

        <div class="col mt-3 mt-md-0">
            <div class="card">
                <div class="card-body">
                    <h3>My Address</h3><hr>
                    <form action="/update-user-address" method="post">
                        <div class="form-row">
                            <div class="form-group col-12">
                                <label for="billingAddress">Address</label>
                                <input type="text" class="form-control" name="streetAddress" value="${user?.address?.streetAddress}">
                            </div>
                            <div class="form-group col-6 col-sm-5">
                                <label for="billingCountry">Country</label>
                                <input type="text" class="form-control" name="country" value="${user?.address?.country}">

                            </div>
                            <div class="form-group col-6 col-sm-5">
                                <label for="billingCity">City</label>
                                <input type="text" class="form-control"   name="city" value="${user?.address?.city}">
                            </div>
                            <div class="form-group col-3 col-sm-2">
                                <label for="billingZip">ZIP Code</label>
                                <input type="number" class="form-control" name="zipCode" value="${user?.address?.zipCode}">
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">UPDATE ADDRESS</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

    </div>
</div> <!--  end container -->

<jsp:include page="header.jsp"/>
</body>
</html>