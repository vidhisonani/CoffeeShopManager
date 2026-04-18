<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sales Report | Admin</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body style="background:#F5EFE6;">
<nav class="admin-navbar">
<span class="brand">&#9749;&nbsp; Coffee Shop Admin</span>
<div class="nav-links">
<a href="adminDashboard">Dashboard</a>
<a href="manageMenu">Menu</a>
<a href="report" class="active">Reports</a>
<a href="adminLogout" style="color:#F87171;">Logout</a>
</div>
</nav>
<div class="container">
<div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:6px;">
<div>
<h2 class="section-title">Sales Reports</h2>
<p class="section-sub">Business analytics for your coffee shop</p>
</div>
<a href="reportPdf" class="btn-gold">&#11015;&nbsp; Download PDF</a>
</div>
<div class="report-grid">
<div class="report-card">
<h3>&#127942; Best-Selling Items</h3>
<table class="data-table">
<thead>
<tr>
<th>#</th>
<th>Item</th>
<th>Qty Sold</th>
<th>Revenue</th>
</tr>
</thead>
<tbody>
<c:forEach var="row" items="${bestSellers}" varStatus="s">
<tr>
<td style="color:#C8922A; font-weight:700; font-size:15px;">
${s.index + 1}
</td>
<td><b>${row.itemName}</b></td>
<td>${row.totalSold}</td>
<td style="color:#0F6E56; font-weight:600;">
Rs.${row.revenue}
</td>
</tr>
</c:forEach>
<c:if test="${empty bestSellers}">
<tr>
<td colspan="4" style="text-align:center; color:#8B7355; padding:24px;">
No sales data yet
</td>
</tr>
</c:if>
</tbody>
</table>
</div>
<div class="report-card">
<h3>&#128200; Daily Revenue</h3>
<table class="data-table">
<thead>
<tr>
<th>Date</th>
<th>Orders</th>
<th>Revenue</th>
</tr>
</thead>
<tbody>
<c:forEach var="day" items="${dailyRevenue}">
<tr>
<td>${day.day}</td>
<td>${day.orderCount}</td>
<td style="color:#C8922A; font-weight:600;">
Rs.${day.dailyTotal}
</td>
</tr>
</c:forEach>
<c:if test="${empty dailyRevenue}">
<tr>
<td colspan="3" style="text-align:center; color:#8B7355; padding:24px;">
No revenue data yet
</td>
</tr>
</c:if>
</tbody>
</table>
</div>
</div>
</div>
</body>
</html>