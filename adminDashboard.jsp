<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard | Coffee Shop Admin</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body style="background:#F5EFE6;">
<%--
AdminDashboardServlet must set:
- request.setAttribute("orders", List<Order>)
- request.setAttribute("totalOrders", int)
- request.setAttribute("pendingCount", int)
- request.setAttribute("preparingCount", int)
- request.setAttribute("todayRevenue", double)
Order must have: getOrderId(), getCustomerName(), getTableNumber(),
getTotalAmount(), getStatus(), getOrderedAt()
--%>
<nav class="admin-navbar">
<span class="brand">&#9749;&nbsp; Coffee Shop Admin</span>
<div class="nav-links">
<a href="adminDashboard" class="active">Dashboard</a>
<a href="manageMenu">Menu</a>
<a href="report">Reports</a>
<a href="adminLogout" style="color:#F87171;">Logout</a>
</div>
</nav>
<div class="container">
<h2 class="section-title">Live Order Queue</h2>
<p class="section-sub">Refresh the page to see new orders</p>
<!-- ■■ Stat Cards ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<div class="stats-grid">
<div class="stat-card">
<div class="stat-label">Total Orders</div>
<div class="stat-value">${totalOrders}</div>
<div class="stat-sub">All time</div>
</div>
<div class="stat-card">
<div class="stat-label">Pending</div>
<div class="stat-value" style="color:#854F0B;">${pendingCount}</div>
<div class="stat-sub">Waiting</div>
</div>
<div class="stat-card">
<div class="stat-label">Preparing</div>
<div class="stat-value" style="color:#1E40AF;">${preparingCount}</div>
<div class="stat-sub">In kitchen</div>
</div>
<div class="stat-card">
<div class="stat-label">Today Revenue</div>
<div class="stat-value" style="color:#C8922A;">Rs.${todayRevenue}</div>
<div class="stat-sub">Today</div>
</div>
</div>
<!-- ■■ Order Cards ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<c:if test="${empty orders}">
<div class="empty-state">
<span class="empty-icon">&#128203;</span>
<h3>No orders yet</h3>
<p>New orders will appear here as customers place them.</p>
</div>
</c:if>
<c:forEach var="order" items="${orders}">
<div class="order-card">
<div class="order-top">
<div>
<span class="order-id">Order #${order.orderId}</span>
&nbsp;&mdash;&nbsp;
<b>${order.customerName}</b>
&nbsp;&mdash;&nbsp; Table <b>${order.tableNumber}</b>
</div>
<span class="status-pill status-${order.status}">${order.status}</span>
</div>
<div class="order-meta">
Amount: <b style="color:#C8922A;">Rs. ${order.totalAmount}</b>
&nbsp;&nbsp;|&nbsp;&nbsp;
Ordered at: ${order.orderedAt}
</div>
<div class="order-actions">
<a href="adminDashboard?action=updateStatus&orderId=${order.orderId}&status=preparing"
class="btn-status btn-preparing">Mark Preparing</a>
<a href="adminDashboard?action=updateStatus&orderId=${order.orderId}&status=done"
class="btn-status btn-done">Mark Done &#10003;</a>
</div>
</div>
</c:forEach>
</div>
</body>
</html>