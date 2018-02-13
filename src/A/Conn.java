package A;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;


public class Conn {
		private static final String driver = "com.mysql.jdbc.Driver";
	    private static final String userName = "root";
	    private static final String passwrod = "123456";
	    private static final String url="jdbc:mysql://localhost:3306/goods"; 
	    private static Connection con=null;
	    public static Connection instance() throws ClassNotFoundException{
			try {
				Class.forName(driver);
				con=(Connection) DriverManager.getConnection(url, userName, passwrod);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return con;
	    }
}
