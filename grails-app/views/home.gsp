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

        .form-group {
            width: 275px;
        }

    </style>
</head>

<body>
<div class="container">
    <h2>@${user.username}</h2>
    <h4>You are being followed by ${user.followers} users</h4>
    <h4>You are following ${user.following} users</h4><br>
<g:form controller="User" action="searchUser">
    <div class="form-group">
        <input type="text" name="searchUser" class="form-control" placeholder="Search users to follow">
    </div>
    <button type="submit" class="btn btn-default">Search</button>
</div><br>
</g:form>
<div class="container">
    <g:link controller="User" action="logOut">Log out</g:link>
</div><br>
<div class="container">
    <p>There are ${user.count} registered users worldwide.</p>
</div><br><br>
<div class="container">
    <h3>Most followed users</h3>
    <g:each in="${mostFollowedUsers}">
        <p>@${it.username}:  ${it.followers} followers</p>
    </g:each>
</div>
</body>
</html>