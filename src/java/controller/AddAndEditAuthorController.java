/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddAndEditAuthorController extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if(action.equals("edit")){
        int authorId = Integer.parseInt(request.getParameter("authorId"));
        String authorName = request.getParameter("authorName");
        String authorImage = request.getParameter("authorImage");
        String authorDescription = request.getParameter("authorDescription");

        UserDAO authorDAO = new UserDAO();

        // Call DAO method to update author information
        authorDAO.updateAuthor(authorId, authorName, authorImage, authorDescription);
        response.sendRedirect("manager-author"); 
        }
        if(action.equals("add")){
                    // Get parameters from the request
        String authorName = request.getParameter("authorName");
        String authorImage = request.getParameter("authorImage");
        String authorDescription = request.getParameter("authorDescription");

        UserDAO authorDAO = new UserDAO();

        authorDAO.addAuthor(authorName, authorImage, authorDescription);
        response.sendRedirect("manager-author");

        }
}
