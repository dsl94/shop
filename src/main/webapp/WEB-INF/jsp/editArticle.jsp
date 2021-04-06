<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org./1999/xhtml" xmlns:sec="http://www.w3.org./1999/xhtml">
<body>

<jsp:include page="adminHome.jsp"/>

<div class="container page-content">
    <form action="/article/edit" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend class="center-block">
                Edit Article Information
            </legend>

            <input hidden="hidden" name="id" value="${article.id}">

            <div class="form-group row">
                <label for="title" class="col-2 col-form-label text-right">Title</label>
                <div class="col-6">
                    <input value="${article.title}" type="text" class="form-control" id="title" name="title" >
                </div>
            </div>
            <div class="form-group row">
                <label for="category" class="col-2 col-form-label text-right">Category</label>
                <div class="col-6">
                    <input type="text" class="form-control" id="categories" name="category" data-role="tagsinput" value="${preselectedCategories}">
                </div>
                <div class="col-4">
                    <c:forEach items="${allCategories}" var="item">
                        <button type=button
                                class="btn btn-primary btn-category badge badge-pill badge-primary mr-1 mb-1"
                                id="item+${category}">${item}</button>
                    </c:forEach>
                </div>
            </div>
            <div class="form-group row">
                <label for="brand" class="col-2 col-form-label text-right">Sizes</label>
                <div class="col-6">
                    <input type="text" class="form-control" id="sizes" name="size" data-role="tagsinput" value="${preselectedSizes}">
                </div>
                <div class="col-4">
                    <c:forEach items="${#lists.sort(allSizes)}" var="item">
                        <button type=button class="btn btn-primary btn-size" id="size+${item}">${item}</button>
                    </c:forEach>
                </div>
            </div>
            <div class="form-group row">
                <label for="brand" class="col-2 col-form-label text-right">Brand</label>
                <div class="col-6">
                    <input type="text" class="form-control" id="brands" name="brand" data-role="tagsinput" value="${preselectedBrands}">
                </div>
                <div class="col-4">
                    <c:forEach items="${allBrands}" var="item">
                        <button type=button class="btn btn-primary btn-brand badge badge-pill badge-primary mr-1 mb-1"
                                id="brand+${item}">${#strings.capitalize(item)}</button>
                    </c:forEach>
                </div>
            </div>

            <div class="form-group row">
                <label for="price" class="col-2 col-form-label text-right">Price</label>
                <div class="col-6 input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">$</span>
                    </div>
                    <input value="${article.price}" type="number" name="price" step="0.1"
                           class="form-control" id="price" placeholder="List Price" />
                </div>
            </div>

            <div class="form-group row">
                <label for="stock" class="col-2 col-form-label text-right">Available stock</label>
                <div class="col-6">
                    <input value="${article.stock}" type="number"
                           name="stock" class="form-control" id="stock"
                           placeholder="Number of in-stock" />
                </div>
            </div>


            <div class="form-group row">
                <label for="picture" class="col-2 col-form-label text-right">Article image link</label>
                <div class="col-6">
                    <input value="${article.picture}" type="text" class="form-control" id="picture" name="picture" >
                </div>
            </div>

            <div class="form-group row">
                <div class="offset-2 col-6">
                    <button type="submit" class="btn btn-success">Update Article</button>
                    <a class="btn btn-danger" href="/admin">Cancel</a>
                </div>
            </div>
        </fieldset>
    </form>
</div>

<jsp:include page="footer.jsp"/>
<script src="/js/tagsinput-custom.js"></script>
</body>
</html>