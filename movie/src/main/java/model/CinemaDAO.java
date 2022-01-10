package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CinemaDAO {
	private CinemaDAO() {}
	private static CinemaDAO instance=new CinemaDAO();
	public static CinemaDAO getInstance() {
		return instance;
	}
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public Connection getConn() throws Exception {
		String dbURL = "jdbc:mysql://localhost:3307/Movie?serverTimezone=UTC&useSSL=false";
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
	public ArrayList<CinemaBean>cinemaTimeList(String selMovie) {
		ArrayList<CinemaBean>cinemaTimeList=new ArrayList<CinemaBean>();
		int size=0;
		
	try {
		conn=getConn();
		
		String sql="select * from cinema where cinema_title =? order by cinema_theater";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,selMovie);
		rs=pstmt.executeQuery();
		while(rs.next()){
			CinemaBean cinema=new CinemaBean();
			cinema.setCinema_title(rs.getString(1));
			cinema.setCinema_time(rs.getString(2));
			cinema.setCinema_type(rs.getString(3));
			cinema.setCinema_theater(rs.getInt(4));
			cinema.setCinema_price(rs.getInt(5));
			cinemaTimeList.add(cinema);
		}
	}catch (Exception e) {
		e.printStackTrace();// TODO: handle exception
	}finally {
		if(conn != null) {try {conn.close();} catch (SQLException e) {}}
        if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
        if(rs != null) {try {rs.close();} catch (SQLException e) {}}
	}return cinemaTimeList;
	
	}public ArrayList<CinemaBean>getCinemaList(){
		ArrayList<CinemaBean>cinemaList=new ArrayList<CinemaBean>();
		
		try {
			conn=getConn();
			
			String sql="select * from cinema";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CinemaBean cinema=new CinemaBean();
				cinema.setCinema_title(rs.getString(1));
				cinema.setCinema_time(rs.getString(2));
				cinema.setCinema_type(rs.getString(3));
				cinema.setCinema_theater(rs.getInt(4));
				cinema.setCinema_price(rs.getInt(5));
				cinemaList.add(cinema);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
	        if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
	        if(rs != null) {try {rs.close();} catch (SQLException e) {}}
		}return cinemaList;
	}public int cinemaDelete(String theater, String time) {
		int check=-1;
		try {
			conn=getConn();
			
			String sql="delete from cinema where cinema_theater=? and cinema_time=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, theater);
			pstmt.setString(2, time);
			pstmt.executeUpdate();
			check=1;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
	        if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
	        if(rs != null) {try {rs.close();} catch (SQLException e) {}}
		}return check;
	}public int cinemaAdd(CinemaBean cinema) {
		int check=-1;
		try {
			conn=getConn();
			
			String sql="insert into cinema values(?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cinema.getCinema_title());
			pstmt.setString(2, cinema.getCinema_time());
			pstmt.setString(3, cinema.getCinema_type());
			pstmt.setInt(4, cinema.getCinema_theater());
			pstmt.setInt(5, cinema.getCinema_price());
			pstmt.executeUpdate();
			check=1;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
	        if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
		}return check;
	}
}
