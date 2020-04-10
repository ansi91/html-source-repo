<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="jeasyui.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
	MemberDAO mDao = new MemberDAO();
	List<Map<String, Object>> mlist = null;
		//mlist = mDao.memberList();
		mlist = mDao.procMemberList(); //리턴 결과를 리스트에 넣어준다
		 Gson g = new Gson();
		 String imsi = g.toJson(mlist);
		 out.print(imsi);
    
    %>