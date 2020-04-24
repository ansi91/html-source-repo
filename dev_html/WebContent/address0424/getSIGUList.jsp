<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapCommonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlMapCommonDao cDao = new SqlMapCommonDao();
	
	String req = request.getParameter("zdo");
	Map<String,Object> pmap = new HashMap<>();
	pmap.put("zdo",req);
	List<Map<String,Object>> sigulist = cDao.getSIGUList(pmap);	

	
%>    
    
    
<select id="i_sigu" width="100px">
	<option value="선택">선택</option>
	<%
	for(int i=0; i<sigulist.size();i++){
		Map<String,Object> rmap = sigulist.get(i);
	
%>	
	<option value='<%=rmap.get("SIGU")%>'><%=rmap.get("SIGU") %></option>		
<%
	}
%>
</select>