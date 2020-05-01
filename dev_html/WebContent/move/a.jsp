<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a.jsp-[시작페이지]</title>
<script type="text/javascript" src="../JEasyUI/day6/commons.js"></script>
<%@include file="../JEasyUI/day5/JeasyUICommon.jsp" %>
<script type="text/javascript">
	function move(){
		cmm_window_popup('./b.jsp','500','350','b');
	}
</script>
</head>
<body>

내용
<button onclick="move()">호출</button>
</body>
<!--
자바스크립트에서 제공하는 내장 객체가 있다.
document.write();
location.href="a.jsp";
window.open(r);

  -->
</html>
