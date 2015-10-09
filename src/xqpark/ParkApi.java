package xqpark;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.http.ParseException;
import org.json.JSONException;
import org.json.JSONObject;

public class ParkApi {

	static String jhappid = "xqtc";
	static String key = "jhkj";
	static String URL = "http://dev.xqpark.cn/xqtcApp";
	static String time = "";

	/**
	 * 请求API数据
	 * @param 请求数据的url
	 * @return 返回请求API所得的JSON数据
	 * @throws JSONException
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public static JSONObject loadJSON(String url) throws JSONException {
		StringBuilder json = new StringBuilder();
		try {
			URLEncoder.encode(url, "UTF-8");
			URL urlObject = new URL(url);
			HttpURLConnection uc = (HttpURLConnection) urlObject.openConnection();

			uc.setDoOutput(true);// 使用 URL 连接进行输出
			uc.setDoInput(true);// 使用 URL 连接进行输入
			uc.setUseCaches(false);
			uc.setRequestMethod("POST");

			BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream(), "utf-8"));
			String inputLine = null;
			while ((inputLine = in.readLine()) != null) {
				json.append(inputLine);
			}
			in.close();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		JSONObject responseJson = new JSONObject(json.toString());
		return responseJson;
	}

	/**
	 * 取得URL校验字符串
	 * @param urlStr：需要进行编码的字符串
	 * @return 将get请求的参数按照参数名升序排列，加上key的value， 最终将所有的alue连接成字符串，进行MD5编码
	 * @throws UnsupportedEncodingException
	 */
	public static String getHashCode(String urlStr) throws UnsupportedEncodingException {

		String hashStr = "";
		Map<String, String> keyMap = new TreeMap<String, String>();
		time = Long.toString(System.currentTimeMillis());

		String[] strarray = urlStr.split("&");
		for (String temp : strarray) {
			if (temp.split("=").length == 2) {
				String value = temp.split("=")[1];
				keyMap.put(temp.split("=")[0], value);
			}

			keyMap.put("jhappid", jhappid);
			keyMap.put("time", time);
		}

		Set<String> keySet = keyMap.keySet();
		Iterator<String> iter = keySet.iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			hashStr += keyMap.get(key);
		}
		hashStr += key;
		// System.out.println(hashStr);
		return hashStr;
	}

	/**
	 * 对字符串进行MD5编码
	 * @param str:需要进行MD5编码的字符串
	 * @return 返回编码后的字符串
	 */
	public static String getMD5Code(String str) throws UnsupportedEncodingException {

		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}

		byte[] byteArray = str.getBytes("UTF-8");
		byte[] md5Bytes = md5.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16) {
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		// System.out.println(hexValue.toString());
		return hexValue.toString();
	}
	/**
	 * 得到协议URL字符串
	 * @param params
	 */
	public static String getActionUrl(String params) throws Exception {

		String turl = null, hash = null;
		// String params = "service=getCarOwnerInfo&username="+user;
		String action = params.substring(params.indexOf('=') + 1, params.indexOf('&'));

		// "http://api.map.baidu.com/telematics/v3/weather?location=%E6%88%90%E9%83%BD&output=json&ak=rnm8udmHdWaHFWZTO2tuTiG8";
		hash = getMD5Code(getHashCode(params));
		turl = params + "&time=" + time + "&jhappid=" + jhappid + "&hash=" + hash;

		String actionUrl = URL + "/main/" + action + ".action?" + turl;
		return actionUrl;

	}

	/******************************************** 功能函数 *************************************************/
	/**
	 * 获取验证码
	 * @param phone
	 * @param type:1：注册   2：修改密码  3：快捷登录
	 * @param usertype
	 * return {"msg":"获取验证码成功","code":1,"vcode":"885316"}
	 */

	public static JSONObject getVerificationCode(String phone, String type, String usertype)
			throws JSONException, Exception {

		String params = "service=getVerificationCode&phone=" + phone + "&type=" + type + "&usertype=" + usertype;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}

	/**
	 * 用户注册
	 * @param username：手机号码
	 * @param password：设置的密码
	 * @param vcode：手机验证码n
	 * return {"msg":"用户注册成功!","code":1,"info":{"blance":0,"pidList":[],"accesstoken":"","ifexamine":0,"xcoState":0,"userid":13131,"phonetype":1,"citycode":"","coupons":"恭喜您获得10元度中秋迎国庆优惠券","nickname":"159****5104","drivinglicenseurl":"","channelId":0,"email":"","borth":"","sex":0,"headurl":"","identityurl":"","usertype":0,"userId":"","platenumber":"","childaccount":0,"registertime":1444189957449,"duty":0,"parkdistance":"","username":"15988845104"}}
	 */
	public static JSONObject register(String username, String password, String vcode) throws JSONException, Exception {

		String passwordTemp = getMD5Code(password);
		String params = "service=register&username=" + username + "&password=" + passwordTemp
				+ "&usertype=1&phonetype=3&vcode=" + vcode + "&token=123456&spcode=XMLS";
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}

	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * return {"msg":"登录成功","code":1,"info":{"blance":0,"pidList":[],"accesstoken":"","ifexamine":0,"xcoState":1,"userid":13131,"phonetype":1,"citycode":"","coupons":"","nickname":"159****5104","drivinglicenseurl":"","channelId":0,"email":"","borth":"","sex":0,"headurl":"","identityurl":"","usertype":1,"userId":"","platenumber":"","childaccount":0,"registertime":1444189957000,"duty":0,"parkdistance":"","username":"15988845104"}}
	 */
	public static JSONObject login(String username, String password) throws JSONException, Exception {

		String passwordTemp = getMD5Code(password);
		String params = "service=login&username=" + username + "&password=" + passwordTemp
				+ "&usertype=1&phonetype=1&token=123456";
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}

	/**
	 * 获取车主信息
	 * @param user:需要查询的用户名（手机号）
	 * @return 返回得到的JSON数据
	 */
	public static JSONObject getCarOwnerInfo(String username) throws JSONException, Exception {

		String params = "service=getCarOwnerInfo&username=" + username;

		// String url =
		// "http://api.map.baidu.com/telematics/v3/weather?location=%E6%88%90%E9%83%BD&output=json&ak=rnm8udmHdWaHFWZTO2tuTiG8";
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}

	/**
	 * 获取用户消费信息（停车场主）
	 * @param userid
	 */
	public static JSONObject getConsumeRecordes(String userid) throws JSONException, Exception {

		String params = "service=getConsumeRecordes&userid=" + userid + "&type=2&page=1";
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}

	/**
	 * 获取支付宝签名（改为微信支付）
	 * @param userid
	 * @param totalfee
	 * @param type
	 * @param orderid
	 */
	public static JSONObject getAlSign(String userid, String totalfee, String type, String orderid)
			throws JSONException, Exception {

		String params = "service=getAlSign&userid=" + userid + "&totalfee=" + totalfee + "&subject=&body=&type=" + type
				+ "&orderid=" + orderid;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}

	/**
	 * 需要获取校验码：type=2,usertype=1,得到vcode后再修改密码
	 * @param username
	 * @param vcode
	 * @param password 修改后的密码
	 * return {"msg":"修改密码成功","code":1}
	 */
	public static JSONObject changePassWord(String username, String vcode, String password)
			throws JSONException, Exception {

		String passwordTemp = getMD5Code(password);
		String params = "service=changePassWord&username=" + username + "&vcode=" + vcode + "&password=" + passwordTemp
				+ "&type=1";
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}

	/**
	 * 退出（注销）
	 * @param userid
	 * return {"msg":"退出成功","code":1}
	 */
	public static JSONObject exit(String userid) throws JSONException, Exception {

		String params = "service=exit&userid=" + userid + "&type=1";
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}

	/**
	 * 修改车主信息
	 * @param userid
	 * @param nickname  昵称
	 * @param sex 用户性别1：男0：女
	 * @param born
	 * @param email
	 * return {"msg":"修改车主信息成功","code":1}
	 */
	public static JSONObject editCarOwnerInfo(String userid, String nickname, String sex, String born, String email)
			throws JSONException, Exception {

		String params = "service=editCarOwnerInfo&userid=" + userid + "&nickname=" + nickname + "&sex=" + sex
				+ "&headPic=&born=" + born + "&email=" + email + "&platenumber=&drivinglicense=";
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}

	/**
	 * 上传(修改)文件(需要调用图片，并将图片转换为二进制)
	 * @param file:转换好的二进制文件
	 * @param type:上传类型：1车主头像2：c主行驶证4：业主身份证5：停车场图片6：停车场营业执照7：崩溃日志文件
	 * @param userid:用户id只有type=7时候可以为空
	 * @return 
	 */
	public static JSONObject upload(String file, String type, String userid) throws JSONException, Exception {

		String params = "service=upload&file=&type=1&userid=7&parkid=&url=";
		String actionUrl = getActionUrl(params).replace("/main", "");
		System.out.println(actionUrl);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}

	/**
	 * 获取停车场信息
	 * @param parkid
	 * @return {"msg":"停车场不存在","code":0,"info":null}
	 */
	public static JSONObject getParkInfo(String parkid) throws JSONException, Exception {

		String params = "service=getParkInfo&parkid=" + parkid + "&userid=";
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}

	/**
	 * 获取订单记录
	 * @param userid:车主id(如果type=2,id为停车场id)
	 * @param type:1：车主  2：停车场(如果type=2,id为停车场id)为空则获取所有订单
	 * return {"msg":"结果为空","code":1,"count":0,"list":[]}
	 */
	public static JSONObject getOrders(String userid, String type) throws JSONException, Exception {

		String params = "service=getOrders&userid=" + userid + "&type=" + type + "&page=1&state=";
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}

	/**
	 * 对停车场的评价（有错误，包含中文时错误）
	 * @param parkid:停车场id
	 * @param userid：用户id
	 * @param content：评价内容
	 * @param score：评分
	 * @param orderid：订单编号
	 */
	public static JSONObject doParkAppraise(String parkid, String userid, String content, String score, String orderid)
			throws JSONException, Exception {

		String nickname = "小强";
		String parkname = "甲虎停车场";
		String params = "service=doParkAppraise&parkid=" + parkid + "&userid=" + userid + "&nickname=" + nickname
				+ "&content=" + content + "&score=" + score + "&orderid=" + orderid + "&parkname=" + parkname;
		String actionUrl = getActionUrl(params);
		System.out.println(actionUrl);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取停车场的评价历史记录
	 * @param parkid
	 * return {"msg":"结果为空","code":1,"count":0,"list":[]}
	 */
	public static JSONObject getParkAppraise(String parkid) throws JSONException, Exception {

		String params = "service=getParkAppraise&parkid="+parkid+"&page=1";
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 收藏停车场信息
	 * @param parkid
	 * @param userid
	 * @param type:1：收藏  2：取消收藏
	 * @return {"msg":"收藏成功","code":1}
	 */
	public static JSONObject doCollect(String parkid,String userid,String type) throws JSONException, Exception {

		String params = "service=doCollect&parkid="+parkid+"&parkid="+parkid+"&userid="+userid+"&type="+type;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取收藏信息列表
	 * @param userid
	 * @param page:取第几页数据(每页暂定10条记录)
	 * return {"msg":"结果为空","code":1,"count":0,"list":[]}
	 */
	public static JSONObject getCollects(String userid,String page) throws JSONException, Exception {

		String params = "service=getCollects&userid="+userid+"&page="+page;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 
	 * @param parkid
	 * @param userid
	 * @param content(投诉内容500字以内)
	 * @return {"msg":"停车场不存在","code":0}
	 */
	public static JSONObject doComplain(String parkid,String userid,String content) throws JSONException, Exception {

		String params = "service=doComplain&parkid="+parkid+"&userid="+userid+"&content="+content;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取订单详情
	 * @param orderid
	 * @return {"msg":"结果为空","code":1,"info":null}
	 */
	public static JSONObject getOrderInfo(String orderid) throws JSONException, Exception {

		String params = "service=getOrderInfo&orderid="+orderid;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 搜索目的地(停车场)
	 * @param searchkey:搜索关键字 (eg:杭州)
	 * @param userid
	 * return {"code":1,"count":38,"list":[...],"msg":"搜索停车场成功"}
	 */
	public static JSONObject searchPark(String searchkey,String userid) throws JSONException, Exception {

		String params = "service=searchPark&searchkey="+searchkey+"&userid"+userid;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 预约停车
	 * @param parkid
	 * @param userid
	 * @param starttime:预约起始时间（2015-5-21 11:33）
	 * @param endtime:预约结束时间（2015-5-22 11:33）
	 * @param type:预约类型1：及时停车2：预约停车
	 * @param prepay:预付金额
	 * @param parktype:停车位置1：室内  2：室外
	 * @param platenumber:车牌号码
	 * return 
	 */
	public static JSONObject doParkReservation(String parkid,String userid,String starttime,String endtime,String type,String prepay,String parktype,String platenumber ) throws JSONException, Exception {

		String params = "service=doParkReservation&chargetype=1&parkid="+parkid+"&userid="+userid+"&nickname=xq&starttime="+starttime+"&endtime="+endtime+"&type="+type+"&paystate=2&preferentialid=&parktype="+parktype+"&prepay="+prepay+"&platenumber="+platenumber;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 车主进场(开始停车)(在扫描二维码后面加入&parkid=8&userid=9的字符串，即扫描业主所在停车场id和扫码时车主的用户id)
	 * @param orderid
	 * @param parkid
	 * @param type :1：扫码进场  2：按钮进场(如果为空，默认扫码)
	 */
	public static JSONObject doPark(String orderid,String parkid,String userid,String type) throws JSONException, Exception {

		String params = "service=doPark&orderid="+orderid+"&parkid="+parkid+"&userid"+userid+"&type="+type;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 车主离场(停车结束)
	 * @param orderid
	 * @param parkid
	 * @param userid
	 * @param type:1：扫码进场  2：按钮进场(如果为空的话，默认扫码)
	 */
	public static JSONObject endPark(String orderid,String parkid,String userid,String type) throws JSONException, Exception {

		String params = "service=endPark&orderid="+orderid+"&parkid="+parkid+"&userid"+userid+"&type="+type;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取总价格
	 * @param starttime:开始时间(如：2015-04-25 12:33:22)
	 * @param endtime
	 * @param rule:收费规则(如：50,80,100,120,125,20)
	 * @param type:计费类型1：自然计费2:24小时计费
	 */
	public static JSONObject getTransactionValue(String starttime,String endtime,String rule,String type) throws JSONException, Exception {

		String params = "service=getTransactionValue&starttime="+starttime+"&endtime="+endtime+"&rule="+rule+"&type="+type;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 业主提现
	 * @param userid
	 * @param money:提款金额
	 * @param zfbaccount:提现支付宝账号
	 * @param zfbname：支付宝账号的姓名
	 */
	public static JSONObject withdrawalsMoney(String userid,String money,String zfbaccount,String zfbname) throws JSONException, Exception {

		String params = "service=withdrawalsMoney&userid="+userid+"&money="+money+"&zfbaccount="+zfbaccount+"&zfbname="+zfbname;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 新增车牌号
	 * @param userid
	 * @param platenumber:车牌号
	 */
	public static JSONObject addPlatenumber(String userid,String platenumber) throws JSONException, Exception {

		String params = "service=addPlatenumbery&userid="+userid+"&platenumber="+platenumber;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 订单扣费计算
	 * @param orderid
	 * @param userid
	 * @param paytype:1:支付宝支付  2:微信支付(默认为支付宝支付)
	 */
	public static JSONObject doCharged(String orderid,String userid,String paytype) throws JSONException, Exception {

		String params = "service=doCharged&orderid="+orderid+"&userid="+userid+"&paytype="+paytype;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 取消订单
	 * @param orderid
	 * @param userid
	 */
	public static JSONObject cancelOrder(String orderid,String userid) throws JSONException, Exception {

		String params = "service=cancelOrder&orderid="+orderid+"&userid="+userid;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取业主信息
	 * @param userid
	 */
	public static JSONObject getParkOwnerInfo(String userid) throws JSONException, Exception {

		String params = "service=cancelOrder&userid="+userid;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取停车场图片
	 * @param parkid
	 * @param type:类型1：业主身份证,2：停车场营业执照,3：停车场环境照片,4：业主身份证和停车证营业执照(为空所有图片都取)
	 */
	public static JSONObject getParkPictures(String parkid,String type) throws JSONException, Exception {

		String params = "service=getParkPictures&parkid="+parkid+"&type="+type;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 快捷登录
	 * @param username
	 * @param vcode:首先获取验证码
	 * @param type：用户类型1：车主，2：业主
	 */
	public static JSONObject doEasiestLogin(String username,String vcode,String type) throws JSONException, Exception {

		String params = "service=doEasiestLogin&username="+username+"&vcode="+vcode+"&type="+type+"&phonetype=3";
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 
	 * @param userid
	 * @param usertype:用户类型1：车主,2：业主
	 * @param content:反馈内容限500字
	 */
	public static JSONObject doFeedBack(String userid,String usertype,String content) throws JSONException, Exception {

		String params = "service=doFeedBack&userid="+userid+"&usertype="+usertype+"&content="+content;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取搜索关键字提示(新版本1)
	 * @param type:类型1：获取机场名称,2：获取城市名称(例如：杭州萧山、上海虹桥等)
	 */
	public static JSONObject getSearchKeyNew(String type) throws JSONException, Exception {

		String params = "service=getSearchKeyNew&type="+type;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取车主优惠券列表
	 * @param userid
	 */
	public static JSONObject getCoupons(String userid) throws JSONException, Exception {

		String params = "service=getCoupons&userid="+userid;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 根据移动坐标获取停车场列表
	 * @param city:所在城市名称
	 * @param scope:搜索范围(米为单位)
	 */
	public static JSONObject getParkByCoordinate(String city,String scope) throws JSONException, Exception {

		String params = "service=getParkByCoordinate&city="+city+"&scope="+scope;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 微信支付成功调用接口
	 * @param out_trade_no:商户订单号
	 * @param trade_no:微信交易号
	 * @param total_fee:充值金额
	 */
	public static JSONObject wxPaySuccess(String out_trade_no,String trade_no,String total_fee) throws JSONException, Exception {

		String params = "service=wxPaySuccess&out_trade_no="+out_trade_no+"&trade_no="+trade_no+"total_fee"+total_fee;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取待办事项接口
	 * @param parkid
	 * @param type :待办事项类型1：进场,2：离场
	 * @param page :取第几页数据(每页暂定10条记录)
	 */
	public static JSONObject getToDoList(String parkid,String type,String page) throws JSONException, Exception {

		String params = "service=getToDoList&parkid="+parkid+"&type="+type+"page"+page;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取待办事项状态的数目值
	 * @param parkid
	 */
	public static JSONObject getToDoListCount(String parkid) throws JSONException, Exception {

		String params = "service=getToDoListCount&parkid="+parkid;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 网站支付宝支付接口(直接提交表单地址：http://dev.xqpark.cn/xqtcApp/alipayapi.jsp)
	 * @param out_trade_no :订单编号，在扣费接口返回给你的
	 * @param total_fee :支付金额
	 
	public static JSONObject getToDoListCount(String out_trade_no,String total_fee) throws JSONException, Exception {

		String params = "service=getToDoListCount&out_trade_no="+out_trade_no+"total_fee"+total_fee;
		String actionUrl = URL+"/alipayapi.jsp?"+params;
		JSONObject jsonObject = loadJSON(actionUrl);  

		return jsonObject;
	}
	*/
	
	/**
	 * 获取开机广告图片接口(未调通)
	 * @return
	 */
	public static JSONObject getAdvertPictures() throws JSONException, Exception {

		String params = "service=getAdvertPictures&type=";
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取机场介绍接口
	 * @param cityid :机场所在的城市代码
	 */
	public static JSONObject getAirportIntroduction(String cityid) throws JSONException, Exception {

		String params = "service=getAirportIntroduction&cityid="+cityid;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取违章查询地址接口
	 * @param phone :手机号
	 * @param userid :用户id
	 * return :{"msg":"","code":1,"peccancyurl":"http://wap.cx580.com/illegal?user_id=13131..."}
	 */
	public static JSONObject getPeccancy(String phone,String userid) throws JSONException, Exception {

		String params = "service=getPeccancy&phone="+phone+"&userid="+userid;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
	
	/**
	 * 获取用户的性别(无法获取)
	 * @param mobile :用户电话号码
	 */
	public static JSONObject getUserSex(String mobile) throws JSONException, Exception {

		String params = "service=getUserSex&mobile="+mobile;
		String actionUrl = getActionUrl(params);
		JSONObject jsonObject = loadJSON(actionUrl);

		return jsonObject;
	}
}
