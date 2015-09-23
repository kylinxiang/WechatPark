package xqpark;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.Iterator;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import xqpark.ReceiveXmlEntity;

/**
 * ΢��xml��Ϣ���������߼���
 * @author pamchen-1
 *
 */
public class WechatProcess {
	/**
	 * ��������xml����ȡ���ܻظ������ͨ��ͼ�������api�ӿڣ�
	 * @param xml ���յ���΢������
	 * @return	���յĽ��������xml��ʽ���ݣ�
	 */
	public String processWechatMag(String xml){
		/** ����xml���� */
		ReceiveXmlEntity xmlEntity = getMsgEntity(xml);
		
		/** ���ı���ϢΪ��������ͼ�������api�ӿڣ���ȡ�ظ����� */
		String result = "";
		//System.out.println(xmlEntity.getContent());��ӡ�յ�����Ϣ
		if("text".endsWith(xmlEntity.getMsgType())){
			if("�Ż�".equals(xmlEntity.getContent()))
				result = "��ӭʹ��Сǿͣ������ǰû���Ż���Ϣ!";
			else
				result = new TestApiProcess().getTulingResult(xmlEntity.getContent());
		}else{
			if("01_ORDER".equals(xmlEntity.getEventKey()))
			{
				result = "�ҵĶ���";
			}
			else if("02_WALLET".equals(xmlEntity.getEventKey()))
			{
				result = "�ҵ�Ǯ��";
			}
			else if("03_COLLECTION".equals(xmlEntity.getEventKey()))
			{
				result = "�ҵ��ղ�";
			}
			else if("04_INFO".equals(xmlEntity.getEventKey()))
			{
				result = "������Ϣ";
			}
			else if("05_CHANGE".equals(xmlEntity.getEventKey()))
			{
				result = "�޸�����";
			}
			else if("GUIDE".equals(xmlEntity.getEventKey()))
			{
				result = "ʹ�÷���:\n1.ʹ���ֻ���ע��.\n2.ע��ɹ�����ͣ��.\n3.������ǰλ�õĳ�λ��Ϣ��\n4ѡ�����µ���֧������.";
			}else if("subscribe".equals(xmlEntity.getEvent()))
			{
				result = "Сǿͣ����www.xqpark.cn���ǹ�˾�����з��Ĺ����׼ҳ�λ����Ԥ��ƽ̨���Ǻ����и������ص�֧����Ŀ��"
						+ "Сǿͣ��ּ��ͨ���������ó��������ҵ�Ŀ�ĵظ����Լ۱���ߵ�ͣ��λ�����ṩ��λԤ��������������֧���ȷ����ó���ͣ����ʡ�ġ���ʡǮ��";
			}
				
					
		}
		
		/** ��ʱ������û�������ǡ���á����ھ�������Ĺ���֮��resultΪ����Ҳ�á����Ƶ����� 
		 *  ��Ϊ���ջظ���΢�ŵ�Ҳ��xml��ʽ�����ݣ�������Ҫ�����װΪ�ı����ͷ�����Ϣ
		 * */
		result = formatXmlAnswer(xmlEntity.getFromUserName(), xmlEntity.getToUserName(), result);
		
		return result;
	}
	
	/**
	 * ��װ������ķ�����Ϣ
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
	 * ����΢��xml��Ϣ
	 * @param strXml
	 * @return
	 */
	public ReceiveXmlEntity getMsgEntity(String strXml){
		ReceiveXmlEntity msg = null;
		try {
			if (strXml.length() <= 0 || strXml == null)
				return null;
			 
			// ���ַ���ת��ΪXML�ĵ�����
			Document document = DocumentHelper.parseText(strXml);
			// ����ĵ��ĸ��ڵ�
			Element root = document.getRootElement();
			// �������ڵ��������ӽڵ�
			Iterator<?> iter = root.elementIterator();
			
			// �������н��
			msg = new ReceiveXmlEntity();
			//���÷�����ƣ�����set����
			//��ȡ��ʵ���Ԫ����
			Class<?> c = Class.forName("xqpark.ReceiveXmlEntity");
			msg = (ReceiveXmlEntity)c.newInstance();//�������ʵ��Ķ���
			
			while(iter.hasNext()){
				Element ele = (Element)iter.next();
				//��ȡset�����еĲ����ֶΣ�ʵ��������ԣ�
				Field field = c.getDeclaredField(ele.getName());
				//��ȡset������field.getType())��ȡ���Ĳ�����������
				Method method = c.getDeclaredMethod("set"+ele.getName(), field.getType());
				//����set����
				method.invoke(msg, ele.getText());
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("xml ��ʽ�쳣: "+ strXml);
			e.printStackTrace();
		}
		return msg;
	}

}
