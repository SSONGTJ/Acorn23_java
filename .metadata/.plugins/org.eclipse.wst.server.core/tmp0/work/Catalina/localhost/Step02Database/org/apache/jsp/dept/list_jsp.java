/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.83
 * Generated at: 2023-11-23 06:45:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.dept;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import test.dept.dto.DeptDto;
import java.util.List;
import test.dept.dao.DeptDao;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("test.dept.dao.DeptDao");
    _jspx_imports_classes.add("test.dept.dto.DeptDto");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	//DeptDao 객체의 참조값을 static 메소드를 이용해서 얻어온다.
	List<DeptDto> list = DeptDao.getInstance().getList();

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>/dept/list.jsp</title>\r\n");
      out.write("    <style>\r\n");
      out.write("        body {\r\n");
      out.write("            font-family: 'Arial', sans-serif;\r\n");
      out.write("            margin: 0;\r\n");
      out.write("            padding: 0;\r\n");
      out.write("            background-color: #f5f5f5; /* 연한 그레이 */\r\n");
      out.write("            display: flex;\r\n");
      out.write("            align-items: center;\r\n");
      out.write("            justify-content: center;\r\n");
      out.write("            height: 100vh;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .container {\r\n");
      out.write("            background-color: #ffffff; /* 흰색 */\r\n");
      out.write("            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);\r\n");
      out.write("            border-radius: 15px;\r\n");
      out.write("            overflow: hidden;\r\n");
      out.write("            margin: 20px;\r\n");
      out.write("            padding: 20px;\r\n");
      out.write("            width: 80%;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        h1 {\r\n");
      out.write("            color: #333;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        a {\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("            color: #ffffff; /* 흰색 */\r\n");
      out.write("            background-color: #007bff; /* 파란색 */\r\n");
      out.write("            padding: 10px 20px;\r\n");
      out.write("            border-radius: 5px;\r\n");
      out.write("            margin-bottom: 10px;\r\n");
      out.write("            display: inline-block;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        table {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            border-collapse: collapse;\r\n");
      out.write("            margin-top: 20px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        th, td {\r\n");
      out.write("            border: 1px solid #e1e1e1;\r\n");
      out.write("            padding: 10px;\r\n");
      out.write("            text-align: left;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        th {\r\n");
      out.write("            background-color: #007bff; /* 파란색 */\r\n");
      out.write("            color: #ffffff; /* 흰색 */\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        td a {\r\n");
      out.write("            color: #333;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        td a:hover {\r\n");
      out.write("            color: white; \r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<h1>부서목록 입니다.</h1>\r\n");
      out.write("		<a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/dept/insertform.jsp\">부서추가</a>\r\n");
      out.write("		<table>\r\n");
      out.write("			<thead>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<th>부서번호</th>\r\n");
      out.write("					<th>부서이름</th>\r\n");
      out.write("					<th>지역</th>\r\n");
      out.write("					<th>수정</th>\r\n");
      out.write("					<th>삭제</th>\r\n");
      out.write("				</tr>\r\n");
      out.write("			</thead>\r\n");
      out.write("			<tbody>\r\n");
      out.write("				");
for(DeptDto dto:list){ 
      out.write("\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td>");
      out.print(dto.getDeptno() );
      out.write("</td>\r\n");
      out.write("					<td>");
      out.print(dto.getDname() );
      out.write("</td>\r\n");
      out.write("					<td>");
      out.print(dto.getLoc() );
      out.write("</td>\r\n");
      out.write("					<td>\r\n");
      out.write("						<a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/dept/updateform.jsp?deptno=");
      out.print(dto.getDeptno() );
      out.write("\">수정</a>\r\n");
      out.write("					</td>\r\n");
      out.write("					<td>\r\n");
      out.write("						<a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/dept/delete.jsp?deptno=");
      out.print(dto.getDeptno() );
      out.write("\">삭제</a>\r\n");
      out.write("					</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				");
} 
      out.write("\r\n");
      out.write("			</tbody>\r\n");
      out.write("		</table>\r\n");
      out.write("	</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
