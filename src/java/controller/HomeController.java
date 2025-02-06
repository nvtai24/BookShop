/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import dao.CartDAO;
import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Book;
import model.Category;
import model.Order;
import model.User;

/**
 *
 * @author dell
 */
public class HomeController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
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

        // lấy ra 10 quyển có     quantity_sold nhiều nhất
        BookDAO bookDao = new BookDAO();
        List<Book> listTop10SoldBook = bookDao.getTop10SoldBook();
        request.setAttribute("listTop10SoldBook", listTop10SoldBook);

        // lấy ra top3 quyển mới nhất
        List<Book> listTop3ReleaseDate = bookDao.getTop3ReleaseDate();
        request.setAttribute("listTop3ReleaseDate", listTop3ReleaseDate);

        // lấy ra danh số sách mỗi loại 
        CategoryDAO categoryDao = new CategoryDAO();
        List<Category> countBookInCategory = categoryDao.countBooksInCategories();
        session.setAttribute("countBookInCategory", countBookInCategory);

        // lấy ra top10 lượt view nhiều nhất
        List<Book> listTop10View = bookDao.getTop10View();
        request.setAttribute("listTop10View", listTop10View);

        // lấy ra danh sách category
        List<Category> listCategory = categoryDao.getAllCategories();
        session.setAttribute("listCategory", listCategory);

        User user = (User) session.getAttribute("username");
        if (user != null) {
            // lấy ra số book trong cart 
            CartDAO cartDao = new CartDAO();
            int countBookInCart = 0;
            Order order = cartDao.getOrderNew(user.getUserId());
            if (order != null) {
                countBookInCart = cartDao.countDistinctBooksInCart(user.getUserId());
                session.setAttribute("countBookInCart", countBookInCart);
            } else {
                cartDao.createNewOrder(user.getUserId());
                request.setAttribute("mess", "No book in the cart");
            }

        }

        request.getRequestDispatcher("home.jsp").forward(request, response);
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
        processRequest(request, response);
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
