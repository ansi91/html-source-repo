<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="java.util.Map, java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>
   
    <%--
		이름 : mem_name
		주소 : mem_addr
		전화번호 : mem_tel
		jsp 주석이다 소스보기에 안보임 
    --%>
   
    <%
   
    	
    	List<Map<String,Object>> mlist = new ArrayList<>();
    	Map<String,Object> rmap = new HashMap<>();
    	rmap.put("mem_name", "홍길동");
    	rmap.put("address","인천시 부평구 부평동");
    	rmap.put("tel", "010-1234-5678");
    	mlist.add(rmap);
    	
		rmap = new HashMap<>();
    	rmap.put("mem_name", "김유신");
    	rmap.put("address","서울시 영등포구 당산동");
    	rmap.put("tel", "010-2134-2134");
    	mlist.add(rmap);
    	
    	rmap = new HashMap<>();
    	rmap.put("mem_name", "김갑환");
    	rmap.put("address","서울시 금천구 가산동");
    	rmap.put("tel", "010-7777-7777");
    	mlist.add(rmap);
    	
    	Gson g = new Gson();
    	String imsi = g.toJson(mlist);
    	out.print(imsi);
    	
%>