package com.ecm.demo.rest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jersey.api.client.ClientResponse;
public class LogoutServlet extends HttpsServlet {
	private static final long serialVersionUID = 1L;
	public static final String DW_HOST= "https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/account/this/!login";
	public static final String SITE_NAME="JavaDemoRest2";
	public static final String CLIENT_ID = "client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		login(request, response);
	}
	
	public void login(HttpServletRequest request, HttpServletResponse response) {
		String logoutURL = DW_HOST + "?" + CLIENT_ID;

		try {
			webResource = getClient().resource(logoutURL); 
			ClientResponse res = webResource.get(ClientResponse.class);
			request.getSession().invalidate();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}



