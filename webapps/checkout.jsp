<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Checkout | Coffee Shop</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav class="navbar">
<div class="navbar-brand">
<span class="logo-icon">&#9749;</span>
<h1>Coffee Shop</h1>
</div>
<div class="navbar-links">
<a href="cart.jsp">&#8592; Back to Cart</a>
</div>
</nav>
<div class="container">
<h2 class="section-title">Checkout</h2>
<p class="section-sub">Fill your details and confirm your order</p>
<c:if test="${not empty errorMsg}">
<div class="alert alert-error">&#9888; ${errorMsg}</div>
</c:if>
<div class="checkout-grid">
<!-- LEFT: Customer Form -->
<div class="form-card">
<h3>Your Details</h3>
<form action="checkout" method="post">
<div class="form-group">
<label>Full Name</label>
<input type="text" name="customerName" placeholder="e.g. Rahul Shah" required>
</div>
<div class="form-group">
<label>Table Number</label>
<input type="number" name="tableNumber" placeholder="e.g. 5" min="1" max="30" required>
</div>
<button type="submit" class="btn-gold" style="width:100%;padding:13px;font-size:15px;margin-top:8px;">
Place Order &#8594;
</button>
</form>
</div>
<!-- RIGHT: Order Summary -->
<div class="form-card">
<h3>Order Summary</h3>
<div class="cart-wrapper" style="margin-bottom:0;">
<table class="cart-table">
<tr><th>Item</th><th>Qty</th><th>Subtotal</th></tr>
<c:forEach var="item" items="${sessionScope.cart}">
<tr>
<td>${item.itemName}</td>
<td>${item.quantity}</td>
<td style="color:#C8922A;font-weight:600;">Rs. ${item.subtotal}</td>
</tr>
</c:forEach>
<tr class="total-row">
<td colspan="2"><b>Total</b></td>
<td><b>Rs. ${sessionScope.cartTotal}</b></td>
</tr>
</table>
</div>
</div>
</div>
</div>
<div class="footer"><p>Coffee Shop Manager &mdash;</p></div>
</body>
</html>
