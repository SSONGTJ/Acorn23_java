package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	// 자신의 참조값을 저장할 필드
	public static CafeDao dao;
	/*
	 *  static 메소드는 생성자를 호출하지 않고 클래스명으로 바로 호출을 하기 때문에
	 *  메소드 호출전에 무언가 준비 작업을 하고 싶다면 static 블럭 안에서 하면 된다.
	 *  static 블럭은 해당클래스를 최초로 사용할때 한번만 실행되기 때문에
	 *  초기화 작업을 하기에 적당한 블럭이다.
	 */
	static {
		//객체를 생성해서 static 필드에 저장해 두면 
		dao=new CafeDao();
	}
	//외부에서 객체생성하지 못하도록
		private CafeDao() {}
		
	//static 메소드 
	public static CafeDao getInstance() {
		//여기서 리턴해주는 값은 null 이 아니다 
		return dao;
	}
	
	//업로드된 파일의 정보를 DB 에 저장하는 메소드
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "INSERT INTO board_cafe"
					+ "	(num, writer, title, content, viewCount, regdate)"
					+ "	VALUES (board_cafe_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 내용이 있으면 바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getViewCount());
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
	//파일 목록을 리턴해주는 메소드
	public List<CafeDto> getList(){
		List<CafeDto> list = new ArrayList<CafeDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT num, writer, title, content, viewCount, regdate"
					+ "	FROM board_cafe"
					+ " ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.

			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			//반복문 돌면서 
			while (rs.next()) {
				CafeDto dto = new CafeDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
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
	//페이징
	public List<CafeDto> getList(CafeDto dto){
		List<CafeDto> list = new ArrayList<CafeDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT * FROM (SELECT result1.*, ROWNUM AS rnum"
					+ " FROM (SELECT num, writer, title, content, viewCount, regdate"
					+ " FROM board_cafe ORDER BY num DESC) result1)"
					+ " WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			//반복문 돌면서 
			while (rs.next()) {
				CafeDto tmp = new CafeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setContent(rs.getString("content"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
				list.add(tmp);
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
	//파일 하나의 정보를 리턴해주는 메소드
	public CafeDto getData(int num) {
		CafeDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT num, writer, title, content, viewCount, regdate"
					+ "	FROM board_cafe"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.
			pstmt.setInt(1, num);
			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			//만일 select 된 row 가 있다면 
			if(rs.next()) {
				dto = new CafeDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
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
	//수정문
	public boolean update(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "UPDATE board_cafe"
					+ "	SET title = ?, content = ?"
					+ "	WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 내용이 있으면 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
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
	
	
	//파일 하나의 정보를 DB 에서 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "DELETE FROM board_cafe"
					+ " WHERE num = ?";
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
	// 전체 개수를 리턴해주는 메소드
	public int getCount() {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT MAX(ROWNUM) AS count"
					+ " FROM board_cafe";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.
			
			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			//만일 select 된 row 가 있다면 
			if (rs.next()) {
				count = rs.getInt("count");
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
		return count;
	}
	//조회수 증가 메소드
	public int increaseViewCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "UPDATE board_cafe"
					+ " SET viewCount = viewCount +1"
					+ "	WHERE num = ?";
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
		return rowCount;
	}
}
