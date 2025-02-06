package controller;

import dao.BookAuthorDAO;
import dao.BookDAO;
import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Author;
import model.Book; // Assuming you have a Book model class
import model.Category;

public class EditBookController extends HttpServlet {

    // Assuming you have a service or DAO to handle business logic
    // Example: BookService bookService = new BookService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookId = request.getParameter("bookId");
        BookDAO bookDao = new BookDAO();
        
        Book book = bookDao.getBookById(Integer.parseInt(bookId));        
        request.setAttribute("book", book);
        
        CategoryDAO categoryDao = new CategoryDAO();
        List<Category> listCategory = categoryDao.getAllCategories();
        request.setAttribute("listC", listCategory);

        BookAuthorDAO auDao = new BookAuthorDAO();
        List<Author> listAllAuthor = auDao.getAllAuthor();
        request.setAttribute("listAllAuthor", listAllAuthor);
        request.getRequestDispatcher("editBook.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
          int bookId = Integer.parseInt(request.getParameter("bookId"));
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

            // Cập nhật thông tin sách trong cơ sở dữ liệu
            BookDAO bookDao = new BookDAO();
            boolean success = bookDao.updateBook(bookId, categoryId, title, rating, price, description, image, quantity_in_stock);

            // Xóa tất cả tác giả của sách trước khi thêm lại
            bookDao.deleteAuthorsForBook(bookId);

            // Thêm tác giả mới cho sách
            boolean addAuthor = bookDao.addAuthorsForBook(bookId, authorList);

            if (success) {
                // Redirect về trang danh sách sách sau khi chỉnh sửa thành công
                response.sendRedirect("manager-book");
            } else {
                // Xử lý khi chỉnh sửa sách không thành công
                request.setAttribute("message", "Failed to update book.");
                request.getRequestDispatcher("editBook.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            // Xử lý lỗi nếu có
            request.setAttribute("message", "Error: " + ex.getMessage());
            request.getRequestDispatcher("editBook.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
