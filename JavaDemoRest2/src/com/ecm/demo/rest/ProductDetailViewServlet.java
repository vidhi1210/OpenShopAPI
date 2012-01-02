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
	public static final String DW_HOST="http://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/products/";
	public static final String CLIENT_ID = "client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailViewServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//tomtom-xl-s
		String dwUrl = DW_HOST + request.getParameter("product_id") + "?" + CLIENT_ID ;
		String dwResponse = "";
		
		if(dwUrl != null || !dwUrl.equals("null")){
			// using Jersy API 
			Client client = Client.create();
			WebResource webResource = client.resource(dwUrl);
			dwResponse = webResource.get(String.class);
		}
		PrintWriter out = response.getWriter();
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
