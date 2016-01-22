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

    </style>
</head>

<body>
<g:form controller="User" action="logIn" class="container logIn-form" role="form">
    <div class="form-group">
        <input  type="email" name="username" class="form-control inputs" placeholder="Username">
    </div>
    <div class="form-group">
        <input type="password" name="password" class="form-control inputs" placeholder="Password">
    </div>
    <button type="submit" class="btn btn-primary">Log in</button>
    <div class="checkbox">
        <a href="/followers/signup">Don't have an account?</a>
    </div>
</g:form>
</body>
</html>