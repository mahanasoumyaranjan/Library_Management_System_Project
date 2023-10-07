package Library;
import java.util.*;
import java.sql.*;
public class IssueDao {
	public static int SaveBook(IssueInfo b){
		int status = 0;
		try{
			java.sql.Date currentDate=new java.sql.Date(System.currentTimeMillis());
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("insert into issue values(?,?,?)");
			ps.setString(1, b.getBname());
			ps.setString(2, b.getEmail());
			ps.setDate(3, currentDate);
			status = ps.executeUpdate();
			conn.close();
		}catch(Exception r){
			r.printStackTrace();
		}
		return status;
	}
}
