<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<p class="section-sub">Almost there! Fill in your details and place your order.</p>
<c:if test="${not empty errorMsg}">
<div class="alert alert-error">&#9888;&nbsp; ${errorMsg}</div>
</c:if>
<%-- If cart is empty, redirect them back --%>
<c:if test="${empty sessionScope.cart}">
<div class="alert alert-info">
&#8505;&nbsp; Your cart is empty.
<a href="menu" style="color:#185FA5; font-weight:600;">Go back to menu</a>
</div>
</c:if>
<c:if test="${not empty sessionScope.cart}">
<div class="checkout-grid">
<div class="form-card">
<h3>Your Details</h3>
<form action="checkout" method="post">
<div class="form-group">
<label>Full Name</label>
<input type="text" name="customerName"
placeholder="e.g. Rahul Shah" required
autocomplete="name">
</div>
<div class="form-group">
<label>Table Number</label>
<input type="number" name="tableNumber"
placeholder="e.g. 5" min="1" max="50" required>
</div>
<button type="submit" class="btn-gold"
style="width:100%; padding:14px; font-size:15px; margin-top:10px;">
Place Order &nbsp;&#8594;
</button>
</form>
</div>
<div class="form-card">
<h3>Order Summary</h3>
<div class="cart-wrapper" style="margin-bottom:0; box-shadow:none;">
<table class="cart-table">
<thead>
<tr>
<th>Item</th>
<th>Qty</th>
<th>Subtotal</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${sessionScope.cart}">
<tr>
<td>${item.itemName}</td>
<td>${item.quantity}</td>
<td style="color:#C8922A; font-weight:600;">
Rs. ${item.subtotal}
</td>
</tr>
</c:forEach>
</tbody>
<tfoot>
<tr class="total-row">
<td colspan="2"><b>Total</b></td>
<td><b>Rs. ${sessionScope.cartTotal}</b></td>
</tr>
</tfoot>
</table>
</div>
</div>
</div>
</c:if>
</div>
<div class="footer">
<p>Made with <span>&#9829;</span> by Team CoffeeShopManager &mdash;</p>
</div>
</body>
</html>