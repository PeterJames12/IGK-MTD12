package com.igor.database;

import lombok.Getter;
import lombok.SneakyThrows;

import java.sql.*;
import org.apache.commons.dbcp2.*;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author Igor Gnes on 05.01.17.
 */
@Getter
public class DatabaseConnection {

    public static final String URL = "jdbc:postgresql://ec2-23-23-93-255.compute-1.amazonaws.com:5432/d5t06k85ohsutd?ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory";
    public static final String USERNAME = "zqrtvxhfqmdjft";
    public static final String PASS = "5946f5d3a5434dc18a5fd32dc6759c9b62b37cb0e687cb7e1f80b27dbd09c7ba";

    public static void main(String[] args) throws SQLException {

        final Connection connection = getConnection();
        final Statement statement = connection.createStatement();
        final ResultSet resultSet = statement.executeQuery("select * from admin;");

        while (resultSet.next()) {
            System.out.println(resultSet.getString("name"));
        }
    }

    @SneakyThrows
    public static Connection getConnection() {
        return DriverManager.getConnection(URL, USERNAME, PASS);
    }
}
