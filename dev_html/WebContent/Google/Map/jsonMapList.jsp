<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="project.restaurant.RestaurantDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%--스크립틀릿 -자바 코드를 쓸수 있다. --%>
<% 
		RestaurantDao rDao = new RestaurantDao();
		List<Map<String,Object>> mrList = rDao.mapRestList();
		Gson g = new Gson();
		String imsi = g.toJson(mrList);
	//	out.print(mrList); <- JSON 형식이 아님
		out.print(imsi);

%>