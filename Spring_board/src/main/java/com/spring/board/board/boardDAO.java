package com.spring.board.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class boardDAO {

	@Autowired
	DataSource datasource;
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void finallyClose() {
		try {
			if(conn != null) {conn.close();}
			if(pstmt != null) {pstmt.close();}
			if(rs != null) {rs.close();}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int getAllcount() {
		int count=0;
		
		try {
			conn=datasource.getConnection();
			
			String sql="select count(*) from board";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return count;
	}public ArrayList<boardDTO>getBoardList(){
		ArrayList<boardDTO>BoardList=new ArrayList<boardDTO>();
		try {
			conn=datasource.getConnection();
			
			String sql="select * from board order by board_no desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				boardDTO board=new boardDTO();
				board.setNum(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setType(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setName(rs.getString(5));
				board.setPw(rs.getString(6));
				BoardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return BoardList;
	}public ArrayList<boardDTO>getTypeBoardList(String type[]){
		ArrayList<boardDTO>TypeBoardList=new ArrayList<boardDTO>();
		try {
			conn=datasource.getConnection();
			
			for(int i=0;i<type.length;i++) {
				String sql="select * from board where board_type=? order by board_no desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, type[i]);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					boardDTO board=new boardDTO();
					board.setNum(rs.getInt(1));
					board.setTitle(rs.getString(2));
					board.setType(rs.getString(3));
					board.setContent(rs.getString(4));
					board.setName(rs.getString(5));
					board.setPw(rs.getString(6));
					TypeBoardList.add(board);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return TypeBoardList;
	}public int boardMaxsize() {
		int size=0;
		try {
			conn=datasource.getConnection();
			
			String sql="select max(board_no) from board";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				size=rs.getInt(1);
				size+=1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return size;
	}
	public int boardWrite(boardDTO board) {
		int check=-1;
		
		try {
			conn=datasource.getConnection();
			
			String sql="insert into board (board_title,board_type,board_content,board_name,board_pw)value(?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getType());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getName());
			pstmt.setString(5, board.getPw());
			pstmt.executeUpdate();
			check=1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return check;
	}
	public boardDTO selBoard(int no) {
		boardDTO board=new boardDTO();
		try {
			conn=datasource.getConnection();
			
			String sql="select * from board where board_no=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				board.setNum(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setType(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setName(rs.getString(5));
				board.setPw(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return board;
	}public int boardPwCheck(String pw,int num) {
		int check=-1;
		try {
			conn=datasource.getConnection();
			
			String sql="select count(*) from board where board_no=? and board_pw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	}public int update(boardDTO board) {
		int check=-1;
		try {
			conn=datasource.getConnection();
			
			String sql="update board set board_title=?,board_type=?,board_content=?,board_name=?,board_pw=? where board_no=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getType());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getName());
			pstmt.setString(5, board.getPw());
			pstmt.setInt(6, board.getNum());
			pstmt.executeUpdate();
			check=1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return check;
	}
	public ArrayList<commentDTO>commentList(int ref){
		ArrayList<commentDTO>commentList=new ArrayList<commentDTO>();
		try {
			System.out.println("dao 시작");
			conn=datasource.getConnection();
			
			String sql="select * from comment where ref=? order by reLevel";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				commentDTO comment=new commentDTO();
				comment.setName(rs.getString(1));
				comment.setContent(rs.getString(2));
				comment.setRef(rs.getInt(3));
				comment.setReStep(rs.getInt(4));
				comment.setReLevel(rs.getInt(5));
				comment.setRegdate(rs.getString(6));
				commentList.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			finallyClose();
		}
		return commentList;
	}
}
