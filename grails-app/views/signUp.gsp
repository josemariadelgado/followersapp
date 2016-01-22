<%--
  Created by IntelliJ IDEA.
  User: MacbookPro
  Date: 21/1/16
  Time: 21:43
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <style type="text/css">

    .logIn-form {
        width: 350px;
        margin-top: 200px;
    }

    .inputs {
        border-radius: 3px;
        border-width: 1px;
        border-color: #eeeeee;

    }

    .btn {
        width: 100%;
    }

    .signup-failed-label {
        color: red;
    }

    </style>
</head>

<body>
<g:form controller="User" action="signUp" class="container logIn-form" role="form">
    <g:if test="${followers.UserController.signUpFailed != 1}">
    <div class="form-group">
        <input  type="text" name="username" pattern=".{3,20}" class="form-control inputs" placeholder="Username (3 - 20 characters)" required>
    </div>
    </g:if>
    <g:elseif test="${followers.UserController.signUpFailed == 1}">
        <div class="form-group">
            <input  type="text" name="username" pattern=".{3,20}" value="${username}" class="form-control inputs" placeholder="Username (3 - 20 characters)" required>
        </div>
    </g:elseif>
    <div class="form-group">
        <input type="password" name="password" pattern=".{6,20}" class="form-control inputs" placeholder="Password (6 - 20 characters)" required>
    </div>
    <div class="form-group">
        <input type="password" name="repeatPassword" pattern=".{6,20}"  class="form-control inputs" placeholder="Repeat your password" required>
    </div>
    <button type="submit" class="btn btn-primary">Create my account</button>
    <div class="checkbox">
        <g:link controller="User" action="index">Log in</g:link>
    </div>
    <g:if test="${followers.UserController.signUpFailed == 1}">
        <div>
            <p class="signup-failed-label">Password fields don't match</p>
        </div>
    </g:if>
    <g:elseif test="${followers.UserController.signUpFailed == 2}">
    <div>
        <p class="signup-failed-label">That username is not available :(</p>
    </div>
</g:elseif>
</g:form>
</body>
</html>