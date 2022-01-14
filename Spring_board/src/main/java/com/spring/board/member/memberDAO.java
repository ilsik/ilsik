package com.spring.board.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class memberDAO {
	@Autowired
	DataSource datasource;
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void finallyClose() {
		try {
			if(conn != null) {conn.close();	}
			if(pstmt != null) {pstmt.close();	}
			if(rs != null) {rs.close();	}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int idCheck(String id) {
		int check=-1;
		try {
			conn=datasource.getConnection();
			
			String sql="select count(*) from member where member_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				check=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return check;
	}public int insert(memberDTO member) {
		int check=-1;
		
		try {
			conn=datasource.getConnection();
			
			String sql="insert into member(member_id,member_pw,member_name,member_gender,member_age) values(?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getAge());
			pstmt.executeUpdate();
			check=1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return check;
	}public int login(String id,String pw) {
		int check=-1;
		
		try {
			conn=datasource.getConnection();
			
			String sql="select count(*) from member where member_id=? and member_pw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				check=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return check;
	}public String name(String id,String pw) {
		String name="";
		try {
			conn=datasource.getConnection();
			
			String sql="select member_name from member where member_id=? and member_pw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				name=rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return name;
	}
	
}	
