<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<!--가 - 44032 나 - 45208   자바 7056 4116 21*18 = 378 -->
<div id="d_msg"></div>
<script type="text/javascript">
	function choSeongAccount(str){ 
		var cho = [
						"ㄱ","ㄲ","ㄴ","ㄷ","ㄸ",
						"ㄹ","ㅁ","ㅂ","ㅃ","ㅅ",
						"ㅆ","ㅇ","ㅈ","ㅉ","ㅊ",
						"ㅋ","ㅌ","ㅍ","ㅎ"
							];
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
	var a= choSeongAccount("웹프로그래밍");
	alert("a:"+a)
</script>

</body>
</html>