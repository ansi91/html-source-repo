<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int empno=0;
	String ename = "";
	String job = "";
	int mgr	=0;
	String hiredate = "";
	double sal =0.0;
	double comm = 0.0;
	int deptno =0;
	if(request.getParameter("empno")!=null){
		empno = Integer.parseInt(request.getParameter("empno"));
	}
	

		ename = request.getParameter("ename");
		job	  = request.getParameter("job");
		
	
		hiredate = request.getParameter("hiredate");
	
	
	if(request.getParameter("sal")!=null){
		sal = Double.parseDouble(request.getParameter("sal"));
	}
	
	if(request.getParameter("comm")!=null){
		comm = Double.parseDouble(request.getParameter("comm"));
	}
	
	if(request.getParameter("deptno")!=null){
		deptno = Integer.parseInt(request.getParameter("deptno"));
	}
	SqlMapEmpDao eDao = new SqlMapEmpDao();
	int result=0;
	Map<String,Object> pmap = new HashMap();
	pmap.put("empno", empno);
	pmap.put("ename", ename);
	pmap.put("job", job);
	pmap.put("hiredate", hiredate);
	pmap.put("sal", sal);
	pmap.put("comm", comm);
	pmap.put("deptno", deptno);
	result=eDao.empUPD(pmap); //jsp -> Dao -> mybatis -> oracle로 가는 갈림길
	out.print("result"+result);
	
	if(result==1){ //등록 성공 했을때
		response.sendRedirect("EmpManager8.jsp?mode=update"); //페이지 열리기전 db를 경유함
	}else{
		response.sendRedirect("EmpInsertFail.jsp"); //페이지 열리기전 db를 경유함
	}
%>