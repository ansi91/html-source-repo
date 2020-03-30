package com.dept;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBConnectionMgr;

public class DeptDao {
  DBConnectionMgr	dbMgr =null;
   Connection 			con = null;
  PreparedStatement pstmt = null;
  ResultSet				 rs = null;
  
	public List<Map<String,Object>> deptList(){
		dbMgr = DBConnectionMgr.getInstance();
		List<Map<String,Object>> dlist = null;
		StringBuilder sql = new StringBuilder();
		try {
				sql.append("SELECT deptno, dname, loc FROM dept");
				con = dbMgr.getConnection();
				pstmt = con.prepareStatement(sql.toString());
				rs = pstmt.executeQuery(); //executeUpdate 입력 수정 삭제 할때만 // 테이블 생성할땐 execute
				//파싱-DBMS 실행계획 - 옵티마이저 - open... fetch 램에 상주 시키고 Close 한다.
				//세개 로우는 Map에 담고 여러개의 로우는 List에 담는다
				dlist = new ArrayList<>();
				Map<String, Object> rMap = null;
				while(rs.next()) {
					rMap = new HashMap<>();
					rMap.put("deptno", rs.getInt("deptno"));
					rMap.put("dname", rs.getString("dname"));
					rMap.put("loc", rs.getString("loc"));
					dlist.add(rMap); //컬럼 3개가, 로우 한개가
					System.out.println(rMap.get("dname"));
				}
				System.out.println(dlist.size());
		} catch (SQLException se) {
			System.out.println(se.toString());
		}catch (Exception e) {
			System.out.println(e.toString());
			
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		
		
		return dlist;
	}
	

	public List<DeptVO> deptVOList(){
		List<DeptVO> dlist = null;
		StringBuilder sql = new StringBuilder();
		DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
		try {
				sql.append("SELECT deptno, dname, loc FROM dept");
				con = dbMgr.getConnection();
				pstmt = con.prepareStatement(sql.toString());
				rs = pstmt.executeQuery(); //executeUpdate 입력 수정 삭제 할때만 // 테이블 생성할땐 execute
				//파싱-DBMS 실행계획 - 옵티마이저 - open... fetch 램에 상주 시키고 Close 한다.
				//세개 로우는 Map에 담고 여러개의 로우는 List에 담는다
				dlist = new ArrayList<>();
				DeptVO dVO =null;
				while(rs.next()) {
					dVO = new DeptVO();
					dVO.setDeptno(rs.getInt("deptno"));
					dVO.setDname(rs.getString("dname"));
					dVO.setLoc(rs.getString("loc"));
					dlist.add(dVO);
				}
				System.out.println(dlist.size());
		} catch (SQLException se) {
			System.out.println(se.toString());
		}catch (Exception e) {
			System.out.println(e.toString());
			
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		
		return dlist;
	}
	
}
