package com.ecm.demo.rest;

import java.io.IOException;
import java.util.Iterator;
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
import com.sun.jersey.api.client.WebResource;

/**
 * Servlet implementation class ViewCart
 */
public class CheckoutCartServlet extends HttpsServlet {
	private static final long serialVersionUID = 1L;
       
	public static final String DW_HOST="https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/basket/this/!checkout";
	public static final String CLIENT_ID = "client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    
	//curl -i -b cookies.txt -c cookies.txt -H "Content-Type: application/json" -H "If-Match: $ETag" -X POST -k -d '{"first_name":"first","last_name":"last","address1":"mystreet 11","city":"city","postal_code":"12345"}' 'https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/checkout/this/!set_billing_address?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true'
	public static final String URL_BILLING_ADDRESS = "https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/checkout/this/!set_billing_address?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    
	public static final String URL_SHIPPING_ADDRESS = "https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/checkout/this/!set_shipping_address?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    
	//curl -i -b cookies.txt -c cookies.txt -H "Content-Type: application/json" -H "If-Match: $ETag" -X POST -k -d '{"id":"001"}' 'https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/checkout/this/!set_shipping_method?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true'
	public static final String URL_SHIPPING_METHOD ="https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/checkout/this/!set_shipping_method?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true";
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutCartServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		checkout(request,response);
	}

	public void checkout(HttpServletRequest request, HttpServletResponse response) {
		setBillingAddress(request, response);
		setShippingAddress(request, response);
		setShippingMethod(request, response);
	}
	
	public void setBillingAddress(HttpServletRequest request, HttpServletResponse response){
		setAddress(request, response, URL_BILLING_ADDRESS);
	}
	
	public void setShippingAddress(HttpServletRequest request, HttpServletResponse response){
		setAddress(request, response, URL_SHIPPING_ADDRESS);
	}
	
	public void setAddress(HttpServletRequest request, HttpServletResponse response, String url){
		webResource = getClient().resource(url); 
		
		//Add cart cookies
		WebResource.Builder builder = webResource.getRequestBuilder();
		
		builder = builder.header("If-Match", "*");
		List<NewCookie> cartCookies = (List<NewCookie>) request.getSession().getAttribute("cartCookies");
		if(cartCookies != null){
			for (Iterator iterator = cartCookies.iterator(); iterator.hasNext();) {
				 builder = builder.cookie((NewCookie) iterator.next());
			}
		}

		List<NewCookie> cookies = (List<NewCookie>) request.getSession().getAttribute("cookies");
		if(cookies != null){
			for (Iterator iterator = cookies.iterator(); iterator.hasNext();) {
				 builder = builder.cookie((NewCookie) iterator.next());
			}
		}
		
		ClientResponse res = builder.type(MediaType.APPLICATION_JSON).post(ClientResponse.class, getAddressBean("testFirst","testLast","testAddress1","testCity","testPostal_code"));
		String cartJSON = res.getEntity(String.class);
		System.out.println(">address>" + cartJSON);
	}
	
	public void setShippingMethod(HttpServletRequest request, HttpServletResponse response){
		
		webResource = getClient().resource(URL_SHIPPING_METHOD); 
		
		//Add cart cookies
		WebResource.Builder builder = webResource.getRequestBuilder();
		builder = builder.header("If-Match", "*");
		
		List<NewCookie> cartCookies = (List<NewCookie>) request.getSession().getAttribute("cartCookies");
		if(cartCookies != null){
			for (Iterator iterator = cartCookies.iterator(); iterator.hasNext();) {
				 builder = builder.cookie((NewCookie) iterator.next());
			}
		}

		List<NewCookie> cookies = (List<NewCookie>) request.getSession().getAttribute("cookies");
		if(cookies != null){
			for (Iterator iterator = cookies.iterator(); iterator.hasNext();) {
				 builder = builder.cookie((NewCookie) iterator.next());
			}
		}
		
		ClientResponse res = builder.type(MediaType.APPLICATION_JSON).post(ClientResponse.class, getShippngMethodBean("101"));
		String cartJSON = res.getEntity(String.class);
		System.out.println(">shipping method>" + cartJSON);
	}
	
	
	@GET @Produces("application/json")
	public AddressBean getAddressBean(String first_name, String last_name, String address1, String city, String postal_code) {
		return new AddressBean(first_name, last_name, address1, city, postal_code);
	}
	
	@GET @Produces("application/json")
	public ShippingMethodBean getShippngMethodBean(String id) {
		return new ShippingMethodBean(id);
	}
}

@XmlRootElement
class AddressBean{
	public String first_name;
	public String last_name;
	public String address1;
	public String city;
	public String postal_code;
	
	public AddressBean(String first_name, String last_name, String address1, String city, String postal_code){
		this.first_name = first_name;
		this.last_name = last_name;
		this.address1 = address1;
		this.city= city;
		this.postal_code = postal_code;
   }
}

@XmlRootElement
class ShippingMethodBean{
	public String id;
	
	public ShippingMethodBean(String id){
		this.id = id;
   }
}

