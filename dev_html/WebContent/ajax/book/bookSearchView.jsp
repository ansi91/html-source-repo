<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>도서 검색 서비스</title>
	<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
    	function test(){
    		alert("안녕하세요");
    	}
    </script>
    <style type="text/css">
    	.textbox {margin-left:700px;}
    	#d_search{ position:absolute; background:yellow;}
    </style>
</head>
<body>
<input id="book_title" class="easyui-textbox" />
<div id="d_search"></div>
<script type="text/javascript">
	$(document).ready(function(e){
		$('#d_search').hide();
		$('#book_title').textbox({
			iconCls:'icon-search'
			,width:'500px'
			,cls:'booksearch'
			
		});
	}).bind('keydown',function(){
			$('#d_search').show();
			$('#d_search').text('hi');
			$('#d_search').css("width",$('.textbox').width()+"px");
			$('#d_search').css("left",$('.textbox').offset().left+"px");
			$('#d_search').css("height",300+"px");
	});
</script>

</body>
</html>