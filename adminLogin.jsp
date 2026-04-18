<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login | Coffee Shop</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body style="background: linear-gradient(135deg, #3A1F1C 0%, #5A2E28 100%); min-height:100vh;">
<div class="auth-wrapper">
<div class="auth-card">
<div class="brand">
<div class="logo">&#9749;</div>
<h2>Admin Panel</h2>
<p>Sign in to manage your coffee shop</p>
</div>
<%-- Error from AdminLoginServlet --%>
<c:if test="${not empty error}">
<div class="alert alert-error">&#9888;&nbsp; ${error}</div>
</c:if>
<form action="adminLogin" method="post">
<div class="form-group">
<label>Username</label>
<input type="text" name="username"
placeholder="admin" required autocomplete="username">
</div>
<div class="form-group">
<label>Password</label>
<input type="password" name="password"
placeholder="&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;"
required autocomplete="current-password">
</div>
<button type="submit" class="btn-gold"
style="width:100%; padding:14px; margin-top:10px; font-size:15px;">
Sign In &nbsp;&#8594;
</button>
</form>
<p style="text-align:center; margin-top:20px; font-size:13px;">
<a href="index.jsp" style="color:#8B7355;">
&#8592; Back to Customer View
</a>
</p>
</div>
</div>
</body>
</html>