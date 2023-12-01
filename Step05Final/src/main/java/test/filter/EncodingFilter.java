package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/*
 *	요청을 중간에 가로채서 encoding 설정을 해주는 Filter 만들기 
 */

// 이 context 에 들어오는 모든 요청에 대해서 필터링을 수행하겠다는 의미
@WebFilter("/*")
public class EncodingFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("EF동작");
		//1. 만일 인코딩 설정이 되지 않았다면
		if (request.getCharacterEncoding()==null) {
			//post 방식 전송했을 때 한글 깨짐 방지
			request.setCharacterEncoding("utf-8");
		}
		//2. 요청의 흐름 이어가기
		chain.doFilter(request, response);
	}
}
