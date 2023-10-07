package Library;
import java.util.*;
import java.sql.*;
public class BookDao {
	public static List<BookInfo> getAllBooks(){
		List<BookInfo> list = new ArrayList<BookInfo>();
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("select * from book");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				BookInfo b = new BookInfo();
				b.setName(rs.getString(1));
				b.setAuthor(rs.getString(2));
				b.setCategory(rs.getString(3));
				list.add(b);
			}
			conn.close();
		}catch(Exception ob1){
			ob1.printStackTrace();
		}
		return list;
	}
	public static int SaveBook(BookInfo b){
		int status = 0;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("insert into book values(?,?,?)");
			ps.setString(1, b.getName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getCategory());
			status = ps.executeUpdate();
			conn.close();
		}catch(Exception r){
			r.printStackTrace();
		}
		return status;
	}
	public static int delete(String bname){
		int status = 0;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("delete from book where name=?");
			ps.setString(1, bname);
			status = ps.executeUpdate();
			conn.close();
		}catch(Exception ob4){
			ob4.printStackTrace();
		}
		return status;
	}
	public static int TotalBooks(){
		int status = 0;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","20bcte36","Alok@20bcte36");
			PreparedStatement ps = conn.prepareStatement("select * from book");
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
