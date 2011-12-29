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
public class LoginServlet extends HttpsServlet {
	private static final long serialVersionUID = 1L;
	public static final String DW_HOST= "https://demo.ocapi.demandware.net/s/Demos-SiteGenesis-Site/dw/shop/v1/account/this/!login";
	public static final String SITE_NAME="JavaDemoRest2";
	public static final String CLIENT_ID = "client_id=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		login(request, response);
	}
	
	public void login(HttpServletRequest request, HttpServletResponse response) {
		String loginURL = DW_HOST + "?" + CLIENT_ID;

		try {
			webResource = getClient().resource(loginURL); 
			ClientResponse res = webResource.type(MediaType.APPLICATION_JSON).post(ClientResponse.class, getMyBean(request.getParameter("login").toString(), request.getParameter("password").toString()));
			List<NewCookie> cookies = res.getCookies();
			if(cookies.size() > 0){
				request.getSession(true).setAttribute("cookies", cookies);
				request.getSession().setAttribute("currentUserName", request.getParameter("login").toString());
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
			else{			
				request.getRequestDispatcher("/unauthorized.jsp").forward(request, response);				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@GET @Produces("application/json")
	public LoginBean getMyBean(String login, String password) {
		//return new LoginBean("patricia@demandware.com", "demandware1");
		return new LoginBean(login, password);
	}
}

@XmlRootElement
class LoginBean{
	public String login;
	public String password;
	public LoginBean(String login, String password) {
		this.login = login;
		this.password = password;
	}
}


