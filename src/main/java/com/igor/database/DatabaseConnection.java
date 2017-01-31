package com.igor.database;

import lombok.Getter;
import lombok.SneakyThrows;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.*;
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

    // new
    @SneakyThrows
    public DatabaseConnection() {
        URI dbUri = new URI(System.getenv("ec2-23-23-93-255.compute-1.amazonaws.com:5432/d5t06k85ohsutd"));
        String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + dbUri.getPath();
        connectionPool = new BasicDataSource();

        if (dbUri.getUserInfo() != null) {
            connectionPool.setUsername(dbUri.getUserInfo().split(":")[0]);
            connectionPool.setPassword(dbUri.getUserInfo().split(":")[1]);
        }
        connectionPool.setDriverClassName("org.postgresql.Driver");
        connectionPool.setUrl(dbUrl);
        connectionPool.setInitialSize(1);
    }


    // old
    @SneakyThrows
    public static Connection getConnection() {

        InitialContext initContext = new InitialContext();
        DataSource dataSource = (DataSource) initContext.lookup("java:/comp/env/jdbc/postgres");

        return dataSource.getConnection();
    }

}
