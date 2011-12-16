package com.ecm.demo.rest;

import java.io.IOException;
import java.util.List;

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
			System.out.println(res);
			request.setAttribute("customerAccount", res);
			request.getRequestDispatcher("/customerAccount.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

