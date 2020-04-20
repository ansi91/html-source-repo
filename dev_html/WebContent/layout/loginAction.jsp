<%@page import="project.restaurant.RestaurantDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 	
 	String mem_id = request.getParameter("mem_id");
 	String mem_pw = request.getParameter("mem_pw");
 	System.out.println( "asd:" + mem_id);
 	RestaurantDao rdao = new RestaurantDao();
 	String msg = rdao.login(mem_id, mem_pw);
 	out.print(msg);
 %>