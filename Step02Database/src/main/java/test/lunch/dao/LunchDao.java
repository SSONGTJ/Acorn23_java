package test.lunch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.lunch.dto.LunchDto;
import test.util.DbcpBean;

public class LunchDao {
	//자신의 참조값을 담을 static 필드
	private static LunchDao dao;
	
	//외부에서 객체 생성하지 못하도록 생성자의 접근 지정자를 private 로
	private LunchDao() {
		
	}
	
	//자신의 참조값을 리턴해주는 static public(공개) 메소드
	public static LunchDao getInstance() {
		//만일 최초의 호출이라면
		if(dao==null) {
			dao=new LunchDao();
		}
		return dao;
	}
	
	// 메뉴 리스트 보여주기
	public List<LunchDto> getList(){
		List<LunchDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT num, menu, loc, review"
					+ " FROM lunch"
					+ " ORDER BY num asc";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.

			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			//반복문 돌면서 
			while (rs.next()) {
				//LunchDto 객체에 정보를 담기
				LunchDto dto = new LunchDto();
				dto.setNum(rs.getInt("num"));
				dto.setMenu(rs.getString("menu"));
				dto.setLoc(rs.getString("loc"));
				dto.setReview(rs.getString("review"));
				list.add(dto);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection 객체의 close() 메소드를 호출하면 Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		return list;
	}
	
	//메뉴 추가
	public boolean insert (LunchDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "INSERT INTO lunch"
					+ " (num,menu,loc,review)"
					+ " VALUES(lunch_seq.NEXTVAL,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 내용이 있으면 바인딩
			pstmt.setString(1, dto.getMenu());
			pstmt.setString(2, dto.getLoc());
			pstmt.setString(3, dto.getReview());
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//메뉴 하나 리턴해주는 메소드
	public LunchDto getData(int num) {
		LunchDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT num,menu,loc,review"
					+ " FROM lunch"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.
			pstmt.setInt(1, num);
			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			//반복문 돌면서 
			if (rs.next()) {
				dto = new LunchDto();
				dto.setNum(num);
				dto.setMenu(rs.getString("menu"));
				dto.setLoc(rs.getString("loc"));
				dto.setReview(rs.getString("review"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection 객체의 close() 메소드를 호출하면 Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	//메뉴 수정 메소드
	public boolean update(LunchDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "UPDATE lunch"
					+ " SET menu=?, loc=?, review=?"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 내용이 있으면 바인딩
			pstmt.setString(1, dto.getMenu());
			pstmt.setString(2, dto.getLoc());
			pstmt.setString(3, dto.getReview());
			pstmt.setInt(4, dto.getNum());
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//메뉴 삭제 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "DELETE from lunch"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 내용이 있으면 바인딩
			pstmt.setInt(1, num);
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
}
