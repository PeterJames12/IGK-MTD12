package com.igor.model.service;

import com.igor.database.DatabaseConnection;
import lombok.SneakyThrows;
import com.igor.model.entity.Developer;

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
public class DeveloperService {

    private List<Developer> developerList = new LinkedList<>();

    private List<Developer> getDeveloperListWithConnection() {

        try {
            Connection connection = DatabaseConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from developer;");

            while (resultSet.next()) {
                Developer developer = new Developer();
                developer.setName(resultSet.getString("name"));
                developer.setSkills(resultSet.getString("skills"));
                developer.setEmail(resultSet.getString("email"));
                developerList.add(developer);
            }

        } catch (SQLException e) {
            Logger.getLogger(ProjectService.class.getSimpleName()).log(Level.SEVERE, null, e);
        }
        return developerList;
    }

    public List<Developer> getDeveloperList() {

        if (!developerList.isEmpty()) {
            return developerList;
        } else {
            return getDeveloperListWithConnection();
        }
    }

    @SneakyThrows
    public void insertDeveloper(String name, String email, String skills) {

        Connection connection = DatabaseConnection.getConnection();
        Statement statement = connection.createStatement();
        statement.execute("INSERT INTO developer (name, skills, email) VALUES ('" + name + "','" + skills + "','" + email + "')");
    }
}
