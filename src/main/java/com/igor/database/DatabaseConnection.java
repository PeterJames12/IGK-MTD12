package com.igor.database;

import lombok.SneakyThrows;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;

/**
 * @author Igor Gnes on 05.01.17.
 */
public class DatabaseConnection {

    @SneakyThrows
    public static Connection getConnection() {
        InitialContext initContext = new InitialContext();
        DataSource dataSource = (DataSource) initContext.lookup("java:/comp/env/jdbc/postgres");
        return dataSource.getConnection();
    }
}
