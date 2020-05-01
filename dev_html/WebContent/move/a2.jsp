<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String mode = request.getParameter("mode");
    	out.print(mode); // update, null;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a2.jsp-[시작페이지]</title>
<script type="text/javascript" src="../JEasyUI/day6/commons.js"></script>
<%@include file="../JEasyUI/day5/JeasyUICommon.jsp" %>
<script type="text/javascript">
	function move(){
		location.href="./b2.jsp";
	}
</script>
</head>
<body>

내용
<button onclick="move()">b2페이지 호출</button>
<br>
다시 돌아온 화면에서 mode값 확인하기 "<%=mode%>"
</body>
<!--
자바스크립트에서 제공하는 내장 객체가 있다.
document.write();
location.href="a.jsp";
window.open(r);

  -->
</html>
