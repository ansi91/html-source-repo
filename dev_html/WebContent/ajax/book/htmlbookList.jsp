<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="orm.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String book_title =request.getParameter("book_title");
	String choMode = request.getParameter("choMode");
//	out.print(book_title+", "+choMode);
	BookDAO bDao = new BookDAO();
	Map<String,Object> pmap = new HashMap<>();
	pmap.put("book_title", book_title);
	pmap.put("choMode",choMode);
	List<Map<String,Object>> blist = bDao.bookList(pmap);

	
%>

<table border="1px" borderColor="red">
<%
	if(blist==null){
%>

	<tr>

		<td>조회결과가 없습니다</td>
	</tr>
	<%}else{
	
			for (int i=0; i < blist.size(); i++){
					 pmap = blist.get(i);
					 
		%>
	<tr>
		<!--<td  ></td -->
		<td id='<%=pmap.get("BOOK_NO")%>' width="249px"><img src=' <% out.print(pmap.get("BOOK_NO")); %>.jpg' width="150px" height="150px"/></td>
		<td width="249px"><% out.print(pmap.get("BOOK_TITLE")); %><br>
			  <% out.print(pmap.get("BOOK_PRICE")); %>원<br>
			 <% out.print(pmap.get("BOOK_AUTHOR")); %><br>
		</td>
		
	</tr>
	<%
		}
	}
			
	%>
	
</table>