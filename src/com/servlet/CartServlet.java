package com.servlet;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartItem;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Cart stored as Map<itemId, CartItem> for easy lookup
        @SuppressWarnings("unchecked")
        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new LinkedHashMap<>();
        }

        String action = request.getParameter("action");   // "add" or "remove"
        int itemId    = Integer.parseInt(request.getParameter("itemId"));

        if ("add".equals(action)) {
            String name   = request.getParameter("name");
            double price  = Double.parseDouble(request.getParameter("price"));

            if (cart.containsKey(itemId)) {
                // Item already in cart — increase quantity
                CartItem existing = cart.get(itemId);
                existing.setQuantity(existing.getQuantity() + 1);
            } else {
                cart.put(itemId, new CartItem(itemId, name, price, 1));
            }

        } else if ("remove".equals(action)) {
            cart.remove(itemId);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}