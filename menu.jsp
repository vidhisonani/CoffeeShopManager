<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Menu | Coffee Shop</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav class="navbar">
<div class="navbar-brand">
<span class="logo-icon">&#9749;</span>
<h1>Coffee Shop</h1>
</div>
<div class="navbar-links">
<a href="menu">Menu</a>
<a href="cart.jsp" class="cart-link">&#128722; Cart</a>
</div>
</nav>
<div class="container">
<h2 class="section-title">Full Menu</h2>
<p class="section-sub">Add items to your cart</p>
<div class="cart-wrapper">
<table class="cart-table">
<tr><th>Item</th><th>Category</th><th>Description</th><th>Price</th><th>Order</th></tr>
<c:forEach var="item" items="${menuItems}">
<c:if test="${item.available}">
<tr>
<td><b>${item.itemName}</b></td>
<td>${item.category}</td>
<td style="color:#8B7355;font-size:13px;">${item.description}</td>
<td style="color:#C8922A;font-weight:600;">Rs. ${item.price}</td>
<td>
<form action="cart" method="post" style="display:flex;gap:6px;align-items:center;">
<input type="hidden" name="action" value="add">
<input type="hidden" name="itemId" value="${item.itemId}">
<input type="hidden" name="itemName" value="${item.itemName}">
<input type="hidden" name="price" value="${item.price}">
<input type="number" name="quantity" value="1" min="1" max="10" class="qty-input">
<button type="submit" class="btn-gold" style="padding:8px 18px;font-size:12px;">Add</button>
</form>
</td>
</tr>
</c:if>
</c:forEach>
</table>
</div>
</div>
<div class="footer"><p>Coffee Shop Manager &mdash;</p></div>
</body>
</html>
