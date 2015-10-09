package xqpark;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import org.json.JSONObject;

public class WechatMenu {
	/**
	 * 获得ACCESS_TOKEN
	 * @Title: getAccess_token
	 * @Description: 获得ACCESS_TOKEN
	 * @param @return
	 * @return String 
	 * @throws
	  */
	 private static String getAccess_token(){  

	  String APPID="wxa93b148a130b876e";
	  String APPSECRET="01a20d7fba1f46856bb6be43c7103ed2";
	       String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+ APPID + "&secret=" +APPSECRET;
	       String accessToken = null;
	      try {
	             URL urlGet = new URL(url);
	             HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();    

	             http.setRequestMethod("GET");      //必须是get方式请求  
	             http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
	             http.setDoOutput(true);        
	             http.setDoInput(true);
	             System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
	             System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒
	             http.connect();

	             InputStream is =http.getInputStream();
	             int size =is.available();
	             byte[] jsonBytes =new byte[size];
	             is.read(jsonBytes);
	             String message=new String(jsonBytes,"UTF-8");

	             JSONObject demoJson = new JSONObject(message);
	             accessToken = demoJson.getString("access_token");

	             System.out.println(message);
	             } catch (Exception e) {
	                 e.printStackTrace();
	             }
	        return accessToken;
	     }

	 /**
	 * 创建Menu
	 * @Title: createMenu
	 * @Description: ����Menu
	 * @param @return
	 * @param @throws IOException 
	 * @return int 
	 * @throws
	  */
	    public static String createMenu() {
	      String menu = "{\"button\":"
	      		+ "[{\"type\":\"view\",\"name\":\"预定车位\",\"url\":\"http://xqpark.tunnel.mobi/ParkWechat/urban-ParkMap.jsp\"},"
	      		+ "	{\"type\":\"click\",\"name\":\"操作指南\",\"key\":\"GUIDE\"},"
	      		+ "{\"name\":\"个人信息\",\"sub_button\":"
	      		+  "[{\"type\":\"view\",\"name\":\"我的订单\",\"url\":\"http://xqpark.tunnel.mobi/ParkWechat/my-Details.jsp\"},"
	      		+   "{\"type\":\"view\",\"name\":\"我的钱包\",\"url\":\"http://xqpark.tunnel.mobi/ParkWechat/my-wallet.jsp\"},"
	      		+   "{\"type\":\"view\",\"name\":\"我的收藏\",\"url\":\"http://xqpark.tunnel.mobi/ParkWechat/my-collection.jsp\"},"
	      		+ 	"{\"type\":\"view\",\"name\":\"个人信息\",\"url\":\"http://xqpark.tunnel.mobi/ParkWechat/personal.jsp\"},"
	      		+ 	"{\"type\":\"view\",\"name\":\"修改密码\",\"url\":\"http://xqpark.tunnel.mobi/ParkWechat/forget-pw.jsp\"}]}]}";

	        String access_token= getAccess_token();
	        String action = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token="+access_token;
	        try {
	           URL url = new URL(action);
	           HttpURLConnection http =   (HttpURLConnection) url.openConnection();    

	           http.setRequestMethod("POST");        
	           http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
	           http.setDoOutput(true);        
	           http.setDoInput(true);
	           System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//���ӳ�ʱ30��
	           System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //��ȡ��ʱ30��
	           http.connect();
	           OutputStream os= http.getOutputStream();    
	           os.write(menu.getBytes("UTF-8"));//�������    
	           os.flush();
	           os.close();

	           InputStream is =http.getInputStream();
	           int size =is.available();
	           byte[] jsonBytes =new byte[size];
	           is.read(jsonBytes);
	           String message=new String(jsonBytes,"UTF-8");
	           return "返回信息"+message;
	           } catch (MalformedURLException e) {
	               e.printStackTrace();
	           } catch (IOException e) {
	               e.printStackTrace();
	           }    
	        return "createMenu失败";
	   }

	    /**
	    * 删除当前Menu
	    * @Title: deleteMenu
	    * @Description:
	    * @param @return
	    * @return String
	    * @throws
	     */
	   public static String deleteMenu()
	   {
	       String access_token= getAccess_token();
	       String action = "https://api.weixin.qq.com/cgi-bin/menu/delete? access_token="+access_token;
	       try {
	          URL url = new URL(action);
	          HttpURLConnection http =   (HttpURLConnection) url.openConnection();    

	          http.setRequestMethod("GET");        
	          http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
	          http.setDoOutput(true);        
	          http.setDoInput(true);
	          System.setProperty("sun.net.client.defaultConnectTimeout", "30000");
	          System.setProperty("sun.net.client.defaultReadTimeout", "30000"); 
	          http.connect();
	          OutputStream os= http.getOutputStream();    
	          os.flush();
	          os.close();

	          InputStream is =http.getInputStream();
	          int size =is.available();
	          byte[] jsonBytes =new byte[size];
	          is.read(jsonBytes);
	          String message=new String(jsonBytes,"UTF-8");
	          return "deleteMenu������Ϣ:"+message;
	          } catch (MalformedURLException e) {
	              e.printStackTrace();
	          } catch (IOException e) {
	              e.printStackTrace();
	          }
	       return "deleteMenu失败";   
	   }

}
