package com.lisik.camping.camp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
