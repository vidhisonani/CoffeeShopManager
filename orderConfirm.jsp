<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Confirmed! | Coffee Shop</title>
<link rel="stylesheet" href="css/style.css">
<style>
@keyframes fadeInUp {
from { opacity: 0; transform: translateY(30px); }
to { opacity: 1; transform: translateY(0); }
}
.confirm-card { animation: fadeInUp 0.5s ease; }
</style>
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
<%-- Green check circle --%>
<div class="check-circle">&#10003;</div>
<h2>Order Confirmed!</h2>
<p style="color:#8B7355; font-size:14px; margin-bottom:20px; line-height:1.7;">
Thank you, <b style="color:#4A2C2A;">${customerName}</b>!<br>
Your order is being prepared.
</p>
<div class="order-id-box">
<div style="font-size:11px; color:#8B7355; margin-bottom:6px;
text-transform:uppercase; letter-spacing:1px;">Order ID</div>
<div class="order-num">#${orderId}</div>
</div>
<%-- Details rows --%>
<div class="info-row">
<span class="info-label">Table Number</span>
<span class="info-val">Table ${tableNumber}</span>
</div>
<div class="info-row">
<span class="info-label">Amount</span>
<span class="info-val" style="color:#C8922A;">Rs. ${totalAmount}</span>
</div>
<div class="info-row">
<span class="info-label">Status</span>
<span class="status-pill status-pending">Pending</span>
</div>
<div class="wait-badge">&#8987;&nbsp; Estimated wait: 10–15 minutes</div>
<br>
<a href="menu" class="btn-gold">Order More &nbsp;&#9749;</a>
</div>
</div>
</div>
</body>
</html>