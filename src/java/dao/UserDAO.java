/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Role;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Author;
import model.Book;
import model.Category;
import model.User;

/**
 *
 * @author trung
 */
public class UserDAO extends DBConnect {

    public User validateUser(String username, String password) {
        User user = null;
        String query = "SELECT * FROM Users WHERE username = ? AND password = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("full_name"));

                RoleDAO roleDao = new RoleDAO();
                Role role = roleDao.getRoleByRoleId(rs.getInt("role_id"));
                user.setRoleId(role);

                user.setRegistrationDate(rs.getDate("registration_date"));
                user.setStatus(rs.getString("status"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean createUser(String username, String password, String fullName, String email) {
        String query = "INSERT INTO Users (username, password, full_name, email,role_id) VALUES (?, ?, ?, ?,2)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, fullName);
            stmt.setString(4, email);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUser(int userId, String email, String password, String confirmPassword, String fullName) {
        if (!password.equals(confirmPassword)) {
            return false; // Trả về false nếu mật khẩu không 
        }

        String query = "UPDATE Users SET email = ?, password = ?, full_name = ? WHERE user_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            stmt.setString(3, fullName);
            stmt.setInt(4, userId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getUserByUserId(int userId) {
        User user = null;
        String query = "SELECT * FROM Users WHERE user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));

                RoleDAO roleDao = new RoleDAO();
                Role role = roleDao.getRoleByRoleId(rs.getInt("role_id"));
                user.setRoleId(role);

                user.setRegistrationDate(rs.getDate("registration_date"));
                user.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public List<User> getAllUser() {
        List<User> userList = new ArrayList<>();
        String query = "SELECT * FROM Users";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));

                RoleDAO roleDao = new RoleDAO();
                Role role = roleDao.getRoleByRoleId(rs.getInt("role_id"));
                user.setRoleId(role);

                user.setRegistrationDate(rs.getDate("registration_date"));
                user.setStatus(rs.getString("status"));

                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public int getTotalUsers() {
        int totalUsers = 0;
        String query = "SELECT COUNT(*) AS total FROM Users";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                totalUsers = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalUsers;
    }

    public List<User> getUsersByPage(int currentPage, int pageSize) {
        List<User> userList = new ArrayList<>();
        int startRow = (currentPage - 1) * pageSize;
        String query = "SELECT * FROM Users ORDER BY user_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, startRow);
            stmt.setInt(2, pageSize);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));

                RoleDAO roleDao = new RoleDAO();
                Role role = roleDao.getRoleByRoleId(rs.getInt("role_id"));
                user.setRoleId(role);

                user.setRegistrationDate(rs.getDate("registration_date"));
                user.setStatus(rs.getString("status"));

                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public boolean banUserId(int userId) {
        String query;
        String currentStatus = getUserStatus(userId);

        if ("active".equals(currentStatus)) {
            query = "UPDATE Users SET status = 'banned' WHERE user_id = ?";
        } else if ("banned".equals(currentStatus)) {
            query = "UPDATE Users SET status = 'active' WHERE user_id = ?";
        } else {
            return false; // Handle unknown status or other cases
        }

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private String getUserStatus(int userId) {
        String status = "";
        String query = "SELECT status FROM Users WHERE user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                status = rs.getString("status");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public boolean deleteUserData(int userId) {
        try {
            // Xóa từ bảng OrderDetails (Chi tiết đơn hàng)
            String deleteOrderDetailsQuery = "DELETE FROM OrderDetails WHERE order_id IN (SELECT order_id FROM Orders WHERE user_id = ?)";
            try (PreparedStatement stmt = conn.prepareStatement(deleteOrderDetailsQuery)) {
                stmt.setInt(1, userId);
                stmt.executeUpdate();
            }

            // Xóa từ bảng Orders (Đơn hàng)
            String deleteOrdersQuery = "DELETE FROM Orders WHERE user_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(deleteOrdersQuery)) {
                stmt.setInt(1, userId);
                stmt.executeUpdate();
            }





            String deleteUserQuery = "DELETE FROM Users WHERE user_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(deleteUserQuery)) {
                stmt.setInt(1, userId);
                int rowsAffected = stmt.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void addAuthor(String authorName, String authorImage, String authorDescription) {
        String query = "INSERT INTO Authors ([author_name], [image], [description]) VALUES (?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, authorName);
            ps.setString(2, authorImage);
            ps.setString(3, authorDescription);

            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateAuthor(int authorId, String authorName, String authorImage, String authorDescription) {
        String query = "UPDATE Authors SET author_name = ?, image = ?, description = ? WHERE author_id = ?";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, authorName);
            ps.setString(2, authorImage);
            ps.setString(3, authorDescription);
            ps.setInt(4, authorId);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Author updated successfully.");
            } else {
                System.out.println("Failed to update author.");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public boolean deleteAuthor(int authorId) {
    try {
        // Delete from BookAuthors table first
        String deleteBookAuthorsQuery = "DELETE FROM BookAuthors WHERE author_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(deleteBookAuthorsQuery)) {
            stmt.setInt(1, authorId);
            stmt.executeUpdate();
        }

        // Delete associated books from Books table
        String deleteBooksQuery = "DELETE FROM Books WHERE book_id IN (SELECT book_id FROM BookAuthors WHERE author_id = ?)";
        try (PreparedStatement stmt = conn.prepareStatement(deleteBooksQuery)) {
            stmt.setInt(1, authorId);
            stmt.executeUpdate();
        }

        // Delete from OrderDetails table
        String deleteOrderDetailsQuery = "DELETE FROM OrderDetails WHERE book_id IN (SELECT book_id FROM BookAuthors WHERE author_id = ?)";
        try (PreparedStatement stmt = conn.prepareStatement(deleteOrderDetailsQuery)) {
            stmt.setInt(1, authorId);
            stmt.executeUpdate();
        }

      
        // Delete from BookAuthors table (again, in case some books were not deleted initially)
        try (PreparedStatement stmt = conn.prepareStatement(deleteBookAuthorsQuery)) {
            stmt.setInt(1, authorId);
            stmt.executeUpdate();
        }

        // Finally, delete from Authors table
        String deleteAuthorQuery = "DELETE FROM Authors WHERE author_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(deleteAuthorQuery)) {
            stmt.setInt(1, authorId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}



}
