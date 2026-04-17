<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Order Confirmed! | Coffee Shop</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav class="navbar">
<div class="navbar-brand">
<span class="logo-icon">&#9749;</span>
<h1>Coffee Shop</h1>
</div>
</nav>
<div class="container">
<div class="confirm-wrapper">
<div class="confirm-card">
<div class="check-circle">&#10003;</div>
<h2>Order Confirmed!</h2>
<p style="color:#8B7355;font-size:14px;margin-bottom:16px;">
Thank you, <b style="color:#4A2C2A;">${customerName}</b>! Your order is being prepared.
</p>
<div class="order-id-box">
<div style="font-size:12px;color:#8B7355;margin-bottom:4px;">ORDER ID</div>
<div class="order-num">#${orderId}</div>
</div>
<div class="info-row">
<span class="info-label">Table Number</span>
<span class="info-val">${tableNumber}</span>
</div>
<div class="info-row">
<span class="info-label">Amount Paid</span>
<span class="info-val" style="color:#C8922A;">Rs. ${totalAmount}</span>
</div>
<div class="wait-badge">&#8987; Estimated wait: 10-15 minutes</div>
<br>
<a href="menu" class="btn-gold">Order More &#9749;</a>
</div>
</div>
</div>
</body>
</html>
