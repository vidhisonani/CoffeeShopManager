<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Manage Menu | Admin</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body style="background:#F5EFE6;">
<nav class="admin-navbar">
<span class="brand">&#9749; Admin Panel</span>
<div class="nav-links">
<a href="adminDashboard">Dashboard</a>
<a href="manageMenu" class="active">Manage Menu</a>
<a href="report">Reports</a>
<a href="adminLogout" style="color:#F09595;">Logout</a>
</div>
</nav>
<div class="container">
<h2 class="section-title">Manage Menu</h2>
<c:if test="${not empty msg}">
<div class="alert alert-success">&#10003; ${msg}</div>
</c:if>
<div class="manage-grid">
<!-- ADD FORM -->
<div class="form-card">
<h3>Add New Item</h3>
<form action="manageMenu" method="post">
<input type="hidden" name="action" value="add">
<div class="form-group">
<label>Item Name</label>
<input type="text" name="itemName" placeholder="e.g. Cappuccino" required>
</div>
<div class="form-group">
<label>Category</label>
<select name="category">
<option value="Coffee">Coffee</option>
<option value="Snacks">Snacks</option>
<option value="Cold Drinks">Cold Drinks</option>
<option value="Meals">Meals</option>
</select>
</div>
<div class="form-group">
<label>Price (Rs.)</label>
<input type="number" name="price" placeholder="e.g. 120" step="0.01" min="1" required>
</div>
<div class="form-group">
<label>Description</label>
<input type="text" name="description" placeholder="Short description">
</div>
<button type="submit" class="btn-gold" style="width:100%;padding:12px;">Add Item</button>
</form>
</div>
<!-- ITEMS TABLE -->
<div>
<div class="form-card" style="padding:0;overflow:hidden;">
<table class="data-table">
<tr><th>Name</th><th>Category</th><th>Price</th><th>Del</th></tr>
<c:forEach var="item" items="${menuItems}">
<tr>
<td><b>${item.itemName}</b></td>
<td style="font-size:12px;color:#8B7355;">${item.category}</td>
<td style="color:#C8922A;font-weight:600;">Rs.${item.price}</td>
<td>
<a href="manageMenu?action=delete&itemId=${item.itemId}"
class="btn-danger"
onclick="return confirm('Delete ${item.itemName}?')">Del</a>
</td>
</tr>
</c:forEach>
</table>
</div>
</div>
</div>
</div>
</body>
</html>
