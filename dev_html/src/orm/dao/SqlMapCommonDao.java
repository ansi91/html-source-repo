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

public class SqlMapCommonDao {
	Logger logger = Logger.getLogger(SqlMapDeptDao.class);
	String resource = "orm/mybatis/Configuration.xml";
	SqlSessionFactory sqlMapper = null;
	
	/***************************************
	 * 주소 검색 - 도 정보 조회하기
	 * @param pmap 
	 * @return List<Map<String,Object>>
	 * 2020 04월 24일        작성자 : 강감찬
	 ****************************************/
	public List<Map<String,Object>> getZDOList(Map<String,Object> pmap){
		logger.info("getZDOList 호출 성공" + pmap.size());

		List<Map<String,Object>> zdolist = new ArrayList<Map<String,Object>>();
		
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			zdolist = sqlSes.selectList("getZDOList",pmap);
			System.out.println("조회한 row 수" + zdolist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return zdolist;
	}
	
	
	/***************************************
	 * 주소 검색 - 시,구 정보 조회하기
	 * @param pmap 
	 * @return List<Map<String,Object>>
	 * 2020 04월 24일        작성자 : 강감찬
	 ****************************************/
	public List<Map<String,Object>> getSIGUList(Map<String,Object> pmap){
		logger.info("getSIGUList 호출 성공");
		List<Map<String,Object>> sigulist = new ArrayList<>();
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			sigulist = sqlSes.selectList("getSIGUList",pmap);
			System.out.println("조회한 row 수" + sigulist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sigulist;
		
	}
	
	
	/***************************************
	 * 주소 검색 - 동 정보 조회하기
	 * @param pmap 
	 * @return List<Map<String,Object>>
	 * 2020 04월 24일        작성자 : 강감찬
	 ****************************************/
	public List<Map<String,Object>> getDONGList(Map<String,Object> pmap){
		logger.info("getDONGList 호출 성공");
		List<Map<String,Object>> donglist = new ArrayList<>();
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			donglist = sqlSes.selectList("getDONGList",pmap);
			System.out.println("조회한 row 수" + donglist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return donglist;
		
	}
	
	
	
	public List<Map<String,Object>> getZIPCODEList(Map<String,Object> pmap){
		logger.info("getZIPCODEList 호출 성공");
		List<Map<String,Object>> zipcodelist = new ArrayList<Map<String,Object>>();
		
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			zipcodelist = sqlSes.selectList("zipcodeList",pmap);
			System.out.println("조회한 row 수" + zipcodelist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return zipcodelist;
	}
	
}
