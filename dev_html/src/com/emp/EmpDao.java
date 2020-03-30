package com.emp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConnectionMgr;

public class EmpDao {
DBConnectionMgr 		dbMgr = DBConnectionMgr.getInstance();
Connection 				con 	   =null;
PreparedStatement 	pstmt =null;
ResultSet					rs 		  =null;
	public List<EmpVO> empVOList(){
		List<EmpVO> elist=null;
		con=dbMgr.getConnection();
		StringBuilder sql = new StringBuilder();
		
		try {
			elist= new ArrayList<>();
			sql.append("SELECT empno, ename, job, sal FROM emp");
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			EmpVO eVO = null;
			while(rs.next()) {
				eVO = new EmpVO();
				
				eVO.setEmpno(rs.getInt("empno"));
				eVO.setEname(rs.getString("ename"));
				eVO.setJob(rs.getString("job"));
				eVO.setSal(rs.getInt("sal"));
				elist.add(eVO);
			}
			for(EmpVO e: elist) {
				System.out.println(e.getEmpno()+","+e.getEname()+","+e.getJob()+","+e.getSal());
			}
			System.out.println(elist.size());
		} catch (SQLException se) {
			System.out.println(se.toString());
		}catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		
		return elist;
	}
	
}


/*
 	int [][] a= new int[5][2];
 	a[2] = new int[4];
 	for(int[] j : a){
 		for (int k: j){
 		System.out.println(k);
 	}
*/

