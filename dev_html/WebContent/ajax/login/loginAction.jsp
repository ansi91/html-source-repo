<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%
	String u_id  = request.getParameter("mem_id");
	String u_pw  = request.getParameter("mem_pw");
	String db_id = "test";
	String db_pw = "123";
	String db_name =null;
	
	if(db_id.equals(u_id)){ // 아이디가 존재하니?
		if(db_pw.equals(u_pw)){ //비밀번호는?
				db_name="이순신";
			}else{
				db_name = "비번이 틀렸습니다.";
			}
		}else{
		db_name = "아이디가 없습니다.";
 		}
	
	out.print(db_name);		
	

	

	
%>
