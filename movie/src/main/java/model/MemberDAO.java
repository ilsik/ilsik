package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class  MemberDAO{
	private MemberDAO() {}
	private static MemberDAO instance=new MemberDAO();
	public static MemberDAO getInstance() {
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
	}public int idcheck(String id){
		int check=-1;
		
		try {
			conn=getConn();
			
			String sql="select count(*) from member where member_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				check=rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
            if(rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return check;
	}public int join(MemberBean member) {
		int check=idcheck(member.getMember_id());
		
		try {
			if(check==0) {
				conn=getConn();
				
				String sql="insert into member(member_id,member_pw,member_name,member_gender,member_point,member_reg_date,member_age,member_grade) values(?,?,?,?,0,now(),?,'일반')";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, member.getMember_id());
				pstmt.setString(2, member.getMember_pw());
				pstmt.setString(3, member.getMember_name());
				pstmt.setString(4, member.getMember_gender());
				pstmt.setString(5,member.getMember_age());
				pstmt.executeUpdate();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
		}
		return check;
	}public int login(String id,String pw) {
		int check=-1;
		
		try {
			conn=getConn();
			
			String sql="select count(*) from member where member_id=? and member_pw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				check=rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
            if(rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return check;
	}public int pointchekc(String log) {
		int point=-1;
		
		try {
			conn=getConn();
			
			String sql="select member_point from member where member_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, log);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				point=rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
            if(rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return point;
	}public int pointUse(int price,String log) {
		int point=-1;
		
		try {
			conn=getConn();
			
			String sql="select member_point from member where member_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, log);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				point=rs.getInt(1);
				point-=price;
				sql="update member set member_point=? where member_id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, point);
				pstmt.setString(2, log);
				pstmt.executeUpdate();
			}
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
            if(rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return point;
	}public MemberBean getMemberinfo(String log) {
		MemberBean memberInfo=new MemberBean();
		
		try {
			conn=getConn();
			
			String sql="select * from member where member_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, log);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				memberInfo.setMember_id(rs.getString(2));
				memberInfo.setMember_pw(rs.getString(3));
				memberInfo.setMember_name(rs.getString(4));
				memberInfo.setMember_gender(rs.getString(5));
				memberInfo.setMember_point(rs.getInt(6));
				memberInfo.setMember_regdate(rs.getString(7));
				memberInfo.setMember_age(rs.getString(8));
				memberInfo.setMember_grade(rs.getString(9));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
            if(rs != null) {try {rs.close();} catch (SQLException e) {}}
		}
		return memberInfo;
	}public ArrayList<MemberBean> memberList(){
		ArrayList<MemberBean>memberList=new ArrayList<MemberBean>();
		
		try {
			conn=getConn();
			
			String sql="select * from member";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberBean mem=new MemberBean();
				mem.setMember_no(rs.getInt(1));
				mem.setMember_id(rs.getString(2));
				mem.setMember_pw(rs.getString(3));
				mem.setMember_name(rs.getString(4));
				mem.setMember_gender(rs.getString(5));
				mem.setMember_point(rs.getInt(6));
				mem.setMember_regdate(rs.getString(7));
				mem.setMember_age(rs.getString(8));
				mem.setMember_grade(rs.getString(9));
				memberList.add(mem);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
            if(rs != null) {try {rs.close();} catch (SQLException e) {}}
		}return memberList;
		
	}public int delete(String id) {
		int check=-1;
		
		try {
			conn=getConn();
			
			String sql="delete from member where member_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			check=1;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
		}
		return check;
	}
	public int pointCharge(int charge,String log) {
		int check=-1;
		int point=0;
		try {
			conn=getConn();
			
			String sql="select member_point from member where member_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, log);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				point=rs.getInt(1);
				point+=charge;
			}
			sql="update member set member_point=? where member_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, log);
			pstmt.executeUpdate();
			check=1;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) {try {conn.close();} catch (SQLException e) {}}
            if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
            if(rs != null) {try {rs.close();} catch (SQLException e) {}}
		}return check;
	}
}