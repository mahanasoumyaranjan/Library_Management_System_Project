package Library;
import java.util.*;
import java.sql.*;
public class AdminDB {
	public static int save(AdminInfo u){
		int status = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("INSERT INTO ADMIN VALUES(?,?,?,?)");
			ps.setString(1, u.getFname());
			ps.setString(2, u.getLname());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
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
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM ADMIN WHERE EMAIL=? AND PASSWORD=?");
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
	public static boolean Check_Email(String email2){
		boolean status = false;
		try{
			String email1 = "";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("SELECT EMAIL FROM ADMIN WHERE EMAIL=?");
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
}
