package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friends")
public class FriendsServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// 응답 인코딩 설정
			resp.setCharacterEncoding("utf-8");
			//응답 컨텐트 설정
			resp.setContentType("text/html; charset=utf-8");
			//요청을 한 클라이언트에게 문자열을 출력할 수 있는 객체의 참조값 얻어내기
			PrintWriter pw=resp.getWriter();
			pw.println("<!doctype html>");
			pw.println("<html>");
			pw.println("<head>");
			pw.println("<meta charset='utf-8'>");
			pw.println("<title> 오늘의 운세 페이지</title>");
			pw.println("</head>");
			pw.println("<body>");
			
			// 클라이언트에게 응답할 친구의 목록이 List 객체에 들어 있다고 가정하자
			List<String> list = new ArrayList<>();
			list.add("김구라");
			list.add("해골");
			list.add("원숭이");
			
			pw.println("<ul>");
			//여기에서 li 요소를 이용해서 친구 목록을 응답해 보세요.
			for (int i=0;i<list.size();i++) {
				pw.println("<li>"+list.get(i)+"</li>");
			}
			
			
//			pw.println("<li>김구라</li>");
//			pw.println("<li>해골</li>");
//			pw.println("<li>원숭이</li>");
			pw.println("</ul>");
			pw.println("</body>");
	}
}
