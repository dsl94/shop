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
                    <small class="text-secondary">Last seen ${#dates.format(#dates.createNow(), 'MMM dd, yyyy')}</small>
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
                    <h3>My Orders</h3><hr>
                    <div class="table-responsive">
                        <table class="table table-hover" data-addclass-on-xs="table-sm">
                            <thead class="thead-light">
                            <tr>
                                <th scope="col">Order ID</th>
                                <th scope="col">Date</th>
                                <th scope="col" class="text-right">Total</th>
                                <th scope="col" class="text-center">Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orders}" var="order">
                            <tr >
                                <th scope="row" ><a href="/order-detail?order=${order.id}" class="text-primary">ORD<span >${order.id}</span></a></th>
                                <td>${#dates.format(order.orderDate, 'dd-MMM-yyyy')}</td>
                                <td class="text-right">$<span>${order.orderTotal}</span></td>
                                <td class="text-center"><span class="badge badge-info rounded">${order.orderStatus}</span></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div> <!--  end container -->
<jsp:include page="footer.jsp"/>
</body>
</html>