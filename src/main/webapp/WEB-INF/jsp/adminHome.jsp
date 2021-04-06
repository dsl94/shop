<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org./1999/xhtml" xmlns:sec="http://www.w3.org./1999/xhtml">
<jsp:include page="header.jsp"/>

<body class="d-flex flex-column">
<div>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4 fixed-top">
        <a class="navbar-brand" href="/admin">ADMIN PORTAL</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarCollapse" aria-controls="navbarCollapse"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                       role="button" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false"> PRODUCTS </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/article/add">Add new product</a>
                        <a class="dropdown-item" href="/article/article-list">View product list</a>
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <sec:authorize access=isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="/"> BACK TO STORE </a>
                    </li>
                </sec:authorize>
                <sec:authorize access=isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="/logout"> LOG OUT </a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </nav>
</div>

</body>
</html>