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

    </style>
</head>

<body>
<div class="container">
    <h2>@${user.username}</h2>
    <h4>Is being followed by ${user.followers} users</h4>
    <h4>Is following ${user.following} users</h4><br>
    <g:form controller="User" action="followUser">
        <button type="submit" class="btn btn-primary">Follow</button>
    </g:form>
</div>
</body>
</html>