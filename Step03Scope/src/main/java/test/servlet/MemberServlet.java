package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dto.MemberDto;
@WebServlet("/member")
public class MemberServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원 한명의 정보를 얻어오는 비즈니스 로직수행
		MemberDto dto=new MemberDto(1, "김구라", "노량진");
		
		// 위의 회원정보를 /test/member.jsp 페이지에서 응답하도록 프로그래밍 해 보세요.
		
		req.setAttribute("memberlist", dto);

		// webapp/test/fortune.jsp 페이지로 응답을 위임할 수 있는 요청전달자 객체 얻어내기
		RequestDispatcher rd = req.getRequestDispatcher("/test/member.jsp");
				
		// 응답 위임하기
		rd.forward(req, resp);
	}
}
