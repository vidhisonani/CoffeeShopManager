<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sales Report | Admin</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body style="background:#F5EFE6;">
<nav class="admin-navbar">
<span class="brand">&#9749; Admin Panel</span>
<div class="nav-links">
<a href="adminDashboard">Dashboard</a>
<a href="manageMenu">Manage Menu</a>
<a href="report" class="active">Reports</a>
<a href="adminLogout" style="color:#F09595;">Logout</a>
</div>
</nav>
<div class="container">
<div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:6px;">
<h2 class="section-title" style="margin:0;">Sales Reports</h2>
<a href="reportPdf" class="btn-gold">&#11015; Download PDF</a>
</div>
<p class="section-sub">Business analytics for your coffee shop</p>
<div class="report-grid">
<!-- Best Sellers -->
<div class="report-card">
<h3>&#127942; Best-Selling Items</h3>
<table class="data-table">
<tr><th>#</th><th>Item</th><th>Sold</th><th>Revenue</th></tr>
<c:forEach var="row" items="${bestSellers}" varStatus="s">
<tr>
<td style="color:#C8922A;font-weight:700;">${s.index + 1}</td>
<td><b>${row.itemName}</b></td>
<td>${row.totalSold}</td>
<td style="color:#3B6D11;font-weight:600;">Rs.${row.revenue}</td>
</tr>
</c:forEach>
</table>
</div>
<!-- Daily Revenue -->
<div class="report-card">
<h3>&#128200; Daily Revenue</h3>
<table class="data-table">
<tr><th>Date</th><th>Orders</th><th>Revenue</th></tr>
<c:forEach var="day" items="${dailyRevenue}">
<tr>
<td>${day.day}</td>
<td>${day.orderCount}</td>
<td style="color:#C8922A;font-weight:600;">Rs.${day.dailyTotal}</td>
</tr>
</c:forEach>
</table>
</div>
</div>
</div>
</body>
</html>