<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<%!
	SqlMapEmpDao smed = new SqlMapEmpDao();
	List<Map<String,Object>> elist = smed.empList(null);
%>
<table border="1px" borderColor="red">
<%
	if(elist==null){
		
	
%>

	<tr>

		<td>조회결과가 없습니다</td>
	</tr>
	<%}else{
	
			for (int i=0; i < elist.size(); i++){
					Map<String,Object> rmap = elist.get(i);	
		%>
	<tr>
	
		<td><% out.print(rmap.get("ENAME")); %></td>
	
	</tr>
	<%
		}
	}
			
	%>
	
</table>
