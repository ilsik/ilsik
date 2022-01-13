package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class  MovieDAO{
	private MovieDAO() {}
	private static MovieDAO instance=new MovieDAO();
	public static MovieDAO getInstance() {
		return instance;
	}
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public Connection getConn() throws Exception {
		String dbURL = "jdbc:mysql://localhost:3306/Movie?serverTimezone=UTC&useSSL=false";
		String dbID = "root";
		String dbPassword = "root";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
        
        return conn;
	}
	public String[]	title() {
		String title[]=null;
		int size=0;
		try {
			conn=getConn();
			String sql="select count(*) from movie";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				size=rs.getInt(1);
				title=new String[size];
				sql="select movie_title from movie order by movie_grade";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				int i=0;
				while(rs.next()){
					title[i]=rs.getString(1);
					i+=1;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
            if(rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return title;
	}
}