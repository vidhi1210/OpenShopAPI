package com.ecm.demo.rest;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.servlet.http.HttpServlet;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
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
}



