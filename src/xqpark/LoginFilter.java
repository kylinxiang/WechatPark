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


/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

	private String sessionKey;

    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }
    
    /**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		sessionKey = fConfig.getInitParameter("sessionKey");
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		if (sessionKey == "") {
            chain.doFilter(request, response);
            return;
        }
		// TODO Auto-generated method stub
		// place your code here
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;	
        //HttpSession session = servletRequest.getSession();
        
         String path = servletRequest.getRequestURI();
         String sessionObj = (String) servletRequest.getSession().getAttribute("sessionKey");
         System.out.println(sessionObj);
         
         //String username =  (String)session.getAttribute("username");
         //Boolean isLogin = (Boolean) session.getAttribute("isLogin");
        
         if(path.indexOf("login.jsp") > -1  || path.indexOf("wechat.do") > -1|| path.indexOf("login.do") > -1) {
             chain.doFilter(request, response);
             return;
         } 
         if(sessionObj == null) {
        	 servletRequest.getSession().setAttribute("goUrl",path);
        	 System.out.println(path);
        	 servletResponse.sendRedirect("/ParkWechat/login.jsp");
         }else if(sessionObj.equals("success")){
        	 chain.doFilter(request, response);
         }
    }




	

}
