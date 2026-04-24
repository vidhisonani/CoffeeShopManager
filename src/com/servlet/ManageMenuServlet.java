package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MenuDAO;
import model.MenuItem;

public class ManageMenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/adminLogin");
            return;
        }

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            try {
                int itemId = Integer.parseInt(request.getParameter("itemId"));
                MenuDAO menuDAO = new MenuDAO();
                menuDAO.deleteItem(itemId);
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect(request.getContextPath() + "/manageMenu");
            return;
        }

        MenuDAO menuDAO = new MenuDAO();
        List<MenuItem> items = menuDAO.getAllItemsForAdmin();
        request.setAttribute("menuItems", items);
        request.getRequestDispatcher("/manageMenu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/adminLogin");
            return;
        }

        MenuDAO menuDAO = new MenuDAO();
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                String name = request.getParameter("itemName");
                String description = request.getParameter("description");
                double price = Double.parseDouble(request.getParameter("price"));
                String category = request.getParameter("category");

                MenuItem item = new MenuItem(0, name, category, price, description, true);
                menuDAO.addItem(item);
            } else if ("delete".equals(action)) {
                int itemId = Integer.parseInt(request.getParameter("itemId"));
                menuDAO.deleteItem(itemId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/manageMenu");
    }

    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute("adminUser") != null;
    }
}