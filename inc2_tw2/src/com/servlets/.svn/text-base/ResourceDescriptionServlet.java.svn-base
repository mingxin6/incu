package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.MySQLAccess;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.model.ServiceResourceData;

public class ResourceDescriptionServlet extends HttpServlet {
	// public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	// {
	//
	// // Use "request" to read incoming HTTP headers (e.g. cookies)
	// // and HTML form data (e.g. data the user entered and submitted)
	//
	// // Use "response" to specify the HTTP response line and headers
	// // (e.g. specifying the content type, setting cookies).
	//
	// PrintWriter out = response.getWriter();
	// // Use "out" to send content to browser
	// }

	// protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
	// IOException {
	//
	// String country = request.getParameter("countryname");
	// Map<String, String> ind = new LinkedHashMap<String, String>();
	// ind.put("1", "New delhi");
	// ind.put("2", "Tamil Nadu");
	// ind.put("3", "Kerala");
	// ind.put("4", "Andhra Pradesh");
	//
	// Map<String, String> us = new LinkedHashMap<String, String>();
	// us.put("1", "Washington");
	// us.put("2", "California");
	// us.put("3", "Florida");
	// us.put("4", "New York");
	//
	// Gson gson = new Gson();
	// JsonObject myObj = new JsonObject();
	//
	//
	//
	//
	// String json = null;
	// if (country.equals("India")) {
	// json = new Gson().toJson(ind);
	// } else if (country.equals("US")) {
	// json = new Gson().toJson(us);
	// }
	//
	//
	//
	//
	// response.setContentType("application/json");
	// response.setCharacterEncoding("UTF-8");
	// response.getWriter().write(json);
	// }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {

		String srcid = request.getParameter("srcid");
		
		System.out.println("ResourceDescriptionServlet,,,   srcid=" + srcid);

		MySQLAccess db = new MySQLAccess();
		ServiceResourceData srcData = db.readServiceResourceDataByID(srcid);

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		response.setHeader("Cache-control", "no-cache, no-store");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "-1");

		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "POST");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type");
		response.setHeader("Access-Control-Max-Age", "86400");

		JsonObject myObj = new JsonObject();
		// ---------------------------------------------------------
		if (srcData == null) {
			myObj.addProperty("success", false);
		} else {
			myObj.addProperty("success", true);

			Gson gson = new Gson();
			JsonElement srcObj = gson.toJsonTree(srcData);
			myObj.add("srcInfo", srcObj);
		}

		// ---------------------------------------------------------
		out.println(myObj.toString());
		
		System.out.println("ResourceDescriptionServlet,,,   myObj.toString()=" + myObj.toString());
		
		out.close();
	}

	// Get Country Information
	// private Country getInfo(String countryCode) {
	//
	// Country country = new Country();
	// Connection conn = null;
	// PreparedStatement stmt = null;
	// String sql = null;
	//
	// try {
	// Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	// conn = ((DataSource) ctx.lookup("jdbc/mysql")).getConnection();
	//
	// sql = "Select * from COUNTRY where code = ?";
	// stmt = conn.prepareStatement(sql);
	// stmt.setString(1, countryCode.trim());
	// ResultSet rs = stmt.executeQuery();
	//
	// while (rs.next()) {
	// country.setCode(rs.getString("code").trim());
	// country.setName(rs.getString("name").trim());
	// country.setContinent(rs.getString("continent").trim());
	// country.setRegion(rs.getString("region").trim());
	// country.setLifeExpectancy(rs.getString("lifeExpectancy") == null ? new Double(0) : Double
	// .parseDouble(rs.getString("lifeExpectancy").trim()));
	// country.setGnp(rs.getString("gnp") == null ? new Double(0) : Double.parseDouble(rs.getString("gnp")
	// .trim()));
	// }
	//
	// rs.close();
	// stmt.close();
	// stmt = null;
	//
	// conn.close();
	// conn = null;
	//
	// } catch (Exception e) {
	// System.out.println(e);
	// }
	//
	// finally {
	//
	// if (stmt != null) {
	// try {
	// stmt.close();
	// } catch (SQLException sqlex) {
	// // ignore -- as we can't do anything about it here
	// }
	//
	// stmt = null;
	// }
	//
	// if (conn != null) {
	// try {
	// conn.close();
	// } catch (SQLException sqlex) {
	// // ignore -- as we can't do anything about it here
	// }
	//
	// conn = null;
	// }
	// }
	//
	// return country;
	//
	// }

}