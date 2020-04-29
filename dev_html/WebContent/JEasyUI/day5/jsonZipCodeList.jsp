<%@page import="orm.dao.SqlMapCommonDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String dong = request.getParameter("dong");

	SqlMapCommonDao smcd = new SqlMapCommonDao();
	Map<String,Object> pmap = new HashMap<>();
	pmap.put("dong",dong);
	List<Map<String,Object>> zlist = smcd.getZIPCODEList(pmap);
	Gson g = new Gson();
	String imsi = g.toJson(zlist);
	out.print(imsi);
%>
