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

/** Test comment
 * Servlet implementation class MenuServlet
 */
public class MenuServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public static final String DW_HOST="http://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/categories/root?levels=2&client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true";
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		String dwUrl = DW_HOST;

		// using Jersy API
		Client client = Client.create();
		WebResource webResource = client.resource(dwUrl);
		String s = webResource.get(String.class);
				
		response.setContentType("text/xml");
	    PrintWriter out = response.getWriter();
		
		out.println(s);
			
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
