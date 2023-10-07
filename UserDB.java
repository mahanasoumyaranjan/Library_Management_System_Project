package Library;
import java.util.*;
import java.sql.*;
public class UserDB {
	public static boolean Check_Email(String email2){
		boolean status = false;
		try{
			String email1 = "";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("SELECT EMAIL FROM USER1 WHERE EMAIL=?");
			ps.setString(1, email2);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				email1 = rs.getString("email");
				if(email2.equals(email1)){
					status = true;
				}else{
					status = false;
				}
			}
		}catch(Exception e1){
			e1.printStackTrace();
		}
		return status;
	}
	public static int save(UserInfo u){
		int status = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("INSERT INTO USER1 VALUES(?,?,?,?,?,?)");
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getAddress());
			ps.setLong(5, u.getMobile());
			ps.setString(6, u.getDob());
			status = ps.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public static boolean validate(String email, String password){
		boolean status = false;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM USER1 WHERE EMAIL=? AND PASSWORD=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			status = rs.next();
			conn.close();
		}catch(Exception ob){
			ob.printStackTrace();
		}
		return status;
	}
	public static List<UserInfo> getAllUsers(){
		List<UserInfo> list = new ArrayList<UserInfo>();
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("select * from user1");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				UserInfo u = new UserInfo();
				u.setName(rs.getString(1));
				u.setEmail(rs.getString(2));
				u.setAddress(rs.getString(4));
				u.setMobile(rs.getLong(5));
				list.add(u);
			}
			conn.close();
		}catch(Exception ob1){
			ob1.printStackTrace();
		}
		return list;
	}
	public static int TotalUsers(){
		int status = 0;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("select * from user1");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				status++;
			}
		}catch(Exception o){
			o.printStackTrace();
		}
		return status;
	}
}
