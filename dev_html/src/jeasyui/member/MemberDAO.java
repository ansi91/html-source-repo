package jeasyui.member;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import com.util.DBConnectionMgr;
/*
 * DML(기본) - 프로시저 - MyBatis[ORM솔루션 30%이상 줄어듬 -반복되는 코드가 줄어듦 - 일괄수정처리
 */

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;
public class MemberDAO {
	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	Connection con =null;
	PreparedStatement pstmt = null;
	CallableStatement cstmt =   null;//프로시저 전담요원 -REFCURSOR 
	OracleCallableStatement ocstmt = null;
	ResultSet rs = null;
	//회원목록 실습1 SELECT
	public List<Map<String,Object>> memberList(){
		List<Map<String,Object>> mlist = null;
		Map<String, Object> rMap = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT mem_no, mem_id, mem_pw, mem_name, zipcode, mem_addr, mem_email FROM member_t");
		try {
			con = dbMgr.getConnection();
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			
			mlist = new ArrayList<>();
			while(rs.next()) {
				rMap = new HashMap<>();
				rMap.put("mem_no", rs.getInt("mem_no"));
				rMap.put("mem_id",rs.getString("mem_id"));
				rMap.put("mem_pw", rs.getString("mem_pw"));
				rMap.put("mem_name", rs.getString("mem_name"));
				rMap.put("zipcode",rs.getString("zipcode"));
				rMap.put("mem_addr",rs.getString("mem_addr"));
				rMap.put("mem_email",rs.getString("mem_email"));
				mlist.add(rMap);
			}
		} catch (SQLException se) {
			System.out.println("[Exception]" + sql.toString());
		}catch (Exception e) {
				e.printStackTrace();
		}finally {
			try {
				dbMgr.freeConnection(con, pstmt, rs);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return mlist;
	}
	
	//회원목록 실습2 PROCEDURE
	public List<Map<String,Object>> procMemberList(){
		List<Map<String, Object>> plist = new ArrayList<>();
		try {
			//DBConnectionMgr 공통코드를 작성했으므로 드라이버명, 계정정보, orcl11[SID]생략
			con = dbMgr.getConnection();
			cstmt = con.prepareCall("{call proc_memberList(?)}");
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute(); //프로시저 처리 요청 메소드 호출
			//오라클에서만 제공되는 REFCURSOR이므로 오라클에서 제공하는 인터페이스로 형전환하기
			ocstmt = (OracleCallableStatement)cstmt;
			rs = ocstmt.getCursor(1);
			Map<String, Object> rmap= null;
			while(rs.next()) {
				rmap = new HashMap<String, Object>();
				rmap.put("mem_no",rs.getInt("mem_no"));
				rmap.put("mem_id",rs.getString("mem_id"));
				rmap.put("mem_pw", rs.getString("mem_pw"));
				rmap.put("mem_name", rs.getString("mem_name"));
				rmap.put("zipcode",rs.getString("zipcode"));
				rmap.put("mem_addr",rs.getString("mem_addr"));
				rmap.put("mem_email",rs.getString("mem_email"));
				plist.add(rmap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return plist;
	}
	
	public static void main(String[] args) {
		MemberDAO mDao = new MemberDAO();
		List<Map<String, Object>> mlist = null;
			//mlist = mDao.memberList();
			mlist = mDao.procMemberList();
		if (mlist!=null) { 
				System.out.println("mlist :" + mlist.size());
				for (Map<String, Object> m : mlist) {
						for (String s: new TreeSet<String>(m.keySet() ) ) {
							System.out.print(s + " = " + m.get(s) + ", ");
						}
						System.out.println();
				}
		}

	}

}
