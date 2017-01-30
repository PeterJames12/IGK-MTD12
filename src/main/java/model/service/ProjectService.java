package model.service;

import com.igor.database.DatabaseConnection;
import lombok.SneakyThrows;
import model.entity.Project;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Igor Gnes on 05.01.17.
 */
public class ProjectService {

    private List<Project> projectList = new LinkedList<>();

    private List<Project> getProjectListWithConnection() {

        try {
            Connection connection = DatabaseConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * from excellent; ");

            while (resultSet.next()) {
                builderProject(resultSet);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProjectService.class.getSimpleName()).log(Level.SEVERE, null, e);
        }
        return projectList;
    }

    public List<Project> getProjectList() {

        if (!projectList.isEmpty()) {
            return projectList;
        } else {
            return getProjectListWithConnection();
        }
    }

    public List<Project> myProject(String name) {

        try {
            Connection connection = DatabaseConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement
                    .executeQuery("select * from excellent WHERE developers LIKE " + "'" + "%" + name + "%" + "'");

            while (resultSet.next()) {
                builderProject(resultSet);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProjectService.class.getSimpleName()).log(Level.SEVERE, null, e);
        }
        return projectList;
    }

    @SneakyThrows
    private void builderProject(ResultSet resultSet) {

        Project project = new Project();
        project.setId(resultSet.getInt("id"));
        project.setName(resultSet.getString("name"));
        project.setDescription("The project start in " +
                resultSet.getString("data_start") + " and have to finish " +
                "until " + resultSet.getString("data_finish") + " the main developer is " +
                resultSet.getString("main_dev") + " developers: " +
                resultSet.getString("developers") +
                " note for you: " +
                resultSet.getString("note"));
        projectList.add(project);
    }

    public void insertProject(String author, String projectName, String data_start, String data_finish, String mainDev, String developer, String task, String note) {

        try {
            Connection connection = DatabaseConnection.getConnection();
            Statement statement = connection.createStatement();
            statement.execute("INSERT INTO excellent (name, data_start, data_finish, main_dev, developers,task,author,note) VALUES ('" + projectName + "','" + data_start + "','" + data_finish +
                    "','" + mainDev + "','" + developer + "','" + task + "','" + author + "','" + note + "')");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @SneakyThrows
    public List<Project> getMyProject(String whoAmI, String passwordDev) {

        if (validator(whoAmI, passwordDev)) {
            Connection connection = DatabaseConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from excellent WHERE developers = " + "'" + whoAmI + "'");

            while (resultSet.next()) {
                builderProject(resultSet);
            }
            return projectList;
        }
        Project project = new Project();
        project.setName("You don't have any project yet");
        projectList.add(project);
        return projectList;
    }

    @SneakyThrows
    private boolean validator(String whoAmI, String passwordDev) {

        Connection connection = DatabaseConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT password FROM loginpass WHERE login = " + "'" + whoAmI + "'");
        String password = "";
        while (resultSet.next()) {
            password = resultSet.getString("password");
        }
        return password.equals(passwordDev);
    }
}
