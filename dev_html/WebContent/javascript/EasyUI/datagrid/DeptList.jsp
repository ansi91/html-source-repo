<%@page import="com.dept.DeptVO"%>
<%@page import="com.dept.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DeptDao ddao = new DeptDao(); //json 파일은 html주석 쓰면 에러남 
//	java.util.List<java.util.Map<String,Object>> dlist = null;
	java.util.List<DeptVO> dlist = null;
	//dlist = ddao.deptList();
	dlist = ddao.deptVOList();
	com.google.gson.Gson g = new com.google.gson.Gson();
	String imsi = g.toJson(dlist);
	out.println(imsi);
	
%>