package Library;
import java.util.*;
import java.sql.*;
public class Issue1Dao {
	public static List<Issue1Info> getAllIssueBooks(){
		List<Issue1Info> list = new ArrayList<Issue1Info>();
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("select user1.name, issue.bookname, issue.today from user1,issue where user1.email = issue.username");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Issue1Info u = new Issue1Info();
				u.setName(rs.getString(1));
				u.setBname(rs.getString(2));
				u.setToday(rs.getDate(3));
				list.add(u);
			}
			conn.close();
		}catch(Exception ob1){
			ob1.printStackTrace();
		}
		return list;
	}
	public static List<Issue1Info> getAllIssueBooksByUser(String email12){
		List<Issue1Info> list = new ArrayList<Issue1Info>();
		try{
			String email1 = "";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("select * from issue where username=?");
			ps.setString(1, email12);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Issue1Info u = new Issue1Info();
				u.setBname(rs.getString(1));
				u.setToday(rs.getDate(2));
				list.add(u);
			}
			conn.close();
		}catch(Exception ob1){
			ob1.printStackTrace();
		}
		return list;
	}
	public static int Return(String email1, String bookname1){
		int status = 0;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("delete from issue where username=? and bookname=?");
			ps.setString(1, email1);
			ps.setString(2, bookname1);
			status = ps.executeUpdate();
			conn.close();
		}catch(Exception er){
			er.printStackTrace();
		}
		return status;
	}
}
