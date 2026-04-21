package com.servlet;

import dao.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/adminLogin");
            return;
        }

        // 1. Daily revenue
        Map<String, Double> dailyRevenue = new LinkedHashMap<>();
        String revenueSQL =
            "SELECT DATE(ordered_at) AS day, " +
            "COUNT(*) AS order_count, " +
            "SUM(total_amount) AS revenue " +
            "FROM customer_order " +
            "WHERE ordered_at >= DATE_SUB(CURDATE(), INTERVAL 6 DAY) " +
            "GROUP BY day ORDER BY day ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(revenueSQL);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                dailyRevenue.put(rs.getString("day"), rs.getDouble("revenue"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 2. Best sellers
        List<String[]> bestSellers = new ArrayList<>();
        String bestSQL =
            "SELECT m.item_name, " +
            "SUM(oi.quantity) AS total_qty, " +
            "SUM(oi.subtotal) AS total_revenue " +
            "FROM order_item oi " +
            "JOIN menu_item m ON oi.item_id = m.item_id " +
            "GROUP BY oi.item_id, m.item_name " +
            "ORDER BY total_qty DESC LIMIT 5";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(bestSQL);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                bestSellers.add(new String[]{
                    rs.getString("item_name"),
                    String.valueOf(rs.getInt("total_qty")),
                    String.format("%.2f", rs.getDouble("total_revenue"))
                });
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 3. Overall totals
        double totalRevenue = 0;
        int totalOrders = 0;
        String totalsSQL =
            "SELECT COUNT(*) AS order_count, " +
            "COALESCE(SUM(total_amount), 0) AS grand_total " +
            "FROM customer_order";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(totalsSQL);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                totalOrders  = rs.getInt("order_count");
                totalRevenue = rs.getDouble("grand_total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("dailyRevenue", dailyRevenue);
        request.setAttribute("bestSellers",  bestSellers);
        request.setAttribute("totalRevenue", String.format("%.2f", totalRevenue));
        request.setAttribute("totalOrders",  totalOrders);

        request.getRequestDispatcher("/report.jsp").forward(request, response);
    }

    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute("adminUser") != null;
    }
}