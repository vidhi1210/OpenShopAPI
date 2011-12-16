package com.ecm.demo.rest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.NewCookie;
import javax.xml.bind.annotation.XmlRootElement;

import com.sun.jersey.api.client.ClientResponse;

/**
 * Servlet implementation class AddToCartServlet
 */
public class AddToCartServlet extends HttpsServlet {
	private static final long serialVersionUID = 1L;

	public static final String DW_HOST="https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/basket/this/!add";
	public static final String CLIENT_ID = "client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
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
		addToCart(request, response);
		
		// https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/basket/this/!add?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true&format=xml
	}

	private void addToCart(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String addToCartString = DW_HOST + "?" + CLIENT_ID;
		
		try {
			System.out.println("AddToCartServlet.addToCart()"+request.getParameter("product_id"));
			String quantity = request.getParameter("quantity");
			
			int iQuantity = Integer.parseInt(quantity);
			
			//System.out.println("AddToCartServlet.addToCart()"+request.getParameter("productprice"));
			webResource = getClient().resource(addToCartString); 
			ClientResponse res = webResource.type(MediaType.APPLICATION_JSON).post(ClientResponse.class, getProduct(request.getParameter("product_id").toString(), iQuantity));
			List<NewCookie> cookies = res.getCookies();
			System.out.println("++++++++AddToCartServlet.addToCart()"+res);
			System.out.println("++++++++AddToCartServlet.addToCart()"+cookies);
			String eTag = res.getHeaders().get("ETag").toString();
			
			System.out.println("AddToCartServlet.addToCart()++++++++++++++++++++"+eTag);
			
			if(cookies.size() > 0){
				request.getSession(true).setAttribute("cookies", cookies);
				request.getSession(true).setAttribute("ETag", eTag);
				request.getRequestDispatcher("/productSearchResult.jsp").forward(request, response);
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

@GET @Produces("application/json")
	public ProductBean getProduct(String product_id, int quantity) {
			//return new LoginBean("patricia@demandware.com", "demandware1");
			return new ProductBean(product_id, quantity);
		}

	@XmlRootElement
	class ProductBean{
		public String product_id;
		public int quantity;
		public ProductBean(String product_id, int quantity) {
			this.product_id = product_id;
			this.quantity = quantity;
		}	
	}

}
