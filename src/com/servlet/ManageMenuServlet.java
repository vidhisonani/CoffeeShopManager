package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MenuDAO;
import model.MenuItem;

@WebServlet("/manageMenu")
public class ManageMenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
            return;
        }

        // Create the DAO object to call non-static methods
        MenuDAO menuDAO = new MenuDAO();
        
        // Note: Check if DAO uses getallItems() [lowercase a] or getAllItems()
        List<MenuItem> items = menuDAO.getAllItems(); 
        request.setAttribute("menuItems", items);

        /*String editId = request.getParameter("edit");
        if (editId != null) {
            try {
                // Assuming your DAO has this method
                MenuItem toEdit = menuDAO.getItemById(Integer.parseInt(editId));
                request.setAttribute("editItem", toEdit);
            } catch (NumberFormatException ignored) { }
        }*/

        request.getRequestDispatcher("/manageMenu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
            return;
        }

        MenuDAO menuDAO = new MenuDAO();
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                double price = Double.parseDouble(request.getParameter("price"));
                String category = request.getParameter("category");

                // Your model has 6 parameters: (id, name, desc, price, cat, availability)
                MenuItem item = new MenuItem(0, name, description, price, category, true);
                menuDAO.addItem(item);

            } /*else if ("update".equals(action)) {
                int itemId = Integer.parseInt(request.getParameter("itemId"));
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                double price = Double.parseDouble(request.getParameter("price"));
                String category = request.getParameter("category");

                MenuItem item = new MenuItem(itemId, name, description, price, category, true);
                menuDAO.updateItem(item);

            }*/ else if ("delete".equals(action)) {
                int itemId = Integer.parseInt(request.getParameter("itemId"));
                menuDAO.deleteItem(itemId);
            }
        } catch (Exception e) {
            e.printStackTrace(); // This helps you see errors in the Console
        }

        response.sendRedirect(request.getContextPath() + "/manageMenu");
    }

    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute("adminUser") != null;
    }
}