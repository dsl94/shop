<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<body class="d-flex flex-column">
<jsp:include page="header.jsp" />

<div class="container my-3 my-sm-5 page-content">
    <div class="row justify-content-center" id="row-login">
        <div class="col-sm-10 col-md-11 col-lg-9 col-xl-8">
            <div class="card card-login">
                <div class="card-body">
                    <div class="row">

                        <!-- Login Form -->
                        <div class="col-md-6 col-login">
                            <form action="/login" method="post" >
                                <div class="form-group text-center mb-2">
                                    <h2 class="mb-0">Log In</h2>
                                    <em>to your account</em>
                                </div>
                                <div class="form-group">
                                    <div class="input-icon">
                                        <i data-feather="user"></i>
                                        <input required="required" type="text" class="form-control" placeholder="Username" name="username"
                                        >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-icon">
                                        <i data-feather="lock"></i>
                                        <input required="required" type="password" class="form-control" placeholder="Password" name="password"
                                               >
                                        <div class="invalid-feedback">Incorrect username or password</div>
                                    </div>
                                </div>
                                <div class="form-group d-flex justify-content-between">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox"
                                               class="custom-control-input" id="loginRemember" name="remember-me">
                                        <label class="custom-control-label"
                                               for="loginRemember">Remember me</label>
                                    </div>
                                    <a href="#" class="text-primary small reset">Forgot
                                        password ?</a>
                                </div>
                                <button type="submit"
                                        class="btn btn-primary btn-block">LOGIN</button>
                            </form>
                        </div>
                        <!-- /Login Form -->

                        <span class="or-divider">OR</span>

                        <!-- Register Form -->
                        <div class="col-md-6 col-register">
                            <form action="/new-user" method="post">
                                <div class="form-group text-center">
                                    <h2 class="bold">Register</h2>
                                </div>
                                <div class="form-group">
                                    <div class="input-icon">
                                        <i data-feather="mail"></i>
                                        <input required="required" type="email" class="form-control"
                                               name="email" placeholder="Email address" >
                                        <div class="invalid-feedback">Email is already in use</div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-icon">
                                        <i data-feather="user"></i>
                                        <input required="required" type="text" class="form-control"
                                               placeholder="Username" name="username" >
                                        <div class="invalid-feedback">Username is already in use</div>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-icon">
                                        <i data-feather="lock"></i> <input type="password" required="required"
                                                                           class="form-control" name="new-password"
                                                                           placeholder="Password" autocomplete="new-password">
                                    </div>
                                </div>
                                <button type="submit"
                                        class="btn btn-outline-primary btn-block">REGISTER</button>
                            </form>
                        </div>
                        <!-- /Register Form -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />


</body>
</html>