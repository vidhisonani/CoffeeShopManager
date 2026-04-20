<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Coffee Shop Manager</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav class="navbar">
<div class="navbar-brand">
<span class="logo-icon">&#9749;</span>
<h1>Coffee Shop</h1>
</div>
<div class="navbar-links">
<%-- cart.jsp is a direct file link, no servlet needed for viewing --%>
<a href="cart.jsp" class="cart-link">&#128722; Cart</a>
<a href="adminLogin.jsp">&#128272; Admin</a>
</div>
</nav>
<div class="hero">
<div class="hero-tag">&#10024; Fresh Every Day</div>
<h2>Freshly Brewed,<br>Just for You</h2>
<p>Order your favourite coffee, snacks and meals<br>delivered straight to your table.</p>
<a href="#menu-section" class="hero-btn">Browse Menu &#8595;</a>
</div>

<div class="container" id="menu-section">
<div class="section-header">
<div>
<h2 class="section-title">Our Menu</h2>
<p class="section-sub">Freshly prepared every day — tap any item to add to cart</p>
</div>
</div>
<c:if test="${empty menuItems}">
<div class="empty-state">
<span class="empty-icon">&#9749;</span>
<h3>Loading menu...</h3>
<p>Please access the menu via <a href="menu" style="color:#C8922A;">the menu page</a>.</p>
</div>
</c:if>
<c:forEach var="category" items="${categories}">
<div class="category-label">
<c:choose>
<c:when test="${category == 'Coffee'}">&#9749;</c:when>
<c:when test="${category == 'Snacks'}">&#127850;</c:when>
<c:when test="${category == 'Cold Drinks'}">&#129380;</c:when>
<c:otherwise>&#127859;</c:otherwise>
</c:choose>
${category}
</div>
<div class="menu-grid">
<c:forEach var="item" items="${menuItems}">
<c:if test="${item.category == category and item.available}">
<div class="menu-card">
<span class="item-emoji">
<c:choose>
<c:when test="${item.category == 'Coffee'}">&#9749;</c:when>
<c:when test="${item.category == 'Snacks'}">&#127850;</c:when>
<c:when test="${item.category == 'Cold Drinks'}">&#129380;</c:when>
<c:otherwise>&#127859;</c:otherwise>
</c:choose>
</span>
<h4>${item.itemName}</h4>
<p class="desc">${item.description}</p>
<p class="price">Rs.&nbsp;${item.price}</p>
<form action="cart" method="post">
<input type="hidden" name="action" value="add">
<input type="hidden" name="itemId" value="${item.itemId}">
<input type="hidden" name="itemName" value="${item.itemName}">
<input type="hidden" name="price" value="${item.price}">
<div class="qty-row">
<label for="qty_${item.itemId}">Qty</label>
<input type="number" id="qty_${item.itemId}"
name="quantity" value="1" min="1" max="10"
class="qty-input">
</div>
<button type="submit" class="btn-primary">Add to Cart</button>
</form>
</div>
</c:if>
</c:forEach>
</div>
</c:forEach>
</div>
<div class="footer">
<p>Made with <span>&#9829;</span> by Team CoffeeShopManager &mdash;</p>
</div>
</body>
</html>