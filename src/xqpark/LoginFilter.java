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
 
         // ����û������URI
         String path = servletRequest.getRequestURI();
         //System.out.println(path);
         
         // ��session��ȡ�û���Ϣ
         String username = (String) session.getAttribute("username");
        
         //��½ҳ���������
         if(path.indexOf("/WechatPark/Login.jsp") > -1  || path.indexOf("/WechatPark/wechat.do") > -1|| path.indexOf("/WechatPark/login.do") > -1) {
             chain.doFilter(servletRequest, servletResponse);
             return;
         }
         //�ж����û��ȡ��Ա����Ϣ,����ת����½ҳ��
         if (username == null || "".equals(username)) {
             // ��ת����½ҳ��
        	 servletResponse.sendRedirect("/WechatPark/Login.jsp");
         } else {
             //�Ѿ���½,�����˴�����
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
