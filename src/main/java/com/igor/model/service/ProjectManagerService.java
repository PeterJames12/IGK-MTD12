package com.igor.model.service;

import com.igor.database.DatabaseConnection;
import lombok.SneakyThrows;
import lombok.val;
import com.igor.model.entity.ProjectManager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

/**
 * @author devcolibri on 16.01.17.
 */
public class ProjectManagerService {

    private List<ProjectManager> projectManagerEntities = new LinkedList<>();

    @SneakyThrows
    public List<ProjectManager> getAllProjectManager() {

        Connection connection = DatabaseConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM projectmanager;");

        while (resultSet.next()) {
            val projectManagerEntity = new ProjectManager();
            projectManagerEntity.setName(resultSet.getString("name"));

            projectManagerEntities.add(projectManagerEntity);
        }
        return projectManagerEntities;
    }
}
