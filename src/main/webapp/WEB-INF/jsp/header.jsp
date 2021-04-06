<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en" xmlns:th="http://www.w3.org./1999/xhtml" xmlns:sec="http://www.w3.org./1999/xhtml">
<head fragment="common-header">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <title>Met Shop</title>
    <link rel="icon" href="/image/icon-logo.png">
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito|Roboto|Roboto+Condensed|Roboto+Slab" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- Tables plugin -->
    <link href="/css/datatables.min.css" rel="stylesheet">
    <!-- Bootstrap tagsinput -->
    <link href="/css/tagsinput.css" rel="stylesheet">
    <!-- Simple pagination -->
    <link href="/css/simplePagination.css" rel="stylesheet" />
    <!-- Slick carousel -->
    <link href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" rel="stylesheet" />
    <link href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Feather icons -->
    <script src="https://unpkg.com/feather-icons"></script>

</head>


<body>
<div >
    <nav class="navbar navbar-expand-md navbar-light bg-light fixed-top shadow-sm">
        <a class="navbar-brand" href="@{/}"><img width="150" height="30" src="/image/logo.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarCollapse" aria-controls="navbarCollapse"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto font-weight-bold">
                <li class="nav-item">
                    <a class="nav-link" href="/"> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/store"> Store </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/shopping-cart/cart">Shopping Cart
                        <span class="badge badge-primary badge-pill" style="vertical-align: top;" text="${shoppingCartItemNumber} > 0 ? ${shoppingCartItemNumber}"></span></a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto font-weight-bold">
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link"  href="/login">My Account </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link"  href="/my-profile">My Account</a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link"  href="/logout"> Log Out </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="/article/article-list"> ADMIN PORTAL</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </nav>


</div>