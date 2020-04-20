<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%!//디클러레이션 - 전역변수이다 
		//싱글톤으로 관리 (서블릿 -newsData.jsp.java=>HttpServlet 이 객체는 계속 유지됨 - 새로고침 해도...)
		int x=1;
		public String newsList(String news[]){
			//자바성능튜닝팀 지적사항 - 삼성SDS
			StringBuilder sb = new StringBuilder();
			sb.append("<table width='550px' border='1px'>");
			sb.append("<tr><td>"+news[0]+" > "+news[1]+ "</td></tr>");
			sb.append("</table>");
			return sb.toString();
		}
	%>
    <%
    		String news1 []  = {"연합뉴스","김종인 나 갖고 이래라 저래라 말라…그 당에 관심 없다"};
        	String news2[]  = {"연합뉴스","여, 재난지원금 전국민 지급 밀어붙이기…3조원 국채 발행"};
        	String news3 []  = {"연합뉴스","세월호 구조실패 김석균 전 해경청장 과실 없다"};
        	String news4 []  = {"연합뉴스","코로나19 확진자 13명 늘어 1만674명…서울 0명"};
        	String news5 []  = {"연합뉴스","전광훈 56일만에 보석 석방…집회금지 조건"};
        	
        	//화면에 내보내 질 코드 담기
        	
        	String datas = "";
        	switch(x){
        	case 1:
        			datas=newsList(news1);
    		    	x++;
    				break;
    	case 2:
    		datas = newsList(news2);
    		x++;
    		break;
    	case 3:
    		datas = newsList(news3);
    		x++;
    		break;
    	case 4:
    		datas = newsList(news4);
    		x++;
    		break;
    	case 5:
    		datas = newsList(news5);
    		x = 1;
    		break;
    	}
    	out.print(datas);
    %>
    