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
        <div class="col-md-4 col-lg-3">
            <div class="card">
                <div class="card-body text-center">
                    <img src="/image/user/user.png" width="100" height="100" alt="User" class="rounded-circle mb-3">
                    <h5 class="bold mb-0" >${#strings.capitalize(user.username)}</h5>
                    <small class="text-secondary">Last seen ${#dates.format(#dates.createNow(), 'MMM dd, yyyy')}</small>
                </div>
                <div class="list-group list-group-flush">
                    <a href="/my-profile" class="list-group-item list-group-item-action"><i data-feather="user" class="mr-3"></i> Profile</a>
                    <a href="/my-orders" class="list-group-item list-group-item-action"><i data-feather="shopping-bag" class="mr-3"></i> Orders</a>
                    <a href="/my-address" class="list-group-item list-group-item-action active"><i data-feather="map" class="mr-3"></i> Address</a>
                    <a href="/logout" class="list-group-item list-group-item-action text-danger"><i data-feather="log-out" class="mr-3"></i> Logout</a>
                </div>
            </div>
        </div>

        <div class="col mt-3 mt-md-0">
            <c:if test="${updateSuccess}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Profile updated!</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            </c:if>
            <c:if test="${incorrectPassword}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Incorrect password</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            </c:if>
            <div class="card">
                <div class="card-body">
                    <h3>My Profile</h3><hr>
                    <form id="profileForm" action="/update-user-info" novalidate method="post">
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <label for="firstName">First Name</label>
                                <input type="text" class="form-control"
                                       id="firstName" name="firstName" value="${user.firstName}">
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="lastName">Last Name</label>
                                <input type="text" class="form-control"
                                       id="lastName" name="lastName" value="${user.lastName}">
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="userName">Username</label>
                                <input required="required" type="text" class="form-control"
                                       id="userName" name="username" value="${user.username}">
                                <div class="invalid-feedback">Username already in use. Choose another one.</div>
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="email">Email address</label>
                                <input required="required" type="text" class="form-control"
                                       id="email" name="email" value="${user.email}">
                                <div class="invalid-feedback">Email already used by an existing account.</div>
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="txtNewPassword">New password</label>
                                <input type="password" class="form-control"
                                       id="txtNewPassword" name="newPassword" autocomplete="new-password">
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="txtConfirmPassword">Confirm password</label>
                                <input type="password" class="form-control"
                                       id="txtConfirmPassword" >
                                <div class="invalid-feedback">Passwords do not match</div>
                            </div>
                            <div class="form-group col-12">
                                <button id="updateUserInfoButton" type="button" class="btn btn-primary">UPDATE PROFILE</button>
                            </div>
                        </div>

                        <!--  password check modal -->
                        <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle">Type your current password</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <input type="password" class="form-control" id="password" name="password">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  /password check modal -->
                    </form>
                </div>
            </div>
        </div>
    </div>

</div> <!--  end container -->
<jsp:include page="footer.jsp"/>

<script>
    function checkPasswordMatch() {
        var password = $("#txtNewPassword").val();
        var confirmPassword = $("#txtConfirmPassword").val();
        if (password == "" && confirmPassword == "") {
            $("#updateUserInfoButton").attr("disabled", false);
        } else {
            if (password != confirmPassword) {
                $("#updateUserInfoButton").attr("disabled", true);
                $("#txtConfirmPassword").addClass("is-invalid");
            } else {
                $("#updateUserInfoButton").attr("disabled", false);
                $("#txtConfirmPassword").removeClass("is-invalid");
            }
        }
    }

    $(document).ready(function(){
        $("#txtConfirmPassword").keyup(checkPasswordMatch);
        $("#txtNewPassword").keyup(checkPasswordMatch);
        $('#updateUserInfoButton').click(function() {
            console.log("clickeo")
            if ($('#txtNewPassword').val() == '') {
                $('#profileForm').submit()
            } else {
                $('#passwordModal').modal('show');
            }
        });
    });



</script>
</body>
</html>