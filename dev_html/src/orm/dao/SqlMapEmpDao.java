package orm.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;




public class SqlMapEmpDao {
	Logger logger = Logger.getLogger(SqlMapEmpDao.class); 
	SqlSessionFactory sqlMapper = null;
	public List<Map<String,Object>> empList(Map<String,Object> pmap){
		logger.info("empList 호출성공");

		/*
			logger.debug("empList 호출성공");
			logger.warn(message);
			logger.error(message); 
			logger.fatal(message);
		 */
		List<Map<String,Object>> elist = new ArrayList<Map<String,Object>>();
		
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			elist = sqlSes.selectList("empList",pmap);
			System.out.println("조회한 row 수" + elist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return elist;
	}
	
	public static void main(String[] args) {
		SqlMapEmpDao smed = new SqlMapEmpDao();
		smed.empList(null);
	}
}
