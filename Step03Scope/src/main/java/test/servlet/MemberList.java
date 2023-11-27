package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dto.MemberDto;

@WebServlet("/member/list")
public class MemberList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDto mem1 = new MemberDto (1, "김구라", "노량진");
		MemberDto mem2 = new MemberDto (1, "해골", "행신동");
		MemberDto mem3 = new MemberDto (1, "원숭이", "동물원");
		
		List<MemberDto> list = new ArrayList<MemberDto>();
		list.add(mem1);
		list.add(mem2);
		list.add(mem3);
		
		//webapp/member/list.jsp 페이지에서 회원목록을 table 요소를 이용해서 출력해하도록 해 보쇼.
		
		req.setAttribute("list", list);
		RequestDispatcher rd = req.getRequestDispatcher("/member/list.jsp");
		rd.forward(req, resp);
	}
}
