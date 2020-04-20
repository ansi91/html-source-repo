package example;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class NowServlet extends HttpServlet {
	@Override
		public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
				req.setCharacterEncoding("utf-8");
				res.setContentType("text/html;charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println("<html>");
				out.println("<head><title>현재시간</title></head>");
				out.println("<body>");
				out.println("현재 시간은");
				out.println(new Date());
				out.println(req.getParameter("name"));
				out.println("</body></html>");
		}
	
}
/*
 * 클라이언트측에서 서버에 요청하기
 * 1. location.href="a.html"
 * 
 * 2. form 전송으로 요청한다
 * <form>
 *  	<input type="text" name="mem_id">
 *  </form>
 *  3. $.ajax({url: "xxx.jsp"});
 *  
 *  4)fetch(url, function(){
 *  {);
 *  
 *  5) servlet 처리하기
 */