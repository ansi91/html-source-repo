<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String empnoArr = request.getParameter("empno");
		String empnos[] = null;
		if(empnoArr!=null){
			empnos = empnoArr.split(",");
		}
	

	int result=0;
	SqlMapEmpDao eDao = new SqlMapEmpDao();
	result=eDao.empDEL(empnos); //jsp -> Dao -> mybatis -> oracle로 가는 갈림길
	out.print("result"+result);
	
	if(result>0){ //등록 성공 했을때
		response.sendRedirect("EmpManager8.jsp?mode=update"); //페이지 열리기전 db를 경유함
	}else{
		response.sendRedirect("EmpInsertFail.jsp"); //페이지 열리기전 db를 경유함
	}
%>