package com.servlet;

import dao.MenuDAO;
import model.MenuItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

// @WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	// 1. Create the object first
    	dao.MenuDAO menuDao = new dao.MenuDAO(); 

    	// 2. Call the method using that object
    	List<model.MenuItem> menuItems = menuDao.getAllItems();
        //List<MenuItem> menuItems = MenuDAO.getAllItems();
        request.setAttribute("menuItems", menuItems);
        request.getRequestDispatcher("/menu.jsp").forward(request, response);
    }
}