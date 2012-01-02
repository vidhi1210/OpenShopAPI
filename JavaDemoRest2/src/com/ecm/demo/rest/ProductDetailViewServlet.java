package com.ecm.demo.rest;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

/**
 * Servlet implementation class ProductView
 */
public class ProductDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	public static final String DW_HOST="http://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/products/tomtom-xl-s?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true";
	public static final String QUERY = "q=";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String dwUrl = DW_HOST + "&" + QUERY + request.getParameter("q") ;
		out.println("dwurl:----------------"+ dwUrl);
		String dwResponse = "";
		
		if(dwUrl != null || !dwUrl.equals("null")){
			// using Jersy API 
			Client client = Client.create();
			WebResource webResource = client.resource(dwUrl);
			dwResponse = webResource.get(String.class);
		}
		
		out.println(dwResponse);
	}
	
	public static StringBuilder streamToBuffer(InputStream inputStream){
		BufferedReader reader;
		StringBuilder buffer = new StringBuilder();
		try {
			reader = new BufferedReader(new InputStreamReader(inputStream));
			String line = "";
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}	
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return buffer;
	}
	
	public static StringBuilder removeChars(String chars, StringBuilder buffer){
		int i = 0;
		while((i = buffer.indexOf(chars)) != -1){
			buffer.deleteCharAt(i);
		}
		return buffer;
	}

}
