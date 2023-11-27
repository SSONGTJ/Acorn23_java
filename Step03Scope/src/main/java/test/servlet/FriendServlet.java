package test.servlet;
/*
 * 	/friend/list 요청이 왔을 때 요청을 처리할 서블릿을 만들어 보세요.
 * 	- 친구 이름은 3개입니다. "김구라" "해골" "원숭이"
 *  - 친구 이름을 출력해 줄 jsp 페이지는 /test/friend.jsp 페이지 입니다.
 *  - 친구 이름을 ul, li 요소를 이용해서 목록 출력을 해보쇼
 */
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class FriendServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<String> list = new ArrayList<>();
		list.add("김구라");
		list.add("해골");
		list.add("원숭이");
		
		req.setAttribute("friendsList", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("/test/friend.jsp");
		
		rd.forward(req, resp);
	}
}
