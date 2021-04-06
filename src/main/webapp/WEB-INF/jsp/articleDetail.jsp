<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>

<body class="d-flex flex-column">

<div class="container page-content mt-3 mb-3">
    <c:if test="${addArticleSuccess}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Added item to the shopping cart!</strong>
            <div class="d-flex mt-2">
                <a href="/store" class="btn btn-info rounded-pill mx-2"><i data-feather="arrow-left"></i> Continue
                    shopping</a>
                <a href="/shopping-cart/cart}" class="btn btn-primary rounded-pill mx-2">Go to shopping cart <i
                        data-feather="arrow-right"></i></a>
            </div>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <c:if test="${notEnoughStock}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Could not add to cart, only <span>${article.stock}</span> in stock.</strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <img class="img-fluid" src="${article.picture}">
                </div>
                <div class="col-md-6 mt-3 mt-md-0">
                    <h2 class="card-title" text="${article.title}"></h2>
                    <div class="d-flex align-items-center">
                        <h2 class="price font-weight-bold mr-3">
                            <span>$ ${article.price}</span>
                        </h2>
                        <h6>(<span>${article.stock}</span> in stock)</h6>
                    </div>
                    <p class="d-none d-lg-block">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta
                        voluptatibus quos ea dolore rem, molestias laudantium et explicabo assumenda fugiat deserunt in,
                        facilis laborum excepturi aliquid nobis ipsam deleniti aut? Aliquid sit hic id velit qui fuga
                        nemo suscipit obcaecati. Officia nisi quaerat minus nulla saepe aperiam sint possimus magni
                        veniam provident.</p>
                    <form action="/shopping-cart/add-item" method="post">
                        <input hidden="hidden" id="${article.id}" name="${article.id}" value="${article.id}">
                        <div class="form-row">
                            <div class="form-group col-sm-3">
                                <label class="font-weight-bold d-block">Size</label>
                                <select class="form-control" id="size" name="size">
                                    <c:forEach items="${article.sizes}">
                                        <option value="${size.getValue()}">${size.getValue()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-sm-3">
                                <label class="font-weight-bold" for="quantity">Quantity</label>
                                <select class="form-control" id="quantity" name="qty">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                            <div class="form-group col-sm-6 offset-sm-3 d-flex align-items-end">
                                <button type="submit" class="btn btn-primary btn-block rounded-pill atc-demo">Add to
                                    Cart
                                </button>
                            </div>
                        </div>
                    </form>
                    <hr>
                    <div class="pt-1 mb-2"><span class="text-medium">Brand:</span> Adidas</div>
                    <div class="padding-bottom-1x mb-2"><span class="text-medium">Categories:&nbsp;</span><a
                            class="navi-link" href="#">Men’s shoes,</a><a class="navi-link" href="#"> Snickers,</a><a
                            class="navi-link" href="#"> Sport shoes</a></div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
