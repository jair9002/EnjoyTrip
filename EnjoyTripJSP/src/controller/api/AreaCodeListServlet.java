package controller.api;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.google.gson.Gson;

// FrontEnd / project / trip / areaCodeList 대응
@WebServlet("/trip/areaCode")
public class AreaCodeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private final String serviceId = "areaCode1";
    private final String serviceKey = "%2FicmQTs5MjuIFEvZGKIEXYvEk8TrlUIKAjQqVdKo9AYjjzNmHJmNb%2Bn1yM7QxiPHhqOI%2BDg7%2BwfOVyDkaRjvxg%3D%3D";
    private String serviceUrl = "";
    private String MobileOS = "ETC";
    private String MobileApp = "TestApp";
    private String _type = "json";
	private String numOfRows;
	private String pageNo;

	private String getServiceURL(String areaCode) {
		StringBuilder sb = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/");
		sb.append(serviceId)
			.append("?serviceKey=").append(serviceKey)
			.append("&numOfRows=").append(numOfRows)
			.append("&pageNo=").append(pageNo)
			.append("&MobileOS=").append(MobileOS)
			.append("&MobileOS=").append(MobileOS)
			.append("&MobileApp=").append(MobileApp)
			.append("&_type=").append(_type)
			.append("&areaCode=").append(areaCode);
		return sb.toString();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// parameter
		String numOfRows = request.getParameter("numOfRows");
		if( numOfRows == null ) this.numOfRows = "10";
		
		String pageNo = request.getParameter("pageNo");
		if( pageNo == null ) this.pageNo = "1";
		
		String areaCode = request.getParameter("areaCode");
		areaCode = areaCode == null || "".equals(areaCode) ? "" : areaCode;
		this.serviceUrl = getServiceURL(areaCode);
		
		// data request
		URL url = new URL(this.serviceUrl);
		
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        //conn.setRequestProperty("Content-type", "application/jdson");
        System.out.println("Response code: " + conn.getResponseCode());
        
        BufferedReader br;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder result = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
        	result.append(line);
        }
        br.close();
        conn.disconnect();
        
        System.out.println(result.toString());
        
		response.addHeader("Access-Control-Allow-Origin", "*"); // VSCode Live Server Request
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write(result.toString());
        
	}

}
