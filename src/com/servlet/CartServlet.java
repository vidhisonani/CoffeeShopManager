package com.servlet;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartItem;

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        @SuppressWarnings("unchecked")
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if ("remove".equals(action)) {
            if (cart != null) {
                int itemId = Integer.parseInt(request.getParameter("itemId"));
                cart.remove(itemId);
                session.setAttribute("cart", cart);
            }
            response.sendRedirect(request.getContextPath() + "/cart.jsp");

        } else if ("clear".equals(action)) {
            session.removeAttribute("cart");
            response.sendRedirect(request.getContextPath() + "/cart.jsp");

        } else {
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        @SuppressWarnings("unchecked")
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new LinkedHashMap<>();
        }

        String action = request.getParameter("action");
        int itemId = Integer.parseInt(request.getParameter("itemId"));

        if ("add".equals(action)) {
            String name = request.getParameter("itemName");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            if (cart.containsKey(itemId)) {
                CartItem existing = cart.get(itemId);
                existing.setQuantity(existing.getQuantity() + quantity);
            } else {
                cart.put(itemId, new CartItem(itemId, name, price, quantity));
            }

        } else if ("remove".equals(action)) {
            cart.remove(itemId);
        }

        // Calculate total and store in session
        double total = 0;
        for (CartItem item : cart.values()) {
            total += item.getSubtotal();
        }
        session.setAttribute("cart", cart);
        session.setAttribute("cartTotal", total);

        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}