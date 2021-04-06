<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
<!doctype html>
<html lang="en" xmlns:th="http://www.w3.org./1999/xhtml">

<body>

<div class="container">
    <div class="text-center">
        <h1>Something went wrong!</h1>
        <a href="/" class="btn btn-primary btn-lg my-3">Go Home</a>
    </div>
    <table class="table">
        <tr>
            <td>Error</td>
            <td>${error}</td>
        </tr>
        <tr>
            <td>Status</td>
            <td>${status}</td>
        </tr>
        <tr>
            <td>Path</td>
            <td>${path}</td>
        </tr>
        <tr>
            <td>Date</td>
            <td>${timestamp}</td>
        </tr>
        <tr>
            <td>Message</td>
            <td>${message}</td>
        </tr>
    </table>
</div>


</body>
</html>
