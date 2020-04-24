package orm.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapDeptDao {
	SqlSessionFactory sqlMapper = null;
	
	public List<Map<String,Object>> deptList(){
		List<Map<String,Object>> dlist = new ArrayList<>();
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			dlist = sqlSes.selectList("deptList");
			System.out.println("조회한 row 수" +dlist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dlist; 
	}
	public static void main(String[] args) {
		SqlMapDeptDao sd = new SqlMapDeptDao();
		sd.deptList();
	}
}
