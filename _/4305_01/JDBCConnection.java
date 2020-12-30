import java.sql.*;
public class JDBCConnection {
    public void connectToDatabase() {
        try {
            String url="jdbc:derby:demodb;create=true";
            Connection conn = DriverManager.getConnection(url);
            System.out.println("Connection Established");
        }  catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public static void main(String[] argv) {
        JDBCConnection jdbc = new JDBCConnection();
        jdbc.connectToDatabase();
    }
} 
