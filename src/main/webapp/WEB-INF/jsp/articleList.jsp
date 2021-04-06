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
    <table id="table-article" class="table table-striped table-bordered table-hover">
        <thead class="thead-dark">
        <tr>
            <th>Title</th>
            <th>Category</th>
            <th>Brand</th>
            <th>Sizes</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Operation</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${articles}" var="article">

            <tr>
                <td>${article.title}</td>
                <td>
                    <div style="display:flex;">
                        <c:forEach items="${article.categories}" var="item">
                            <span class="badge badge-secondary mt-1 mr-1">${item.getName()}</span>
                        </c:forEach>
                    </div>
                </td>
                <td>
                    <div style="display:flex;">
                        <c:forEach items="${article.brands}" var="item">
                            <span class="badge badge-secondary mt-1 mr-1">${item.getName()}</span>
                        </c:forEach>
                    </div>
                </td>
                <td>
                    <div style="display:flex;">
                        <c:forEach items="${article.sizes}" var="item">
                            <span class="badge badge-secondary mt-1 mr-1">${item.getValue()}</span>
                        </c:forEach>
                    </div>
                </td>
                <td>${article.price}</td>
                <td>${article.stock}</td>
                <td><a href="/article/edit?id=${article.id}" class="badge badge-primary">EDIT</a>
                    <a href="/article/delete?id=${article.id}" class="badge badge-danger">DELETE </a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="footer.jsp"/>

<script>
    $(document).ready(function () {
        $('#table-article').DataTable({
            stateSave: true
        });
    });
</script>

</body>
</html>