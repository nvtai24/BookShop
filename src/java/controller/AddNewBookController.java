/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookAuthorDAO;
import dao.BookDAO;
import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Author;
import model.Book;
import model.Category;
import model.User;
public class AddNewBookController extends HttpServlet {

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
            out.println("<title>Servlet AddNewBookController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewBookController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession session = request.getSession();
          User user =(User) session.getAttribute("username");
          if(user.getRoleId().getRoleId() == 2){
              request.setAttribute("mess", "không có quyền");             
                      request.getRequestDispatcher("addNewBook.jsp").forward(request, response);
return;
          }

        CategoryDAO categoryDao = new CategoryDAO();
        List<Category> listCategory = categoryDao.getAllCategories();
        request.setAttribute("listC", listCategory);

        BookAuthorDAO auDao = new BookAuthorDAO();
        List<Author> listAllAuthor = auDao.getAllAuthor();
        request.setAttribute("listAllAuthor", listAllAuthor);

        request.getRequestDispatcher("addNewBook.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy thông tin từ form
            String title = request.getParameter("title");
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            String image = request.getParameter("image");
            int quantity_in_stock = Integer.parseInt(request.getParameter("quantity_in_stock"));
            String[] authors = request.getParameterValues("authors[]");

            // Xử lý danh sách tác giả
            List<Author> authorList = new ArrayList<>();
            if (authors != null) {
                for (String authorId : authors) {
                    Author author = new Author();
                    author.setAuthorId(Integer.parseInt(authorId));
                    authorList.add(author);
                }
            }

            // Lưu sách vào cơ sở dữ liệu
            BookDAO bookDao = new BookDAO();
            boolean success = bookDao.addNewBook(categoryId, title, rating, price, description, image, quantity_in_stock);

            Book booknew = bookDao.getNewestBook();
            // lưu vào bookauthor
            boolean addAuthor = bookDao.addAuthorsForBook(booknew.getBookId(), authorList);

            if (success) {
                // Redirect về trang danh sách sách sau khi thêm thành công
                response.sendRedirect("manager-book");
            } else {
                // Xử lý khi thêm sách không thành công
                request.setAttribute("message", "Failed to add book.");
                request.getRequestDispatcher("addNewBook.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            // Xử lý lỗi nếu có
            request.setAttribute("message", "Error: " + ex.getMessage());
            request.getRequestDispatcher("addNewBook.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
