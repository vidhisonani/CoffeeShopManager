<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Your Cart | Coffee Shop</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav class="navbar">
<div class="navbar-brand">
<span class="logo-icon">&#9749;</span>
<h1>Coffee Shop</h1>
</div>
<div class="navbar-links">
<a href="menu.jsp">&#8592; Back to Menu</a><!-- change -->
</div>
</nav>
<div class="container">
<h2 class="section-title">Your Cart</h2>
<c:choose>
<c:when test="${empty sessionScope.cart}">
<div class="empty-state">
<div class="empty-icon">&#128722;</div>
<h3>Your cart is empty</h3>
<p>Looks like you haven't added anything yet.</p>
<a href="menu.jsp" class="btn-gold">Browse Menu</a><!-- change menu-->
</div>
</c:when>
<c:otherwise>
<div class="cart-wrapper">
<table class="cart-table">
<tr><th>Item</th><th>Unit Price</th><th>Qty</th><th>Subtotal</th><th>Remove</th></tr>
<c:forEach var="item" items="${sessionScope.cart}">
<tr>
<td><b>${item.itemName}</b></td>
<td>Rs. ${item.price}</td>
<td>${item.quantity}</td>
<td style="color:#C8922A;font-weight:600;">Rs. ${item.subtotal}</td>
<td>
<a href="cart?action=remove&itemId=${item.itemId}" class="btn-danger">Remove</a>
</td>
</tr>
</c:forEach>
<tr class="total-row">
<td colspan="3" style="text-align:right;"><b>Total Amount</b></td>
<td colspan="2" style="font-size:17px;color:#C8922A;"><b>Rs. ${sessionScope.cartTotal}</b></td>
</tr>
</table>
</div>
<div class="cart-actions">
<a href="cart?action=clear" class="btn-secondary">&#128465; Clear Cart</a>
<a href="checkout.jsp" class="btn-gold">Proceed to Checkout &#8594;</a>
</div>
</c:otherwise>
</c:choose>
</div>
<div class="footer"><p>Coffee Shop Manager &mdash;</p></div>
</body>
</html>