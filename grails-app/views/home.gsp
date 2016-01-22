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

        .most-followed {
            border: solid;
            border-width: 1px;
            border-color: #dddddd;
            border-radius: 3px;
            width: 250px;
            margin-left: -10px;

        }

        .searched-yourself-label {
            color: red;
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
        <input type="text" name="searchUser" class="form-control" placeholder="Search users to follow" required>
    </div>
    <g:if test="${followers.UserController.searchedFailed == 1}">
        <div class="">
            <p class="searched-yourself-label">You can't search yourself.</p>
        </div>
    </g:if>
    <g:if test="${followers.UserController.searchedFailed == 2}">
        <div class="">
            <p class="searched-yourself-label">User not found :(</p>
        </div>
    </g:if>
    <button type="submit" class="btn btn-default">Search</button>
</div><br>
</g:form>
<br>
<div class="container">
    <div class="container most-followed">
    <h3>Most followed users</h3>
    <g:each in="${mostFollowedUsers}">
        <p>@${it.username}:  ${it.followers} followers</p>
    </g:each>
    </div>
</div><br>
<div class="container">
    <p>There are ${user.count} registered users worldwide.</p>
</div>
<div class="container">
    <g:link controller="User" action="logOut">Log out</g:link>
</div>
</body>
</html>