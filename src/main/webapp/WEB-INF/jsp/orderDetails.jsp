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
        <div class="col-12 col-sm-6 col-lg-4 mb-2 text-center text-left-lg">
            <h5 class="font-weight-bold">Order details</h5>
            <div class="list-group list-group-flush list-group-no-border list-group-sm">
                <div><strong>Date: </strong><span >${#dates.format(order.orderDate, 'dd-MMM-yyyy')}</span></div>
                <div><strong>Delivery date: </strong><span >${#dates.format(order.shippingDate, 'dd-MMM-yyyy')}</span></div>
                <div><strong>Current status: </strong><span>${order.orderStatus}</span></div>
            </div>
            <hr class="d-block d-sm-none">
        </div>
        <div class="col-12 col-sm-6 col-lg-4 mb-2 text-center">
            <h5 class="font-weight-bold">Shipping</h5>
            <div class="list-group list-group-flush list-group-no-border list-group-sm">
                <div><strong>Receiver: </strong><span>${order.shipping.receiver}</span></div>
                <div><strong>Address: </strong><span >${order.shipping.address.streetAddress}</span></div>
                <div><strong>City: </strong><span >${order.shipping.address.city}</span></div>
                <div><strong>Country: </strong><span >${order.shipping.address.country}</span></div>
                <div><strong>Zip Code: </strong><span >${order.shipping.address.zipCode}</span></div>
            </div>
            <hr class="d-block d-sm-none">
        </div>
        <div class="col-12 col-sm-6 col-lg-4 mb-2 text-center">
            <h5 class="font-weight-bold">Payment</h5>
            <div class="list-group list-group-flush list-group-no-border list-group-sm">
                <div><strong>Credit card: </strong><span>${order.payment.type}</span></div>
                <div><strong>Card owner: </strong><span>${order.payment.holderName}</span></div>
                <div><strong>Card number: </strong><span>${order.payment.cardNumber}</span></div>
            </div>
        </div>
    </div>
    <hr>
    <h5 class="font-weight-bold text-center">Purchased products</h5>
    <div class="row">

        <div class="card-body">
            <c:forEach items="${order.cartItems}" var="cartItem">
            <div class="row align-items-center border-bottom py-2"">
                <div class="col-12 col-md-6 mb-2">
                    <div class="row align-items-center">

                        <div class="col-4">
                            <a href="/article-detail?id=${cartItem.article.id}"><img class="img-fluid" src="${cartItem.article.picture}" alt="${cartItem.article.title}"></a>
                        </div>
                        <div class="col-8">
                            <a href="/article-detail?id=${cartItem.article.id}" class="h6 bold d-inline-block" >${cartItem.article.title}</a>
                            <br>
                            <div><small><b>Size</b>: <span${cartItem.size}"></span></small></div>
                            <small><b>Unit Price</b>: $<span>${#numbers.formatDecimal(cartItem.article.price, 0, 'COMMA', 2, 'POINT')}</span></small>
                        </div>

                    </div>
                </div>

                <div class="col-12 col-md-6 text-right">
                    <span>x<span>${cartItem.qty}</span> units: </span>
                    <span class="font-weight-bold text-info">$ <span id="'price'${cartItem.id}">${#numbers.formatDecimal(cartItem.subtotal, 0, 'COMMA', 2, 'POINT')}</span></span>
                </div>



            </div>
            </c:forEach>
            <div class="d-flex justify-content-center align-items-center mt-3">
                <div class="text-center">
                    <small class="counter">TOTAL</small>
                    <h3 class="font-weight-bold">$ <span >${#numbers.formatDecimal(order.orderTotal, 0, 'COMMA', 2, 'POINT')}</span></h3>
                </div>
            </div>
        </div>
    </div>
</div> <!--  end container -->
<jsp:include page="footer.jsp"/>
</body>
</html>