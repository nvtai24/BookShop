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

/**
 *
 * @author trung
 */
public class RoleDAO extends DBConnect {

    public Role getRoleByRoleId(int roleId) {
        Role role = null;
        String query = "SELECT * FROM Roles WHERE role_id = ?";

        try (PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setInt(1, roleId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                role = new Role();
                role.setRoleId(resultSet.getInt("role_id"));
                role.setRoleName(resultSet.getString("role_name"));
                // Populate other fields if necessary
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return role;
    }
    public static void main(String[] args) {
        RoleDAO roleDao = new  RoleDAO();
        Role role = roleDao.getRoleByRoleId(1);
        System.out.println(role.toString());
    }
}
