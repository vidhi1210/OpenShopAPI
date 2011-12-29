package com.ecm.demo.rest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.NewCookie;

import com.sun.jersey.api.client.WebResource;

/**
 * Servlet implementation class ViewCart
 */
public class ViewMiniCartServlet extends HttpsServlet {
	private static final long serialVersionUID = 1L;
       
	public static final String DW_URL="https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/basket/this?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true";
     
    public ViewMiniCartServlet() {
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
			List<NewCookie> cartCookies = (List<NewCookie>) request.getSession().getAttribute("cartCookies");
			if(cartCookies != null){
				for (Iterator iterator = cartCookies.iterator(); iterator.hasNext();) {
					 builder = builder.cookie((NewCookie) iterator.next());
				}
			}

			String s = builder.get(String.class);
		    PrintWriter out = response.getWriter();
			out.println(s);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}