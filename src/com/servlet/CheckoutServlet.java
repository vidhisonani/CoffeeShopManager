package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        java.util.Map<Integer, model.CartItem> cart = (java.util.Map<Integer, model.CartItem>) session.getAttribute("cart");
     // 1. Get data from the request
        String customerName = request.getParameter("customerName");

        // 2. Create the Order object (The first thing your DAO wants)
        model.Order order = new model.Order();
        order.setCustomerName(customerName);
        order.setTableNumber(1); // Set a default or get from a form parameter

        // 3. Convert Map<Integer, CartItem> to List<OrderItem> (The second thing it wants)
        List<model.OrderItem> orderItems = new java.util.ArrayList<>();
        double totalAmount = 0;

        for (model.CartItem cartItem : cart.values()) {
            model.OrderItem item = new model.OrderItem();
            item.setItemId(cartItem.getItemId());
            item.setQuantity(cartItem.getQuantity());
            item.setSubtotal(cartItem.getPrice() * cartItem.getQuantity());
            
            totalAmount += item.getSubtotal();
            orderItems.add(item);
        }
        order.setTotalAmount(totalAmount); // Update total in the order object

        // 4. Call the DAO using the correct objects and instance
        dao.OrderDAO orderDao = new dao.OrderDAO();
        int orderId = orderDao.placeOrder(order, orderItems);      

        // Clear the cart from session after successful order
        session.removeAttribute("cart");

        // Pass order ID to confirmation page
        request.setAttribute("orderId", orderId);
        request.setAttribute("customerName", customerName);
        request.getRequestDispatcher("/orderConfirm.jsp").forward(request, response);
    }
}
