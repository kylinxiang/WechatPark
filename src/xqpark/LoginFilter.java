package xqpark;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;	
        HttpSession session = servletRequest.getSession();
 
         // 获得用户请求的URI
         String path = servletRequest.getRequestURI();
         //System.out.println(path);
         
         // 从session里取用户信息
         String username = (String) session.getAttribute("username");
        
         //登陆页面无需过滤
         if(path.indexOf("/WechatPark/Login.jsp") > -1  || path.indexOf("/WechatPark/wechat.do") > -1|| path.indexOf("/WechatPark/login.do") > -1) {
             chain.doFilter(servletRequest, servletResponse);
             return;
         }
         //判断如果没有取到员工信息,就跳转到登陆页面
         if (username == null || "".equals(username)) {
             // 跳转到登陆页面
        	 servletResponse.sendRedirect("/WechatPark/Login.jsp");
         } else {
             //已经登陆,继续此次请求
             chain.doFilter(request, response);
         }

     }


	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
