package xqpark;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Iterator;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.json.JSONException;
import org.json.JSONObject;

import xqpark.ReceiveXmlEntity;

/**
 * 微信xml消息处理流程逻辑类
 * @author pamchen-1
 *
 */
public class WechatProcess {
	/**
	 * 解析处理xml
	 * @param xml 接收到的微信数据
	 * @return 最终的解析结果（xml格式数据）
	 */
	public String processWechatMag(String xml){
		/** 解析xml数据*/
		ReceiveXmlEntity xmlEntity = getMsgEntity(xml);
		
		/** 获取回复内容 */
		String result = "";
		//System.out.println(xmlEntity.getContent());��ӡ�յ�����Ϣ
		if("text".endsWith(xmlEntity.getMsgType())){
			if("优惠".equals(xmlEntity.getContent()))
				result = "欢迎使用小强停车，当前没有优惠信息!";
			else
				result = getTulingResult(xmlEntity.getContent());
		}else{
			if("01_ORDER".equals(xmlEntity.getEventKey()))
			{
				result = "我的订单";
			}
			else if("02_WALLET".equals(xmlEntity.getEventKey()))
			{
				result = "我的钱包";
			}
			else if("03_COLLECTION".equals(xmlEntity.getEventKey()))
			{
				result = "我的收藏";
			}
			else if("04_INFO".equals(xmlEntity.getEventKey()))
			{
				result = "个人信息";
			}
			else if("05_CHANGE".equals(xmlEntity.getEventKey()))
			{
				result = "修改密码";
			}
			else if("GUIDE".equals(xmlEntity.getEventKey()))
			{
				result = "使用方法:\n1.使用手机号注册.\n2.注册成功后点击停车.\n3.搜索当前位置的车位信息.\n4.选定后下单并支付定金.";
			}else if("subscribe".equals(xmlEntity.getEvent()))
			{
				result = "小强停车（www.xqpark.cn）是公司独立研发的国内首家车位分享及预订平台，是杭州市高新区重点支持项目。"
						+ "小强停车旨在通过互联网让车主快速找到目的地附近性价比最高的停车位，并提供车位预订、导航、在线支付等服务，让车主停车更省心、更省钱。";
			}			
		}
		
		/** 因为最终回复给微信的也是xml格式的数据，所有需要将其封装为文本类型返回消息*/
		result = formatXmlAnswer(xmlEntity.getFromUserName(), xmlEntity.getToUserName(), result);	
		return result;
	}
	
	/**
	 * 封装文字类的返回消息
	 * @param to
	 * @param from
	 * @param content
	 * @return
	 */
	public String formatXmlAnswer(String to, String from, String content) {
		StringBuffer sb = new StringBuffer();
		Date date = new Date();
		sb.append("<xml><ToUserName><![CDATA[");
		sb.append(to);
		sb.append("]]></ToUserName><FromUserName><![CDATA[");
		sb.append(from);
		sb.append("]]></FromUserName><CreateTime>");
		sb.append(date.getTime());
		sb.append("</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[");
		sb.append(content);
		sb.append("]]></Content><FuncFlag>0</FuncFlag></xml>");
		return sb.toString();
	}
	
	/**
	 *  解析微信xml消息
	 * @param strXml
	 * @return
	 */
	public ReceiveXmlEntity getMsgEntity(String strXml){
		ReceiveXmlEntity msg = null;
		try {
			if (strXml.length() <= 0 || strXml == null)
				return null;
			 
			// 将字符串转化为XML文档对象
			Document document = DocumentHelper.parseText(strXml);
			// 获得文档的根节点
			Element root = document.getRootElement();
			// 遍历根节点下所有子节点
			Iterator<?> iter = root.elementIterator();
			
			// 遍历所有结点
			msg = new ReceiveXmlEntity();
			//利用反射机制，调用set方法
			//获取该实体的元类型
			Class<?> c = Class.forName("xqpark.ReceiveXmlEntity");
			msg = (ReceiveXmlEntity)c.newInstance();//创建这个实体的对象
			
			while(iter.hasNext()){
				Element ele = (Element)iter.next();
				//获取set方法中的参数字段（实体类的属性
				Field field = c.getDeclaredField(ele.getName());
				//获取set方法，field.getType())获取它的参数数据类型
				Method method = c.getDeclaredMethod("set"+ele.getName(), field.getType());
				//调用set方法
				method.invoke(msg, ele.getText());
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("xml ��ʽ�쳣: "+ strXml);
			e.printStackTrace();
		}
		return msg;
	}
	
	/**
	 * 调用图灵机器人api接口，获取智能回复内容，解析获取自己所需结果
	 * @param content
	 * @return
	 */
	public String getTulingResult(String content){
		/** 此处为图灵api接口，参数key需要自己去注册申请，先以11111111代替 */
		String apiUrl = "http://www.tuling123.com/openapi/api?key=9edf14145595d3fd11c48e17e0d5ff95&info=";
		String param = "";
		try {
			param = apiUrl+URLEncoder.encode(content,"utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} //将参数转为url编码
		
		/**发送httpget请求 */
		HttpGet request = new HttpGet(param);
		String result = "";
		try {
			HttpResponse response = HttpClients.createDefault().execute(request);
			if(response.getStatusLine().getStatusCode()==200){
				result = EntityUtils.toString(response.getEntity());
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		/** 请求失败处理 */
		if(null==result){
			return "对不起，你说的话真是太高深了……";
		}
		
		try {
			JSONObject json = new JSONObject(result);
			//以code=100000为例，参考图灵机器人api文档
			if(100000==json.getInt("code")){
				result = json.getString("text");
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
  }

}
