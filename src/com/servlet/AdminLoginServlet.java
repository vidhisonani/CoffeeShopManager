package com.servlet;

import dao.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// @WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/adminLogin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (isValidAdmin(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("adminUser", username);
            response.sendRedirect(request.getContextPath() + "/adminDashboard");
        } else {
            // Invalid credentials — go back with error message
            request.setAttribute("errorMsg", "Invalid username or password.");
            request.getRequestDispatcher("/adminLogin.jsp").forward(request, response);
        }
    }

    private boolean isValidAdmin(String username, String password) {
        String sql = "SELECT admin_id FROM admin WHERE username = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password); // Member C hashes passwords in SQL setup
            ResultSet rs = ps.executeQuery();
            return rs.next(); // true if a matching row exists

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
