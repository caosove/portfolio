package it.will.kingsmap.dao.mapper;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.net.URL;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import sun.net.www.protocol.http.HttpURLConnection;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;



//?��거래�? 빌라
public class getsill {

	private final String USER_AGENT = "Mozilla/5.0";
	

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub

		getsill http = new getsill();
		http.powerget();
	}

	private void powerget() throws Exception {
		
		String[] year = new String[]{
				"201801",
				"201802",
				"201803",
				"201804",
				"201805",
				"201806",
				"201807",
				"201808",
				"201809",
				"201810",
				"201811",
				"201812"
		};
	
		
		for(int k=0 ; k < year.length ; k++) {
			
		String url = "http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade?ServiceKey=%2FKl0vUOwZ406M8MbB8UgLxl99ToC5OXj8cvsdbFWZr7ixj9KIn8hG79MOc3djnnOIR0%2FXz1Jd9IKKoL4H7WtFg%3D%3D&LAWD_CD=26290&DEAL_YMD="+year[k];
		Node node1 = null;
		Node node2 = null;
		Node node3 = null;
		Node node4 = null;
		Node node5 = null;
		Node node6 = null;
		Node node7 = null;
		Node node8 = null;
		Node node9 = null;
		Node node10 = null;
		Node node11 = null;
		Node node12 = null;
		
		

		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.getResponseCode();

		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			System.out.println(inputLine);
			response.append(inputLine);
		}
		in.close();
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();

			FileOutputStream output = new FileOutputStream("./getsill");
			output.write(response.toString().getBytes());
			output.close();

			Document doc = dBuilder.parse("./getsill");
			doc.getDocumentElement().normalize();

			Element body = (Element) doc.getElementsByTagName("body").item(0);
			Element items = (Element) body.getElementsByTagName("items").item(0);			
			int count = items.getElementsByTagName("item").getLength();
			
			String billCost = null;
			String billBuildyear = null;
			String billYear = null;
			String billDe = null;
			String billArea;
			String billName;
			String billMonth;
			String billDay;
			String billJeon;
			String billJibun;
			String billCode;
			String billFloor;
			
			for (int i = 0; i < count; i++) {

				Element item = (Element) items.getElementsByTagName("item").item(i);
					
				node1 = item.getElementsByTagName("거래금액").item(0);			
				node2 = item.getElementsByTagName("건축년도").item(0);									
				node3 = item.getElementsByTagName("년").item(0);
				node4 = item.getElementsByTagName("대지권면적").item(0);
				node5 = item.getElementsByTagName("법정동").item(0);
				node6 = item.getElementsByTagName("연립다세대").item(0);
				node7 = item.getElementsByTagName("월").item(0);
				node8 = item.getElementsByTagName("일").item(0);
				node9 = item.getElementsByTagName("전용면적").item(0);
				node10 = item.getElementsByTagName("지번").item(0);
				node11 = item.getElementsByTagName("지역코드").item(0);
				node12 = item.getElementsByTagName("층").item(0);
				

			
		
				
				billCost = node1.getChildNodes().item(0).getNodeValue();
				System.out.println(node1.getNodeName());
				System.out.println(billCost);
						
				if(node2==null){
					billBuildyear = "확인중";
					System.out.println("확인중.");	
				}else {
					billBuildyear = node2.getChildNodes().item(0).getNodeValue();
					System.out.println(node2.getNodeName());
					System.out.println(node2.getChildNodes().item(0).getNodeValue());
				}
				if(node3==null){					
					System.out.println("확인중.");
					billYear = "확인중";
				}else {
					billYear = node3.getChildNodes().item(0).getNodeValue();
					System.out.println(node3.getNodeName());
					System.out.println(node3.getChildNodes().item(0).getNodeValue());
				}
				if(node4==null){
					billDe = "확인중";
					System.out.println("확인중.");	
				}else {
					billDe = node4.getChildNodes().item(0).getNodeValue();
					System.out.println(node4.getNodeName());
					System.out.println(node4.getChildNodes().item(0).getNodeValue());
				}
				if(node5==null){	
					billArea = "확인중";
					System.out.println("확인중.");	
				}else {
					billArea = node5.getChildNodes().item(0).getNodeValue();
					System.out.println(node5.getNodeName());
					System.out.println(node5.getChildNodes().item(0).getNodeValue());
				}
				if(node6==null){
					billName = "확인중";
					System.out.println("확인중.");	
				}else {
					billName = node6.getChildNodes().item(0).getNodeValue();
					System.out.println(node6.getNodeName());
					System.out.println(node6.getChildNodes().item(0).getNodeValue());
				}
				if(node7==null){
					billMonth = "확인중";
					System.out.println("확인중.");	
				}else {
					billMonth = node7.getChildNodes().item(0).getNodeValue();
					System.out.println(node7.getNodeName());
					System.out.println(node7.getChildNodes().item(0).getNodeValue());
				}
				if(node8==null){
					billDay = "확인중";
					System.out.println("확인중.");	
				}else {
					billDay = node8.getChildNodes().item(0).getNodeValue();
					System.out.println(node8.getNodeName());
					System.out.println(node8.getChildNodes().item(0).getNodeValue());
				}
				if(node9==null){
					billJeon = "확인중";
					System.out.println("확인중.");	
				}else {
					billJeon = node9.getChildNodes().item(0).getNodeValue();
					System.out.println(node9.getNodeName());
					System.out.println(node9.getChildNodes().item(0).getNodeValue());
				}
				if(node10==null){	
					billJibun="확인중";
					System.out.println("확인중.");	
				}else {
					billJibun=node10.getChildNodes().item(0).getNodeValue();
					System.out.println(node10.getNodeName());
					System.out.println(node10.getChildNodes().item(0).getNodeValue());
				}
				if(node11==null){
					billCode = "확인중";
					System.out.println("확인중.");	
				}else {
					billCode= node11.getChildNodes().item(0).getNodeValue();
					System.out.println(node11.getNodeName());
					System.out.println(node11.getChildNodes().item(0).getNodeValue());
				}
				if(node12==null){
					billFloor="확인중";
					System.out.println("확인중.");	
				}else {
					billFloor = node12.getChildNodes().item(0).getNodeValue();
					System.out.println(node12.getNodeName());
					System.out.println(node12.getChildNodes().item(0).getNodeValue());
				}
				
				//GetbilllaDTO bdto = new GetbilllaDTO(billCost, billBuildyear, billYear, billDe, billArea, billName, billMonth, billDay, billJeon, billJibun, billCode, billFloor);
				//UserDAO dao = new UserDAO();
				//dao.insertbillla(bdto);
				//dao.insertbillla(billCost, billBuildyear, billYear, billDe, billArea, billName, billMonth, billDay, billJeon, billJibun, billCode, billFloor);
					
			}
			System.out.println("===================="+count);
			
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
}
