package com.igor.model.service;

import com.igor.database.DatabaseConnection;
import com.igor.model.entity.Admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Igor Gnes on 06.01.17.
 */
public class AdminService {

    private List<Admin> adminList = new LinkedList<>();

    private List<Admin> getAdminWithConnection() {

        try {
            Connection connection = DatabaseConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * from admin;");

            while (resultSet.next()) {

                Admin admin = new Admin();
                admin.setName("name: " + resultSet.getString("name"));
                adminList.add(admin);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProjectService.class.getSimpleName()).log(Level.SEVERE, null, e);
        }
        return adminList;
    }
}
