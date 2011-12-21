package com.ecm.demo.rest;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.NewCookie;

import com.sun.jersey.api.client.WebResource;
public class CustomerAccountServlet extends HttpsServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getAccount(request, response);
	}

	protected void getAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			webResource = getClient().resource("https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/account/this?client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&pretty_print=true");
			WebResource.Builder builder = webResource.getRequestBuilder();
			for (NewCookie c : (List<NewCookie>)request.getSession().getAttribute("cookies")) {
			    builder = builder.cookie(c);
			}
			
			Object res = builder.get(Object.class);
				StringTokenizer sto = new StringTokenizer(res.toString(),",");
			Hashtable accountDetails = new Hashtable();
			StringBuilder sb1 = new StringBuilder();
			Object sb = new StringBuilder();
						while (sto.hasMoreElements()) {
				Object object = (Object) sto.nextElement();
				StringTokenizer tkn1 = new StringTokenizer(object.toString(),"=");
				while (tkn1.hasMoreElements()) {
					Object tk1 = (Object) tkn1.nextElement();
					Object tk2 = (Object) tkn1.nextElement();
					accountDetails.put(tk1.toString().trim(), tk2.toString().trim());
							}
		
				sb=accountDetails.get(new String("first_name"));
				
			}
			res = sb;
		
			
		        
			request.setAttribute("customerAccount", res);
			
			request.getRequestDispatcher("/customerAccount.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

