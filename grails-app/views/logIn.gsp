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
            border-radius: 3px;
        }

        .login-failed-label {
            color: red;
        }

        .registered-label {
            color: green;
        }

    </style>
</head>

<body>
<g:if test="${followers.UserController.logInFailed == 0}">
<g:form controller="User" action="logIn" class="container logIn-form" role="form">
    <g:if test="${followers.UserController.registered == 0}">
    <div class="form-group">
        <input  type="text" name="username" class="form-control inputs" placeholder="Username" required>
    </div>
    </g:if>
    <g:elseif test="${followers.UserController.registered == 1}">
        <div class="form-group">
            <input  type="text" name="username" value="${user.username}" class="form-control inputs" placeholder="Username" required>
        </div>
    </g:elseif>
    <div class="form-group">
        <input type="password" name="password" class="form-control inputs" placeholder="Password" required>
    </div>
    <button type="submit" class="btn btn-primary">Log in</button>
    <div class="checkbox">
        <g:link controller="User" action="signUpView">Don't have an account?</g:link>
    </div>
    <g:if test="${followers.UserController.registered == 1}">
        <div>
            <p class="registered-label">You have been succesfully signed up, now you can log in.</p>
        </div>
    </g:if>
</g:form>
</g:if>
<g:elseif test="${followers.UserController.logInFailed == 1}">
    <g:form controller="User" action="logIn" class="container logIn-form" role="form">
        <div class="form-group">
            <input  type="text" name="username" class="form-control inputs" value="${username}" placeholder="Username" required>
        </div>
        <div class="form-group">
            <input type="password" name="password" class="form-control inputs" placeholder="Password" required>
        </div>
        <button type="submit" class="btn btn-primary">Log in</button>
        <div class="checkbox">
            <g:link controller="User" action="signUpView">Don't have an account?</g:link>
        </div>
        <div>
            <p class="login-failed-label">Incorrect username or password</p>
        </div>
    </g:form>
</g:elseif>
</body>
</html>