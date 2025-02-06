/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import dao.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.List;
import model.Book;
import model.Order;
import model.OrderDetail;
import model.User;

/**
 *
 * @author dell
 */
public class CartController extends HttpServlet {

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
            out.println("<title>Servlet CartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
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
        
        CartDAO cartDao = new CartDAO();
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("username");
        
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        
        Order order = cartDao.getOrderNew(user.getUserId());
        
        if (order != null) {
            request.setAttribute("order", order);
        } else {
            cartDao.createNewOrder(user.getUserId());
            request.setAttribute("mess", "No book in the cart");
        }

        // Calculate total amount 
        if (order != null) {
            double totalAmount = 0;
            for (OrderDetail orderdetail : order.getOrderDetail()) {
                totalAmount += orderdetail.getPrice() * orderdetail.getQuantity();
            }

            // Format totalAmount to two decimal places
            DecimalFormat df = new DecimalFormat("#.##");
            String formattedTotalAmount = df.format(totalAmount);
            request.setAttribute("totalAmount", formattedTotalAmount);
        }
        
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
            response.sendRedirect("login");
            return;
        }
        
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int quantity = 1;
        if (request.getParameter("quantity") != null) {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        }
        CartDAO cartDao = new CartDAO();
        
        BookDAO bookDao = new BookDAO();
        
        Book book = bookDao.getBookById(bookId);
        
        Order order = cartDao.getOrderNew(user.getUserId());
        double price = book.getPrice();
        
        boolean addCart = cartDao.addOrUpdateOrderDetail(order.getOrderId(), bookId, quantity, price);


        if (!addCart) {
            String mess  = "vượt quá số lượng trong kho cuốn sách " + book.getTitle();
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        }
        
        response.sendRedirect("cart");
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
