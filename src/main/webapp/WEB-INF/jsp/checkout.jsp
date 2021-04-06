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
    <form action="/checkout" method="post">
        <div class="row">

            <!-- Checkout Info -->
            <div class="col-lg-8 mb-3">
                <c:if test="${missingRequiredField}">
                    <div>
                        <h5 class="alert alert-warning">There are some required fields missing.</h5>
                    </div>
                </c:if>

                <div id="accordion">
                    <div class="card">
                        <div class="card-header bg-white" id="headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link checkout-header" data-toggle="collapse"
                                        data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    REVIEW ITEMS <i data-feather="chevron-down" class="mb-1"></i>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                             data-parent="#accordion">
                            <div class="card-body border-bottom">
                                <c:forEach items="${cartItemList}" var="cartItem">
                                    <div class="row align-items-center border-bottom  pb-2 pt-2">
                                        <div class="col-12 col-md-6 mb-2">
                                            <div class="row align-items-center">
                                                <div class="col-4">
                                                    <a href="/article-detail?id=${cartItem.article.id}"><img
                                                            class="img-fluid" src="${cartItem.article.picture}"
                                                            alt="${cartItem.article.title}"></a>
                                                </div>
                                                <div class="col-8">
                                                    <a href="/article-detail?id=${cartItem.article.id}"
                                                       class="h6 bold d-inline-block">${cartItem.article.title}</a>
                                                    <div><i data-feather="check-circle" class="text-success"></i> In
                                                        Stock
                                                    </div>
                                                    <div><small><b>Size</b>: <span>${cartItem.size}</span></small></div>
                                                    <small><b>Unit Price</b>:
                                                        $<span>${#numbers.formatDecimal(cartItem.article.price, 0, 'COMMA', 2, 'POINT')}</span></small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-6 text-right">
                                            <span>x<span>${cartItem.qty}</span> units: </span>
                                            <span class="font-weight-bold text-info">$ <span
                                                    id="price${cartItem.id}">${#numbers.formatDecimal(cartItem.subtotal, 0, 'COMMA', 2, 'POINT')}</span></span>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="text-center mx-auto">
                                    <small class="counter">TOTAL</small>
                                    <h3 class="font-weight-bold">$
                                        <span>${#numbers.formatDecimal(shoppingCart.getGrandTotal(), 0, 'COMMA', 2, 'POINT')}</span>
                                    </h3>
                                </div>
                                <div class="d-flex flex-wrap justify-content-between align-items-center mt-3">
                                    <a href="/shopping-cart/cart" class="btn btn-info rounded-pill  "><i
                                            data-feather="arrow-left"></i> Edit cart</a>
                                    <a data-toggle="collapse" data-parent="#accordion"
                                       class="btn btn-primary rounded-pill " href="#collapseTwo">Next <i
                                            data-feather="arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header bg-white" id="headingTwo">
                            <h5 class="mb-0">
                                <button class="btn btn-link checkout-header" data-toggle="collapse"
                                        data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    SHIPPING <i data-feather="chevron-down" class="mb-1"></i>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="card-body border-bottom">
                                <div class="form-row">
                                    <div class="form-group col-12">
                                        <label for="receiver">Receiver Name</label>
                                        <input type="text" class="form-control" id="receiver" name="receiver"
                                               required="required"/>
                                    </div>
                                    <div class="form-group col-12">
                                        <label for="streetAddress">Address</label>
                                        <input type="text" class="form-control" id="streetAddress" name="streetAddress"
                                               required="required"/>
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="city">City</label> <input type="text"
                                                                              class="form-control" id="city" name="city"
                                                                              required="required"/>
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="country">Country</label> <input type="text"
                                                                                    class="form-control" id="country"
                                                                                    name="country"
                                                                                    required="required"/>
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="zipCode">Zipcode</label> <input
                                            type="text" class="form-control" id="zipCode"
                                            name="zipCode" required="required"/>
                                    </div>
                                </div>
                                <div class="mt-2 text-right">
                                    <a data-toggle="collapse" data-parent="#accordion"
                                       class="btn btn-primary rounded-pill" href="#collapseThree">Next <i
                                            data-feather="arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header bg-white" id="headingThree">
                            <h5 class="mb-0">
                                <button class="btn btn-link checkout-header collapsed" data-toggle="collapse"
                                        data-target="#collapseThree" aria-expanded="false"
                                        aria-controls="collapseThree">
                                    PAYMENT <i data-feather="chevron-down" class="mb-1"></i>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                             data-parent="#accordion">
                            <div class="card-body border-bottom">
                                <div class="row">
                                    <div class="col-12">
                                        <img src="/image/creditcard.png" class="img-fluid mb-2"/><br/>
                                        <div class="form-group">
                                            <label for="cardType">Select Card Type: </label> <select
                                                class="form-control" id="cardType" name="type">
                                            <option value="visa">Visa</option>
                                            <option value="mastercard">Mastercard</option>
                                            <option value="discover">Discover</option>
                                            <option value="amex">American Express</option>
                                        </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="cardHolder">Card Holder Name:</label> <input
                                                type="text" class="form-control" id="cardHolder"
                                                required="required" name="holderName">
                                        </div>
                                        <div class="form-group">
                                            <label for="cardNumber">Card Number:</label>
                                            <div class="input-group">
                                                <input type="tel" class="form-control" id="cardNumber"
                                                       required="required" name="cardNumber">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-7">
                                        <div class="form-group">
                                            <label>Expiration Date</label>
                                            <div class="row">
                                                <div class="col-6">
                                                    <select class="form-control" name="expiryMonth"
                                                            required="required">
                                                        <option disabled="disabled">-- Month --</option>
                                                        <option value="1">Jan (01)</option>
                                                        <option value="2">Feb (02)</option>
                                                        <option value="3">Mar (03)</option>
                                                        <option value="4">Apr (04)</option>
                                                        <option value="5">May (05)</option>
                                                        <option value="6">June (06)</option>
                                                        <option value="7">July (07)</option>
                                                        <option value="8">Aug (08)</option>
                                                        <option value="9">Sep (09)</option>
                                                        <option value="10">Oct (10)</option>
                                                        <option value="11">Nov (11)</option>
                                                        <option value="12">Dec (12)</option>
                                                    </select>
                                                </div>
                                                <div class="col-6">
                                                    <select class="form-control" name="expiryYear">
                                                        <option disabled="disabled">-- Year --</option>
                                                        <option value="2020">2020</option>
                                                        <option value="2021">2021</option>
                                                        <option value="2022">2022</option>
                                                        <option value="2023">2023</option>
                                                        <option value="2024">2024</option>
                                                        <option value="2025">2025</option>
                                                        <option value="2026">2026</option>
                                                        <option value="2027">2027</option>
                                                        <option value="2028">2028</option>
                                                        <option value="2029">2029</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-5">
                                        <div class="form-group">
                                            <label for="cardCVC">CV Code</label> <input id="cardCVC"
                                                                                        type="tel" class="form-control"
                                                                                        name="cvc"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-2 text-right">
                                    <a data-toggle="collapse" data-parent="#accordion"
                                       class="btn btn-primary rounded-pill" href="#collapseThree">Next <i
                                            data-feather="arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!--  end accordion -->
            </div>


            <!-- Summary Panel -->
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header bg-white checkout-header">ORDER SUMMARY</div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <span>Cart subtotal</span>
                            <span>$ <span>${#numbers.formatDecimal(shoppingCart.getGrandTotal(), 0, 'COMMA', 2, 'POINT')} </span></span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span>Shipping</span>
                            <span>$0.00</span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between">
                            <span>Total</span>
                            <span class="font-weight-bold">$ <span>${#numbers.formatDecimal(shoppingCart.getGrandTotal(), 0, 'COMMA', 2, 'POINT')} </span></span>
                        </div>
                    </div>
                    <div class="card-footer bg-white border-top-0">
                        <button type="submit" class="btn btn-primary rounded-pill btn-lg btn-block mt-2 mb-3">
                            Place your order
                        </button>
                        <p style="font-size: smaller;">
                            By placing your order, you agree to Met Shop <a href="#">privacy</a>
                            notice and <a href="#">conditions</a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </form>

</div> <!--  end container -->
<jsp:include page="footer.jsp"/>


</body>
</html>