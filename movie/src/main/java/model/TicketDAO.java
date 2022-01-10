package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class  TicketDAO{
	private TicketDAO() {}
	private static TicketDAO instance=new TicketDAO();
	public static TicketDAO getInstance() {
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
	}public ArrayList<TicketBean>SelticketList(ArrayList<CinemaBean>cinemaList,int index) {
	    ArrayList<TicketBean>SelticketList =new ArrayList<TicketBean>();
		try {
			conn=getConn();
			String sql="select * from ticket where ticket_cinema_title=? and ticket_cinema_time=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,cinemaList.get(index).getCinema_title());
			pstmt.setString(2,cinemaList.get(index).getCinema_time());
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				TicketBean ticket=new TicketBean();
				ticket.setTicket_memberid(rs.getString(1));
				ticket.setTicket_buy_type(rs.getString(2));
				ticket.setTicket_date(rs.getString(3));
				ticket.setTicket_cinema_title(rs.getString(4));
				ticket.setTicket_cinema_time(rs.getString(5));
				ticket.setTicket_theater(rs.getInt(6));
				String seat1=rs.getString(7);
				ticket.setTicket_seat1((char)seat1.charAt(0));
				ticket.setTicket_seat2(rs.getInt(8));
				SelticketList.add(ticket);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
            if(rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return SelticketList;
	}public int insertTicket(TicketBean ticket) {
		int check=-1;
		try {
			conn=getConn();
			String sql="insert into ticket values(?,?,now(),?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,ticket.getTicket_memberid());
			pstmt.setString(2,ticket.getTicket_buy_type());
			pstmt.setString(3,ticket.getTicket_cinema_title());
			pstmt.setString(4,ticket.getTicket_cinema_time());
			pstmt.setInt(5,ticket.getTicket_theater());
			char temp=ticket.getTicket_seat1();
			String seat1=temp+"";
			pstmt.setString(6,seat1);
			pstmt.setInt(7,ticket.getTicket_seat2());
			pstmt.executeUpdate();
			check=1;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
		}
		return check;
	}public ArrayList<TicketBean>getTicketList(){
		 ArrayList<TicketBean>ticketList =new ArrayList<TicketBean>();
		 try {
				conn=getConn();
				String sql="select * from ticket";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					TicketBean ticket=new TicketBean();
					ticket.setTicket_memberid(rs.getString(1));
					ticket.setTicket_buy_type(rs.getString(2));
					ticket.setTicket_date(rs.getString(3));
					ticket.setTicket_cinema_title(rs.getString(4));
					ticket.setTicket_cinema_time(rs.getString(5));
					ticket.setTicket_theater(rs.getInt(6));
					String seat1=rs.getString(7);
					ticket.setTicket_seat1((char)seat1.charAt(0));
					ticket.setTicket_seat2(rs.getInt(8));
					ticketList.add(ticket);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(conn != null) {try {conn.close();} catch (SQLException e) {}}
	            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
	            if(rs != null) {try {rs.close();} catch (SQLException e) {}}
			}
		 return ticketList;
	}
}