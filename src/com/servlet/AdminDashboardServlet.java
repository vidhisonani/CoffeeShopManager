package com.servlet;

import dao.OrderDAO;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check admin session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/adminLogin");
            return;
        }

        // Handle status update action
        String action = request.getParameter("action");
        if ("updateStatus".equals(action)) {
            String orderIdStr = request.getParameter("orderId");
            String newStatus = request.getParameter("status");
            if (orderIdStr != null && newStatus != null) {
                int orderId = Integer.parseInt(orderIdStr);
                OrderDAO orderDAO = new OrderDAO();
                orderDAO.updateStatus(orderId, newStatus);
            }
            response.sendRedirect(request.getContextPath() + "/adminDashboard");
            return;
        }

        // Load all orders
        OrderDAO orderDAO = new OrderDAO();
        List<Order> orders = orderDAO.getAllOrders();

        // Calculate counts and today's revenue
        int pendingCount = 0;
        int preparingCount = 0;
        double todayRevenue = 0.0;
        String today = LocalDate.now().toString(); // "yyyy-MM-dd"

        for (Order order : orders) {
            String status = order.getStatus();
            if ("pending".equalsIgnoreCase(status)) {
                pendingCount++;
            } else if ("preparing".equalsIgnoreCase(status)) {
                preparingCount++;
            }

            // Check if order was placed today
            if (order.getOrderedAt() != null) {
                String orderedDate = order.getOrderedAt().toString().substring(0, 10);
                if (today.equals(orderedDate)) {
                    todayRevenue += order.getTotalAmount();
                }
            }
        }

        // Set attributes for JSP
        request.setAttribute("orders", orders);
        request.setAttribute("totalOrders", orders.size());
        request.setAttribute("pendingCount", pendingCount);
        request.setAttribute("preparingCount", preparingCount);
        request.setAttribute("todayRevenue", todayRevenue);

        request.getRequestDispatcher("/WEB-INF/views/adminDashboard.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}