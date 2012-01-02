package com.ecm.demo.rest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.NewCookie;
import javax.xml.bind.annotation.XmlRootElement;

import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

/**
 * Servlet implementation class AddToCartServlet
 */
public class AddToCartServlet extends HttpsServlet {
	private static final long serialVersionUID = 1L;

	public static final String DW_HOST="https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/basket/this/!add?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true";
	public static final String CLIENT_ID = "client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToCartServlet() {
		super();
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		addToCart(request, response);
	}

	private void addToCart(HttpServletRequest request, HttpServletResponse response) {
		String addToCartString = DW_HOST ;

		try {
			double quantity = Integer.parseInt(request.getParameter("quantity").toString());
			webResource = getClient().resource(addToCartString); 
			
			//Add cart cookies
			WebResource.Builder builder = webResource.getRequestBuilder();
			builder = setCookiesToRequest(builder, request);

			ClientResponse clientResponse = builder.type(MediaType.APPLICATION_JSON).post(ClientResponse.class, getProduct("882763039226", quantity));
			setLastETag(request, clientResponse);
			if( clientResponse.getCookies() != null &&  clientResponse.getCookies().size() > 0){
				request.getSession().setAttribute("cartCookies",  clientResponse.getCookies());
			}
			PrintWriter out = response.getWriter();
			String dwResponse = clientResponse.getEntity(String.class);
			out.println(dwResponse);
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + dwResponse);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	@POST @Produces("application/json")
	public ProductBean getProduct(String product_id, double quantity) {
		return new ProductBean(product_id, quantity);
	}
}

@XmlRootElement
class ProductBean{
	public String product_id;
	public double quantity;
	public ProductBean(String product_id, double quantity) {
		this.product_id = product_id;
		this.quantity = quantity;
	}	
}