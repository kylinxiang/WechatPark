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
		String xml = sb.toString();	//�μ�Ϊ���յ�΢�Ŷ˷��͹�����xml����
		
		//��ȡ���յ���xml��Ϣ 
		String result = "";
		//�ж��Ƿ���΢�Ž��뼤����֤��ֻ���״ν�����֤ʱ�Ż��յ�echostr��������ʱ��Ҫ����ֱ�ӷ��� 

        String signature = request.getParameter("signature");	   // ΢�ż���ǩ��
        String timestamp = request.getParameter("timestamp");      // ʱ��¾
        String nonce = request.getParameter("nonce");              // �����
        String echostr = request.getParameter("echostr");          // ����ַ���
         
        // ͨ������ signature ���������У�飬��У��ɹ���ԭ������ echostr����ʾ����ɹ����������ʧ��
        if (echostr != null && echostr.length() > 1) {
		    if (CheckUtil.checkSignature(signature, timestamp, nonce))
			   result = echostr;
		} else {
			//������΢�Ŵ�������
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
