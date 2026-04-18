<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Menu | Admin</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body style="background:#F5EFE6;">
<nav class="admin-navbar">
<span class="brand">&#9749;&nbsp; Coffee Shop Admin</span>
<div class="nav-links">
<a href="adminDashboard">Dashboard</a>
<a href="manageMenu" class="active">Menu</a>
<a href="report">Reports</a>
<a href="adminLogout" style="color:#F87171;">Logout</a>
</div>
</nav>
<div class="container">
<h2 class="section-title">Manage Menu</h2>
<p class="section-sub">Add new items or remove existing ones</p>
<c:if test="${not empty msg}">
<div class="alert alert-success">&#10003;&nbsp; ${msg}</div>
</c:if>
<c:if test="${not empty errMsg}">
<div class="alert alert-error">&#9888;&nbsp; ${errMsg}</div>
</c:if>
<div class="manage-grid">
<div class="form-card">
<h3>Add New Item</h3>
<form action="manageMenu" method="post">
<input type="hidden" name="action" value="add">
<div class="form-group">
<label>Item Name</label>
<input type="text" name="itemName"
placeholder="e.g. Cappuccino" required>
</div>
<div class="form-group">
<label>Category</label>
<select name="category">
<option value="Coffee">&#9749; Coffee</option>
<option value="Snacks">&#127850; Snacks</option>
<option value="Cold Drinks">&#129380; Cold Drinks</option>
<option value="Meals">&#127859; Meals</option>
</select>
</div>
<div class="form-group">
<label>Price (Rs.)</label>
<input type="number" name="price"
placeholder="e.g. 120" step="0.01" min="1" required>
</div>
<div class="form-group">
<label>Description</label>
<input type="text" name="description"
placeholder="Short description (optional)">
</div>
<button type="submit" class="btn-gold"
style="width:100%; padding:13px; margin-top:4px;">
Add Item &nbsp;+
</button>
</form>
</div>
<div class="form-card" style="padding:0; overflow:hidden;">
<div style="padding:22px 22px 14px; background:white;">
<h3 style="font-family:'Playfair Display',serif; font-size:19px;
color:#4A2C2A; border-bottom:2px solid #F5EFE6; padding-bottom:12px;">
Current Items
</h3>
</div>
<table class="data-table">
<thead>
<tr>
<th>Name</th>
<th>Category</th>
<th>Price</th>
<th>Status</th>
<th>Del</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${menuItems}">
<tr>
<td><b>${item.itemName}</b></td>
<td style="color:#8B7355; font-size:12px;">${item.category}</td>
<td style="color:#C8922A; font-weight:600;">Rs.${item.price}</td>
<td>
<c:choose>
<c:when test="${item.available}">
<span class="status-pill status-done">Active</span>
</c:when>
<c:otherwise>
<span class="status-pill status-pending">Off</span>
</c:otherwise>
</c:choose>
</td>
<td>
<a href="manageMenu?action=delete&itemId=${item.itemId}"
class="btn-danger"
onclick="return confirm('Delete ${item.itemName}?')">
Del
</a>
</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</div>
</body>
</html>