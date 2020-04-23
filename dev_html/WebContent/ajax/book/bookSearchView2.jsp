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
    function choSeongAccount(str){
		    var cho = [
				"ㄱ","ㄲ","ㄴ","ㄷ","ㄸ",
				"ㄹ","ㅁ","ㅂ","ㅃ","ㅅ",
				"ㅆ","ㅇ","ㅈ","ㅉ","ㅊ",
				"ㅋ","ㅌ","ㅍ","ㅎ"	];
				
			var code;
			var result="";//ㅈㅂ를 반환하는 변수 
			//	alert(str.charCodeAt());
			for(i=0;i<str.length;i++){
			code = str.charCodeAt(i)-44032;
			//$('#d_msg').append(code+" ");
			if(code > -1 && code <11172) result+=cho[Math.floor(code/588)];
			}
			 return result; 
    }
    
    function clearMethod(){
    	$('#d_search').css("backgroundColor","#FFFFFF");
    	$('#d_search').css("border","none");
    	$('#d_search').html("");
    }
    
    
    </script>
    <style type="text/css">
    	.listIn {background : #CCFFFF;}
    	.listOut {background : #FFFFFF;}
    	#d_search{ position:absolute; background:yellow; border:1px solid black;}
    </style>
</head>
<body>
<input id="book_title" class="easyui-textbox" style="width:500px"/>
<div id="d_search">조회결과 처리화면 </div>
<div id="d_detail2">mouseover 처리화면2 </div>
<div id="d_detail3">mouseover 처리화면3 </div>
<script type="text/javascript">
	$(document).ready(function (){
		var t = $('.textbox-f');
		t.textbox('textbox').bind('keyup', function(e){
			//초성 검색 구분
			if(v_word !="" && choKeyword==""){
				choMode = "Y";
			}else{
				choMode = "N";
			}
			//alert("choMode:" + choMode);
			var v_word = $('#_easyui_textbox_input1').val().toUpperCase();
			var choKeyword = choSeongAccount(v_word);
			var p_word = $('#_easyui_textbox_input1').val();
			var param="book_title="+p_word+"&choMode="+choMode;
			$.ajax({
				method:"post"
				,url:"htmlbookList.jsp"
				,data:param
				,success:function(result){
					/* alert("result:" + result); */
					
					$('#d_search').css("background","MistyRose");
					$('#d_search').css("width",$('.textbox').width()+"px");
					$('#d_search').css("top",$('#_easyui_textbox_input1').offset().top+$('#_easyui_textbox_input1').offset().bottom+"px");
					$('#d_search').css("left",$('#_easyui_textbox_input1').offset().left+"px");
					$('#d_search').html(result); //htmlBookList.jsp 페이지 내용=>result
					  var tds = document.getElementsByTagName("td");//array전환
					for(var i=0; i<tds.length;i++){
						tds[i].onmouseover = function(){
							var b_no = $(this).attr('id');
						
							var targetURL=''
								if("1"==$(this).attr("id")){
									targetURL='bookSearchDetail.jsp';
								}else if("2"==$(this).attr("id")){
									targetURL='bookSearchDetail2.jsp';
								}
							$.ajax({
								url:targetURL
								,method:"get"
								,success:function(result){
									alert("집에 가고 싶다");
									/* if("1"==$(this).attr("id")){
										$('#d_detail2').html().val();
									}else if("2"==$(this).attr("id")){
										$('#d_detail3').html().val(); */
								}
							});
						
							tds[i].onmouseout = function(){
								clearMethod();
							}
							tds[i].onclick = function(){
								$('#_easyui_textbox_input1').val($(this).text());
									clearMethod();
							}
						}
					}
				}
				,error:function(xhrObject){
					alert(xhrObject.responseText);
				}
							
			});
		}); //end of keyup
	});
</script>


</body>
</html>