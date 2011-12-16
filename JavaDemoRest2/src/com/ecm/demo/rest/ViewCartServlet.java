package com.ecm.demo.rest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

/**
 * Servlet implementation class ViewCart
 */
public class ViewCartServlet extends HttpsServlet {
	private static final long serialVersionUID = 1L;
       
	public static final String DW_HOST="https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/basket/this/!checkout";
	public static final String CLIENT_ID = "client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCartServlet() {
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
		
		viewCart(request,response);
	}

	public void viewCart(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String viewCartString = DW_HOST + "?" + CLIENT_ID;
		
		try {
			webResource = getClient().resource(viewCartString); 
			String s = webResource.post(String.class);
			
			response.setContentType("text/xml");
		    PrintWriter out = response.getWriter();
			
			out.println(s);
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
