<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<a href="menu">&#8592; Back to Menu</a>
</div>
</nav>
<div class="container">
<h2 class="section-title">Your Cart</h2>
<p class="section-sub">Review your order before checkout</p>
<c:choose>
<%-- EMPTY CART STATE --%>
<c:when test="${empty sessionScope.cart}">
<div class="empty-state">
<span class="empty-icon">&#128722;</span>
<h3>Your cart is empty</h3>
<p>Looks like you haven't added anything yet.<br>Go browse our menu!</p>
<a href="menu" class="btn-gold">Browse Menu &#9749;</a>
</div>
</c:when>
<%-- CART HAS ITEMS --%>
<c:otherwise>
<div class="cart-wrapper">
<table class="cart-table">
<thead>
<tr>
<th>Item</th>
<th>Unit Price</th>
<th>Qty</th>
<th>Subtotal</th>
<th>Remove</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${sessionScope.cart}
<tr>
<td><b>${item.itemName}</b></td>
<td>Rs. ${item.price}</td>
<td>${item.quantity}</td>
<td style="color:#C8922A; font-weight:700;">Rs. ${item.subtotal}</td>
<td>
<%-- This calls CartServlet GET with action=remove --%>
<a href="cart?action=remove&itemId=${item.itemId}"
class="btn-danger">&#128465; Remove</a>
</td>
</tr>
</c:forEach>
</tbody>
<tfoot>
<tr class="total-row">
<td colspan="3" style="text-align:right; padding-right:28px;">
<b>Total Amount</b>
</td>
<td colspan="2" style="color:#C8922A; font-size:18px;">
<b>Rs. ${sessionScope.cartTotal}</b>
</td>
</tr>
</tfoot>
</table>
</div>
<div class="cart-actions">
<%-- Calls CartServlet GET with action=clear --%>
<a href="cart?action=clear" class="btn-secondary">&#128465;&nbsp; Clear Cart</a>
<%-- Goes to checkout.jsp directly — no servlet needed to show the form --%>
<a href="checkout.jsp" class="btn-gold">Proceed to Checkout &nbsp;&#8594;</a>
</div>
</c:otherwise>
</c:choose>
</div>
<div class="footer">
<p>Made with <span>&#9829;</span> by Team CoffeeShopManager &mdash;</p>
</div>
</body>
</html>