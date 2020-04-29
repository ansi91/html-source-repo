<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapCommonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlMapCommonDao cDao = new SqlMapCommonDao();
	
	String req = request.getParameter("sigu");
	Map<String,Object> pmap = new HashMap<>();
	pmap.put("sigu",req);
	List<Map<String,Object>> donglist = cDao.getDONGList(pmap);	

	
%>    
    
    
<select id="i_dong" width="100px">
	<option value="선택">선택</option>
	<%
	for(int i=0; i<donglist.size();i++){
		Map<String,Object> rmap = donglist.get(i);
	
%>	
	<option value='<%=rmap.get("DONG")%>'><%=rmap.get("DONG") %></option>		
<%
	}
%>
</select>



</script>