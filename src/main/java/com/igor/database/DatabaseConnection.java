package com.igor.database;

import lombok.Getter;
import lombok.SneakyThrows;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.*;

import lombok.val;
import org.apache.commons.dbcp2.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author Igor Gnes on 05.01.17.
 */
@Getter
public class DatabaseConnection {

    private BasicDataSource connectionPool;
    public static final String URL = "jdbc:postgresql://ec2-23-23-93-255.compute-1.amazonaws.com:5432/d5t06k85ohsutd";
    public static final String USERNAME = "zqrtvxhfqmdjft";
    public static final String PASS = "5946f5d3a5434dc18a5fd32dc6759c9b62b37cb0e687cb7e1f80b27dbd09c7ba";

    private Connection connection;

    public static void main(String[] args) {

        val databaseConnection = new DatabaseConnection();
    }

    // new
    @SneakyThrows
    public DatabaseConnection() {
        connection = DriverManager.getConnection(URL, USERNAME, PASS);




//        URI dbUri = new URI(System.getenv("ec2-23-23-93-255.compute-1.amazonaws.com:5432/d5t06k85ohsutd"));
//        String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + dbUri.getPath();
//        connectionPool = new BasicDataSource();
//
//        if (dbUri.getUserInfo() != null) {
//            connectionPool.setUsername(dbUri.getUserInfo().split(":")[0]);
//            connectionPool.setPassword(dbUri.getUserInfo().split(":")[1]);
//        }
//        connectionPool.setDriverClassName("org.postgresql.Driver");
//        connectionPool.setUrl(dbUrl);
//        connectionPool.setInitialSize(1);
    }


    // old
    @SneakyThrows
    public static Connection getConnection() {

        InitialContext initContext = new InitialContext();
        DataSource dataSource = (DataSource) initContext.lookup("java:/comp/env/jdbc/postgres");

        return dataSource.getConnection();
    }

}
