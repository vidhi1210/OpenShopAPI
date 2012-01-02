package com.ecm.demo.rest;

import java.util.Iterator;
import java.util.List;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.NewCookie;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.LoggingFilter;
import com.sun.jersey.api.json.JSONConfiguration;
import com.sun.jersey.client.urlconnection.HTTPSProperties;

/**
 * 
 * @author Harsh Modha
 *
 */
public class HttpsServlet extends HttpServlet {

	protected static Client client = null;
	protected WebResource webResource = null;

	public Client getClient(){
		if(client == null){
			ClientConfig config = new DefaultClientConfig();
			config.getProperties().put(HTTPSProperties.PROPERTY_HTTPS_PROPERTIES, new HTTPSProperties(getHostnameVerifier(), getSSLContext()));
			config.getFeatures().put(JSONConfiguration.FEATURE_POJO_MAPPING, Boolean.TRUE);
			client = Client.create(config);
			client.addFilter(new LoggingFilter(System.out));
		}
		return client;
	}


	protected HostnameVerifier getHostnameVerifier() {
		return new HostnameVerifier() {
			@Override
			public boolean verify(String hostname, javax.net.ssl.SSLSession sslSession) {
				return true;
			}
		};
	}

	protected SSLContext getSSLContext() {
		javax.net.ssl.TrustManager x509 = new javax.net.ssl.X509TrustManager() {

			@Override
			public void checkClientTrusted(java.security.cert.X509Certificate[] arg0, String arg1) throws java.security.cert.CertificateException {
				return;
			}

			@Override
			public void checkServerTrusted(java.security.cert.X509Certificate[] arg0, String arg1) throws java.security.cert.CertificateException {
				return;
			}

			@Override
			public java.security.cert.X509Certificate[] getAcceptedIssuers() {
				return null;
			}
		};
		SSLContext ctx = null;
		try {
			System.out.println("=====================================================HttpsServlet.getSSLContext()");
			ctx = SSLContext.getInstance("SSL");
			ctx.init(null, new javax.net.ssl.TrustManager[]{x509}, null);
		} catch (java.security.GeneralSecurityException ex) {
		}
		return ctx;
	}

	public String getLastETag(HttpServletRequest req){
		if(req.getSession() != null && req.getSession().getAttribute("lastETag") != null ){
			return (String)req.getSession().getAttribute("lastETag");
		} else {
			return "" ;
		}
	}

	public void setLastETag(HttpServletRequest req, ClientResponse clientResponse){
		if(clientResponse.getHeaders() != null && clientResponse.getHeaders().get("ETag") != null){
			String eTag = clientResponse.getHeaders().get("ETag").toString();
			if(eTag != null) {
				StringBuilder eTagBuffer = new StringBuilder(eTag);
				eTagBuffer = eTagBuffer.deleteCharAt(0);
				eTagBuffer.deleteCharAt(eTagBuffer.length()-1);
				req.getSession().setAttribute("lastETag", eTagBuffer.toString());
			}
		}
	}

	public WebResource.Builder setCookiesToRequest(WebResource.Builder builder, HttpServletRequest request){
		builder = builder.header("If-Match", getLastETag(request));

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
		return builder;
	}
}



