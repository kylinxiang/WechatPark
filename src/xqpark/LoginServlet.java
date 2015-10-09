package xqpark;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import xqpark.ParkApi;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String goUrl = "";
		JSONObject jsonobj = null,info = null;
		long userid=0,registertime=0;
		int usertype=0,sex=0,ifexamine=0;
		float blance=0;
		String msg = "",headurl="",nickname="",borth="",email="",platenumber="",citycode="",accesstoken="";
		
		response.setContentType("text/html;charset=utf-8") ;
		request.setCharacterEncoding("utf-8") ;
		
		String username = request.getParameter("username");     
        String password = request.getParameter("password");
        //System.out.println("HELLO");
        
        try {
        	jsonobj = ParkApi.login(username, password);
        	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        try {
        	msg = jsonobj.getString("msg");
        	System.out.println(msg);
			if(jsonobj.getInt("code") == 1)
			{
				info = jsonobj.getJSONObject("info");
	        	
	        	//ifexamine = jsonobj.getInt("ifexamine");
	        	//userid = info.getLong("userid");
	        	//registertime = info.getLong("registertime");   	
	        	//usertype = info.getInt("usertype");
	        	//blance = (float) info.getDouble("blance");
	        	//headurl = info.getString("headurl");
				
				goUrl = (String) request.getSession().getAttribute("goUrl");
	        	
				request.getSession().setAttribute("sessionKey", "success");
	
				request.getSession().setAttribute("username", username);
				request.getSession().setAttribute("userid", userid);
				
				System.out.println("跳转开始:"+goUrl);
			    response.sendRedirect(goUrl);  
				return;
			}else{
				response.sendRedirect("/ParkWechat/login.jsp");
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
