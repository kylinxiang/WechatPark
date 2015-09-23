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
	  * ���ACCESS_TOKEN
	 * @Title: getAccess_token
	 * @Description: ���ACCESS_TOKEN
	 * @param @return    �趨�ļ�
	 * @return String    ��������
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

	             http.setRequestMethod("GET");      //������get��ʽ����    
	             http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
	             http.setDoOutput(true);        
	             http.setDoInput(true);
	             System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//���ӳ�ʱ30��
	             System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //��ȡ��ʱ30��
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
	  * ����Menu
	 * @Title: createMenu
	 * @Description: ����Menu
	 * @param @return
	 * @param @throws IOException    �趨�ļ�
	 * @return int    ��������
	 * @throws
	  */
	    public static String createMenu() {
	      String menu = "{\"button\":"
	      		+ "[{\"type\":\"view\",\"name\":\"����ͣ��\",\"url\":\"http://xqpark.tunnel.mobi/WechatPark/urban-ParkMap.jsp\"},"
	      		+ "	{\"type\":\"click\",\"name\":\"����ָ��\",\"key\":\"GUIDE\"},"
	      		+ "{\"name\":\"������Ϣ\",\"sub_button\":"
	      		+  "[{\"type\":\"click\",\"name\":\"�ҵĶ���\",\"key\":\"01_ORDER\"},"
	      		+   "{\"type\":\"click\",\"name\":\"�ҵ�Ǯ��\",\"key\":\"02_WALLET\"},"
	      		+   "{\"type\":\"click\",\"name\":\"�ҵ��ղ�\",\"key\":\"03_COLLECTION\"},"
	      		+ 	"{\"type\":\"click\",\"name\":\"������Ϣ\",\"key\":\"04_INFO\"},"
	      		+ 	"{\"type\":\"click\",\"name\":\"�޸�����\",\"key\":\"05_CHANGE\"}]}]}";

	        //�˴���Ϊ�Լ���Ҫ�Ľṹ�壬�滻����
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
	           return "������Ϣ"+message;
	           } catch (MalformedURLException e) {
	               e.printStackTrace();
	           } catch (IOException e) {
	               e.printStackTrace();
	           }    
	        return "createMenu ʧ��";
	   }

	    /**
	     * ɾ����ǰMenu
	    * @Title: deleteMenu
	    * @Description: ɾ����ǰMenu
	    * @param @return    �趨�ļ�
	    * @return String    ��������
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
	          System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//���ӳ�ʱ30��
	          System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //��ȡ��ʱ30��
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
	       return "deleteMenu ʧ��";   
	   }
	 public static void main(String[] args) {

	  System.out.println(createMenu());
	 }
}
