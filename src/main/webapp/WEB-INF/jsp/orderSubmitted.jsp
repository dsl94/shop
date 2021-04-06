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
    <div class="card">
        <div class="card-body">
            <div class="text-center py-3">
                <i data-feather="check-circle" class="text-success" width="48" height="48"></i>
                <h1>Thank you.</h1>
                <p>Your order has been placed and will be processed as soon as possible.</p>
                <p class="mb-0">
                    <span class="text-muted">Order ID: </span>
                    <span class="text-info">#ORD<span >${order.id}</span></span>
                </p>
                <p>
                    <span class="text-muted">Amount: </span>
                    <span class="text-info">$ <span >${order.orderTotal}</span></span>
                </p>
                <p>The estimated delivery date is <span >${#dates.format(order.shippingDate, 'dd-MMM-yyyy')}</span></p>
                <a href="/store" class="btn btn-info rounded mb-3">CONTINUE SHOPPING</a>
                <a href="/order-detail?order=${order.id}" class="btn btn-primary rounded mb-3">VIEW ORDER</a>
            </div>
        </div>
    </div>
</div> <!-- end container -->

<jsp:include page="footer.jsp"/>
</body>
</html>