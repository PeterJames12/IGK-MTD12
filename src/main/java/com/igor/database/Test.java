package com.igor.database;

import com.igor.model.entity.Project;
import lombok.SneakyThrows;
import lombok.val;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

/**
 * @author igor on 31.01.17.
 */
public class Test {

    List<Project> projectList = new LinkedList<>();

    @SneakyThrows
    public List<Project> projectList() {
        val databaseConnection = new DatabaseConnection();
        Connection connection = databaseConnection.getConnectionPool().getConnection();

        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from exellent;");

        while (resultSet.next()) {
            Project project = new Project();
            project.setName(resultSet.getString("name"));
            projectList.add(project);
        }
        return projectList;
    }
}
