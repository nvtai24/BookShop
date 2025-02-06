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
import model.Book;
import model.Category;

public class CategoryDAO extends DBConnect {

    public Category getCategoryById(int id) {
        String query = "SELECT * FROM Categories WHERE category_id = ?";
        Category category = null;

        try (PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    category = new Category();
                    category.setCategoryId(resultSet.getInt("category_id"));
                    category.setCategoryName(resultSet.getString("category_name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return category;
    }

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM Categories";

        try (PreparedStatement statement = conn.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getInt("category_id"));
                category.setCategoryName(resultSet.getString("category_name"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

    public boolean addCategory(Category category) {
        String query = "INSERT INTO Categories (category_name) VALUES (?)";

        try (PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setString(1, category.getCategoryName());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateCategory(Category category) {
        String query = "UPDATE Categories SET category_name = ? WHERE category_id = ?";

        try (PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setString(1, category.getCategoryName());
            statement.setInt(2, category.getCategoryId());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
    
    // có vấn đề 
    public boolean deleteCategory(int id) {
        String query = "DELETE FROM Categories WHERE category_id = ?";

        try (PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setInt(1, id);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

  
    
    public List<Category> countBooksInCategories() {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT c.category_id, c.category_name, COUNT(b.book_id) AS book_count " +
                       "FROM Categories c " +
                       "LEFT JOIN Books b ON c.category_id = b.category_id " +
                       "GROUP BY c.category_id, c.category_name";

        try (PreparedStatement statement = conn.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getInt("category_id"));
                category.setCategoryName(resultSet.getString("category_name"));
                // Optionally, you can set the count of books in the category
                category.setBookCount(resultSet.getInt("book_count"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }
    public static void main(String[] args) {
        CategoryDAO categoryDAO = new CategoryDAO();
         System.out.println("Count of Books in Each Category:");
        List<Category> categoriesWithBookCount = categoryDAO.countBooksInCategories();
        for (Category category : categoriesWithBookCount) {
            System.out.println(category.getCategoryId() + ": " + category.getCategoryName() + " - " + category.getBookCount() + " books");
        } 
    }
    

}
