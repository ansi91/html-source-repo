package orm.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class BookDAO {
	Logger logger = Logger.getLogger(BookDAO.class);
	SqlSessionFactory sqlMapper = null;
	
	/***************************************************************
	 * @param pmap - 사용자가 자동완성 textbox에 입력한 도서제목 정보
	 * @return - 사용자가 입력한 도서정보를 선분조건(LIKE패턴)으로 검색하여 결과 반환
	 ***************************************************************/
	//Logger.info("book_title:"+pmap.get("book_title"));
	public List<Map<String,Object>> bookList(Map<String,Object> pmap){
		//25번에서는 선언만 되어있다 따라서 검색결과가 존재하지 않을 경우 NullPointerException의 원인이 될 수도 있다.
		//가급적이면 에러를 피해 갈 수 있도록 코딩을 전개한다.
		List<Map<String, Object>> blist = new ArrayList<>();
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader  = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			blist = sqlSes.selectList("bookList",pmap);
			System.out.println("조회한 row 수" + blist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return blist;
	}

}
