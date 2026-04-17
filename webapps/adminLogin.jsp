<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Login | Coffee Shop</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body style="background:#F5EFE6;">
<div class="auth-wrapper">
<div class="auth-card">
<div class="brand">
<div class="logo">&#9749;</div>
<h2>Coffee Shop Admin</h2>
<p>Sign in to manage your store</p>
</div>
<c:if test="${not empty error}">
<div class="alert alert-error">&#9888; ${error}</div>
</c:if>
<form action="adminLogin" method="post">
<div class="form-group">
<label>Username</label>
<input type="text" name="username" placeholder="admin" required>
</div>
<div class="form-group">
<label>Password</label>
<input type="password" name="password" placeholder="••••••••" required>
</div>
<button type="submit" class="btn-gold" style="width:100%;padding:13px;margin-top:8px;">Sign In</button>
</form>
<p style="text-align:center;margin-top:16px;font-size:13px;">
<a href="index.jsp" style="color:#8B7355;">&#8592; Back to Customer View</a>
</p>
</div>
</div>
</body>
</html>
