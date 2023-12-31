package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 오늘의 운세를 얻어오는 비즈니스 로직을 수행 ( DB에서 읽어왔다고 가정 )
		String fortune = "동쪽으로 가면 귀인을 만나요!";
		
		/*
		 * 	HttpServletRequest 객체의 setAttribute(key,value) 메소드를 이용해서 응답에 필요한 데이터를 담아둘 수 있다.
		 * 	담은 데이터는 응답하기 전까지 유효하며 응답을 마친 이후에는 없어지는 1회성 데이터이다.
		 * 	담은 데이터를 얻어내는 방법은
		 * 	HttpServletRequest 객체의 getAttribute(key) 메소드를 활용하면 된다.
		 * 	단, 담을 때는 Object type 으로 받아주기 때문에 어떤 type 이든 담을 수 있지만
		 * 	얻어낼 때도 역시 Object type 으로 return 되기 때문에 원래 type 을 기억하고 있다가
		 * 	casting 하는 것이 필요하다.
		 * 
		 * 	예를 들어 "fortuneToday" 라는 key 값으로 String type 을 담았다면
		 * 	얻어낼 때는 아래와 같은 code 가 된다.
		 * 
		 * 	String a = (String)request.getAttribute("fortuneToday");
		 */
		
		
		
		// .setAttribute(key, value)
		req.setAttribute("fortuneToday", fortune);
		
		// webapp/test/fortune.jsp 페이지로 응답을 위임할 수 있는 요청전달자 객체 얻어내기
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp");
		
		// 응답 위임하기
		rd.forward(req, resp);
	}
}
