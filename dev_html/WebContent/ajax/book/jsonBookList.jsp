<%@page import="com.vo.BookVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="orm.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String book_title = request.getParameter("book_title");
	BookDAO bDao = new BookDAO();
	Map<String,Object> bmap = new HashMap<>();
	bmap.put("book_title",book_title);
	List<Map<String,Object>> elist = bDao.bookList(bmap);
	Gson g = new Gson();
	String imsi = g.toJson(elist);
	out.print(imsi);
%>
