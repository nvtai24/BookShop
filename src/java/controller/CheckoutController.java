/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import model.Order;
import model.User;

/**
 *
 * @author dell
 */
public class CheckoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("username");

        if (user == null) {
            response.sendRedirect("login"); // Redirect if user not logged in
            return;
        }

        CartDAO cartDao = new CartDAO();
        Order order = cartDao.getOrderNew(user.getUserId());

        if (order != null) {

            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

            // Format totalAmount to two decimal places
            DecimalFormat df = new DecimalFormat("#.##");
            String formattedTotalAmount = df.format(totalAmount);

            request.setAttribute("order", order);
            request.setAttribute("totalAmount", formattedTotalAmount);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            // Handle scenario where there are no items in the cart
            request.setAttribute("mess", "No items in the cart");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("username");

        if (user == null) {
            response.sendRedirect("login"); // Redirect if user not logged in
            return;
        }

        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        // chuyển status sang trạng thái khác
        CartDAO cartDao = new CartDAO();
        String status = "checkout";
        boolean isAddOrder = cartDao.updateOrder(orderId, totalAmount, status);

        request.setAttribute("mess", "Checkout successfully");

        request.getRequestDispatcher("checkout.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
