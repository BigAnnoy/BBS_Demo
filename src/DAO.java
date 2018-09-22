import java.sql.*;

public class DAO {
        private static final String Driver = "com.mysql.jdbc.driver";
        private static final String JdbcUrl = "jdbc:mysql://localhost:3306/article";
        private static String userName = "root";
        private static String passwords = "13141516";
        private String sql = "SELECT * FROM article";
        private Connection conn = null;
        private ResultSet rs = null;
        private Statement stat = null;

        public void getConnection(){
            try {
                Class.forName(Driver);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            try {
                conn = DriverManager.getConnection(JdbcUrl,userName,passwords);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        public ResultSet getResult(){
            getConnection();
            try {
                stat = conn.createStatement();
                rs = stat.executeQuery(sql);
                return rs;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }

        public void disConnect(){
            try {
                rs.close();
                stat.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }


}
