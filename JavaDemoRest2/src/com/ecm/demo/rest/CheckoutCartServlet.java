package com.ecm.demo.rest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.annotation.XmlRootElement;

import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

/**
 * Servlet implementation class CheckoutServlet
 * @author Harsh Modha
 */
public class CheckoutCartServlet extends HttpsServlet {
	private static final long serialVersionUID = 1L;
	
	//curl -i -b cookies.txt -c cookies.txt  -H "If-Match: $ETag" -X POST -k 'https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/basket/this/!checkout?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true'
	public static final String URL_SET_CHECKOUT = "https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/basket/this/!checkout?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true";
	
	//curl -i -b cookies.txt -c cookies.txt -H "Content-Type: application/json" -H "If-Match: $ETag" -X POST -k -d '{"first_name":"first","last_name":"last","address1":"mystreet 11","city":"city","postal_code":"12345"}' 'https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/checkout/this/!set_billing_address?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true'
	public static final String URL_BILLING_ADDRESS = "https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/checkout/this/!set_billing_address?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    
	public static final String URL_SHIPPING_ADDRESS = "https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/checkout/this/!set_shipping_address?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    
	//curl -i -b cookies.txt -c cookies.txt -H "Content-Type: application/json" -H "If-Match: $ETag" -X POST -k -d '{"id":"001"}' 'https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/checkout/this/!set_shipping_method?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true'
	public static final String URL_SHIPPING_METHOD ="https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/checkout/this/!set_shipping_method?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true";
	
	//curl -i -b cookies.txt -c cookies.txt -H "Content-Type: application/json" -H "If-Match: $ETag" -X POST -k -d '{"payment_card":{"card_type":"Visa","holder":"holder","number":"4111111111111111","expiration_month":8,"expiration_year":2012,"security_code":"123"}}' 'https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/checkout/this/!submit?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true'
	public static final String URL_SUBMIT_CHECKOUT ="https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/checkout/this/!submit?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true";

	
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

	public void checkout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		setCheckout(request, response);
		setBillingAddress(request, response);
		setShippingAddress(request, response);
		setShippingMethod(request, response);
		submitCheckout(request, response);
	}
	
	public void setBillingAddress(HttpServletRequest request, HttpServletResponse response){
		setAddress(request, response, URL_BILLING_ADDRESS);
	}
	
	public void setShippingAddress(HttpServletRequest request, HttpServletResponse response){
		setAddress(request, response, URL_SHIPPING_ADDRESS);
	}
	
	public void setCheckout(HttpServletRequest request, HttpServletResponse response){
		webResource = getClient().resource(URL_SET_CHECKOUT); 
		WebResource.Builder builder = webResource.getRequestBuilder();
		builder = setCookiesToRequest(builder, request);
		
		ClientResponse clientResponse = builder.type(MediaType.APPLICATION_JSON).post(ClientResponse.class);
		setLastETag(request, clientResponse);
	}

	
	public void setShippingMethod(HttpServletRequest request, HttpServletResponse response){
		webResource = getClient().resource(URL_SHIPPING_METHOD); 
		WebResource.Builder builder = webResource.getRequestBuilder();
		builder = setCookiesToRequest(builder, request);
		
		ClientResponse clientResponse = builder.type(MediaType.APPLICATION_JSON).post(ClientResponse.class, getShippngMethodBean("001"));
		setLastETag(request, clientResponse);
	}
	
	public void submitCheckout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		webResource = getClient().resource(URL_SUBMIT_CHECKOUT); 
		WebResource.Builder builder = webResource.getRequestBuilder();
		builder = setCookiesToRequest(builder, request);		
		
		ClientResponse clientResponse = builder.type(MediaType.APPLICATION_JSON).post(ClientResponse.class, new PaymentCardBean(new Payment_CardDetailBean("Visa","holder","4111111111111111",8,2012,"123")));
		setLastETag(request, clientResponse);
		String orderConfirmation = clientResponse.getEntity(String.class);
		
		/*PrintWriter out = response.getWriter();
		out.println(dwResponse);*/
		
		request.setAttribute("orderconfirmation", orderConfirmation);
		request.getRequestDispatcher("/thankYou.jsp").forward(request, response);	
	}
	
	
	public void setAddress(HttpServletRequest request, HttpServletResponse response, String url){
		webResource = getClient().resource(url); 
		WebResource.Builder builder = webResource.getRequestBuilder();
		builder = setCookiesToRequest(builder, request);
		
		ClientResponse clientResponse = builder.type(MediaType.APPLICATION_JSON).post(ClientResponse.class, getAddressBean("testFirst","testLast","testAddress1","testCity","testPostal_code"));
		setLastETag(request, clientResponse);
	}
	
	
	@GET @Produces("application/json")
	public AddressBean getAddressBean(String first_name, String last_name, String address1, String city, String postal_code) {
		return new AddressBean(first_name, last_name, address1, city, postal_code);
	}
	
	@GET @Produces("application/json")
	public ShippingMethodBean getShippngMethodBean(String id) {
		return new ShippingMethodBean(id);
	}
	
	@GET @Produces("application/json")
	public Payment_CardDetailBean getPaymentCardDetailBean(String card_type, String holder, String number, int expiration_month, int expriation_year, String security_code ){
		return new Payment_CardDetailBean(card_type, holder, number, expiration_month, expriation_year, security_code );
	}
	
	@GET @Produces("application/json")
	public PaymentCardBean getPaymentCardBean(Payment_CardDetailBean payment_card ){
		return new PaymentCardBean(payment_card);
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

@XmlRootElement
class PaymentCardBean{
	public Payment_CardDetailBean payment_card;
	
	public PaymentCardBean(Payment_CardDetailBean payment_card){
		this.payment_card = payment_card;
   }
}

class Payment_CardDetailBean{
	public String card_type;
	public String holder;
	public String number;
	public int expiration_month;
	public int expiration_year;
	public String security_code;
	
	public Payment_CardDetailBean(String card_type, String holder, String number, int expiration_month, int expriation_year, String security_code ){
		this.card_type = card_type;
		this.holder = holder;
		this.number= number;
		this.expiration_month = expiration_month;
		this.expiration_year = expriation_year;
		this.security_code = security_code;
	}
}

