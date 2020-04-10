<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록 화면[MemberINS.jsp]</title>
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	function add(){
		var u_pw = $("#mem_pw2").val();
		alert("사용자가 입력한 비밀번호:" + u_pw);
	}
</script>
</head>
<body>
화면처리 영역
<label >사용자가 입력한 비밀번호</label>
<input id="mem_pw2" class="easyui-passwordbox" prompt="Password" iconWidth="27"
	style="width:100%;height:30px; padding:10px">
	<br>
	<button onClick="add()">등록</button>
</body>
</html>