package com.lisik.camping.camp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class campDAO {
	@Autowired
	DataSource datasource;
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void finallyClose() {
		try {
			if(conn != null) {
				conn.close();
			}if(pstmt != null) {
				pstmt.close();
			}if(rs != null) {
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<campDTO>campSearchList(String search){
		ArrayList<campDTO>campSearchList=new ArrayList<campDTO>();
		String searchName="%"+search+"%";
		try {
			conn=datasource.getConnection();
			
			String sql="select * from camp where camp_name like ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchName);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				campDTO camp=new campDTO();
				camp.setNo(rs.getInt(1));
				camp.setName(rs.getString(2));
				camp.setAddress(rs.getString(3));
				camp.setType(rs.getString(4));
				camp.setPrice(rs.getInt(5));
				camp.setIntroduction(rs.getString(6));
				camp.setImg(rs.getString(7));
				camp.setLike(rs.getInt(8));
				camp.setScope(rs.getInt(9));
				campSearchList.add(camp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return campSearchList;
	}
	public ArrayList<imgDTO>imgSearchList(int no){
		ArrayList<imgDTO>imgSearchList=new ArrayList<imgDTO>();
		try {
			conn=datasource.getConnection();
			
			String sql="select * from img where camp_No=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				imgDTO img=new imgDTO();
				img.setNo(rs.getInt(1));
				img.setImg(rs.getString(2));
				imgSearchList.add(img);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return imgSearchList;
	}
}
