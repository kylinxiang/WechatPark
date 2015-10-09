package xqpark;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import xqpark.ParkApi;

/**
 * Servlet implementation class TestApiServlet
 */
@WebServlet("/TestApiServlet")
public class TestApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		JSONObject jsonObject = null;
		response.setContentType("text/html;charset=utf-8") ;
		response.getWriter().append("Served at: ").append(request.getContextPath()).append("<br><br>");
		
		try {
			//jsonObject = ParkApi.getVerificationCode("15988846256","2", "1");
			//jsonObject = ParkApi.register("15988845104","zhm1219","958123");		
			jsonObject = ParkApi.login("15988846256","zhm1219");
			//jsonObject = ParkApi.getConsumeRecordes("7");
			//jsonObject = ParkApi.changePassWord("15988846256","778135","zhm1219");
			//jsonObject = ParkApi.getCarOwnerInfo("15988845104");
			//jsonObject = ParkApi.editCarOwnerInfo("13131", "Demi", "0", "7", "9");
			//jsonObject = ParkApi.getParkInfo("101");
			//jsonObject = ParkApi.getOrders("13131", "1");
			//jsonObject = ParkApi.doParkAppraise("1", "1", "好", "4.5", "1");
			//jsonObject = ParkApi.getParkAppraise("103");
			//jsonObject = ParkApi.doCollect("201", "13131", "1");
			//jsonObject = ParkApi.getCollects("13131", "1");
			//jsonObject = ParkApi.doComplain("101", "13131", "good");
			//jsonObject = ParkApi.searchPark("杭州", "13131");
			//jsonObject = ParkApi.doParkReservation("12", "13131", "22", "33", "1", "0", "1", "555");
			//jsonObject = ParkApi.getAdvertPictures();
			//jsonObject = ParkApi.getAirportIntroduction("88");
			//jsonObject = ParkApi.getPeccancy("15988845104", "13131");
			//jsonObject = ParkApi.getUserSex("15988845104");
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		response.getWriter().append(jsonObject.toString());
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
