package com.ecm.demo.rest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

/**
 * Servlet implementation class ViewCart
 * @author Harsh Modha
 */
public class ViewCartServlet extends HttpsServlet {
	private static final long serialVersionUID = 1L;
       
	public static final String DW_URL="https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/basket/this?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true";
     
    public ViewCartServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		viewCart(request,response);
	}

	public void viewCart(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			webResource = getClient().resource(DW_URL); 
			WebResource.Builder builder = webResource.getRequestBuilder();
			builder = setCookiesToRequest(builder, request);

			ClientResponse clientResponse = builder.get(ClientResponse.class);
			setLastETag(request, clientResponse);
		    PrintWriter out = response.getWriter();
			out.println(clientResponse.getEntity(String.class));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
