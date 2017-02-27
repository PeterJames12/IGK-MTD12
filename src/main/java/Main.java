import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.*;

/**
 * @author igor on 02.02.17.
 */
public class Main {

    public static void main(String[] args) throws URISyntaxException, SQLException {
        Connection connection = getConnection();

//        Statement stmt = connection.createStatement();
//        stmt.executeUpdate("DROP TABLE IF EXISTS ticks");
//        stmt.executeUpdate("CREATE TABLE ticks (tick timestamp)");
//        stmt.executeUpdate("INSERT INTO ticks VALUES (now())");
//        ResultSet rs = stmt.executeQuery("SELECT * FROM admin");
//        while (rs.next()) {
//            System.out.println("Read from DB: " + rs.getTimestamp("name"));
//        }
    }

    private static Connection getConnection() throws URISyntaxException, SQLException {
        URI dbUri = new URI(System.getenv("postgres://zqrtvxhfqmdjft:5946f5d3a5434dc18a5fd32dc6759c9b62b37cb0e687cb7e1f80b27dbd09c7ba@ec2-23-23-93-255.compute-1.amazonaws.com:5432/d5t06k85ohsutd"));

        String username = dbUri.getUserInfo().split(":")[0];
        String password = dbUri.getUserInfo().split(":")[1];
        String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + dbUri.getPath();

        return DriverManager.getConnection(dbUrl, username, password);
    }
//    private static Connection getConnection() throws URISyntaxException, SQLException {
//        String dbUrl = System.getenv("postgres://zqrtvxhfqmdjft:5946f5d3a5434dc18a5fd32dc6759c9b62b37cb0e687cb7e1f80b27dbd09c7ba@ec2-23-23-93-255.compute-1.amazonaws.com:5432/d5t06k85ohsutd");
//        return DriverManager.getConnection(dbUrl);
//    }
}