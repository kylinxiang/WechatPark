package xqpark;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
//import java.io.PrintWriter;

import xqpark.WechatProcess;
import xqpark.WechatMenu;

/**
 * Servlet implementation class WechatIndex
 */
@WebServlet("/WechatIndex")
public class WechatIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WechatIndex() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// wechat menu create
		WechatMenu.createMenu();
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		StringBuffer sb = new StringBuffer();
		InputStream is = request.getInputStream();
		InputStreamReader isr = new InputStreamReader(is, "UTF-8");
		BufferedReader br = new BufferedReader(isr);
		String s = "";
		while ((s = br.readLine()) != null) {
			sb.append(s);
		}
		String xml = sb.toString();	//为接收到微信端发送过来的xml数据
		System.out.println(xml);
		
		//读取接收到的xml消息
		String result = "";
		
		//判断是否是微信接入激活验证，只有首次接入验证时才会收到echostr参数，此时需要把它直接返回
        String signature = request.getParameter("signature");	   // 微信加密签名
        String timestamp = request.getParameter("timestamp");      // 时间戮
        String nonce = request.getParameter("nonce");              // 随机数
        String echostr = request.getParameter("echostr");          // 随机字符串
         
        //通过检验 signature 对请求进行校验，若校验成功则原样返回 echostr，表示接入成功，否则接入失败
        if (echostr != null && echostr.length() > 1) {
		    if (CheckUtil.checkSignature(signature, timestamp, nonce))
			   result = echostr;
		} else {
			//正常的微信处理流程
			result = new WechatProcess().processWechatMag(xml);

		}

		try {
			OutputStream os = response.getOutputStream();
			os.write(result.getBytes("UTF-8"));
			response.getWriter().print(result);
			os.flush();
			os.close();
		} catch (Exception e) {
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
