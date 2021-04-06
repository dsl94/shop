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
    <form action="/shopping-cart/update-item" method="post">
        <input hidden="hidden" id="newqty" name="qty">
        <input hidden="hidden" id="newid" name="id">
        <div class="card">
            <div class="card-body">
                <c:forEach items="${cartItemList}" var="cartItem">
                <div class="row border-bottom  pb-2 pt-2" >
                    <div class="col-12 col-md-6">
                        <div class="row align-items-center">
                            <div class="col-4">
                                <a href="/article-detail?id=${cartItem.article.id}"><img class="img-fluid" src="${cartItem.article.picture}" alt="${cartItem.article.title}"></a>
                            </div>
                            <div class="col-8">
                                <a href="/article-detail?id=${cartItem.article.id}" class="h6 bold d-inline-block" text=${cartItem.article.title}></a>
                                <div><i data-feather="check-circle" class="text-success"></i> In Stock</div>
                                <div><small><b>Size</b>: <span>${cartItem.size}</span></small></div>
                                <small><b>Unit Price</b>: $<span>${#numbers.formatDecimal(cartItem.article.price, 0, 'COMMA', 2, 'POINT')}</span></small>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="row align-items-center mt-3">
                            <div class="col-5">
                                <div class="row ">
                                    <label for="${cartItem.id}" class="col-sm-6 col-form-label text-sm-right">Qty</label>
                                    <div class="col-sm-6">
                                        <input id="${cartItem.id}"
                                               type="number" min="0" max="${cartItem.article.stock}"
                                               class="form-control cartItemQty" value="${cartItem.qty}">
                                        <button style="display: none;"
                                                id="'update-item-'+${cartItem.id}" type="submit"
                                                class="btn btn-warning btn-xs">Update</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-5 text-right">
                                <span class="font-weight-bold">$ <span id="'price'${cartItem.id}" text="${#numbers.formatDecimal(cartItem.subtotal, 0, 'COMMA', 2, 'POINT')}"></span></span>
                            </div>
                            <div class="col-2 ">
                                <a href="/shopping-cart/remove-item?id=${cartItem.id}"><i class="mb-1" data-feather="trash-2"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <div class="text-center mt-3">
                    <c:if test="${#lists.isEmpty(cartItemList)}">
                    <div>The cart is empty! </div>
                    </c:if>
                    <small class="counter">TOTAL</small>
                    <h3 class="font-weight-bold">$ <span >${#numbers.formatDecimal(shoppingCart.getGrandTotal(), 0, 'COMMA', 2, 'POINT')}</span></h3>
                    <a href="/store" class="btn btn-info rounded-pill "><i data-feather="arrow-left"></i> Back to shop</a>
                    <a href="/checkout" class="btn btn-primary rounded-pill">Checkout <i data-feather="arrow-right"></i></a>
                </div>
            </div>
        </div>
    </form>
</div>

<jsp:include page="footer.jsp"/>

<script>
    $(document).ready(function(){
        $(".cartItemQty").on('change', function(){
            var id=this.id;
            var qty=this.value;
            $('#newqty').val(qty)
            $('#newid').val(id)
            $('#update-item-'+id).css('display', 'inline-block');
        });
    });
</script>

</body>
</html>