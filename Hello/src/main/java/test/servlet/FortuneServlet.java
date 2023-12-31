package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *  이 클래스로 생성된 객체가 우리가 download 받아서 사용하고 있는
 *  apache tomcat 서버에서 fortune 요청이 오면 응답을 하는 기능을 수행하고자 한다.
 */

// 3. 어떤 경로 요청에 대해서 이 서블릿이 동작하게 할 것인지 설정
@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet { // 1. 상속
	// 2. service() 메소드 오버라이드
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("오잉?");
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
		
		pw.println("</body>");
		// 오늘의 운세 5개를 미리 준비 해 둔다.
		String[] fortunes= {"동쪽으로 가면 귀인을 만나요.",
				"오늘은 집에만 계쇼.",
				"너무 멀리가지 마소.",
				"오늘은 뭘 해도 되는 날~",
				"로또 사라 마~!"};
		
		 // 랜덤으로 운세 선택
        Random random = new Random();
        int randomIndex = random.nextInt(fortunes.length);
		
        pw.println("<p>오늘의 운세 : <strong>"+fortunes[randomIndex]+"</strong></p>");
		pw.println("</html>");
		pw.close();
	}

}
