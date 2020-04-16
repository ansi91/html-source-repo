<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	화면이 없어도 단위테스트가 가능해야 함.
	디자이너가 내 페이지를 아직 못 만들었다고 해도 나는 코딩 할 수 있다.
	클래스 쪼개기
	192.168.0.7:8000/dev_html/ajax/pictureInfo.jsp?id=1.jpg 
 --%>
 	
    <%
    
    	String img = request.getParameter("id");
    	//out.print("img:"+img);
    	String imgs[] = {"1.jpg","2.jpg","3.jpg"};
    	String cimg = null;
    	for(int i=0; i<imgs.length; i++){
    		if(img.equals(imgs[i])){
    				cimg = imgs[i];
    		}
    	}
    %>
    <img src="./<% out.print(cimg);%>" width="800px" height="500px">