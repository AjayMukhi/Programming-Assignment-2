
package com.validation;


import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.annotation.ManagedBean;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;

import javax.validation.constraints.Min;
import javax.validation.Valid;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * Servlet implementation class processCustData
 */
@ManagedBean
public class processCustData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    @NotNull(message="Email Address is compulsory") 
    @Min(value = 7, message = "Email Address must be greater than or equal to 7 Characters")
	@Pattern(regexp = "[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+",message = "Email Address is not a valid format")
	private String custEmail;
    
    
    @NotNull(message="Zip Code is compulsory") 
    @Pattern(regexp="^[0-9]{5}(?:-[0-9]{4})?$+",message = "Zip Code must be valid")
    private String zipcode;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public processCustData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		System.out.println("Now in the servlet.....");
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();
	    
	    HttpSession session=request.getSession(); 
	    
	    
	    custEmail =(String)request.getAttribute("custEmail");
	    System.out.println(custEmail);
        	    
	    zipcode =(String) request.getAttribute("zipcode");
	    System.out.println("Zipcode:"+zipcode);
	    
	    
	    String street =(String) request.getAttribute("street");
	    System.out.println("Street:"+street);
	    
	    String city =(String) request.getAttribute("city");
	    System.out.println("City:"+city);
	    
	    String state =(String) request.getAttribute("state");
	    System.out.println("State:"+state);
	    
	    
	    
	    String postcode= street+zipcode+city+state;
	    
	    String latLongs[];
		try {
			latLongs = getLatLongPositions(postcode);
			System.out.println("Latitude: "+latLongs[0]+" and Longitude: "+latLongs[1]);
			
			request.setAttribute("latitude",latLongs[0]);
			request.setAttribute("longitude",latLongs[1]);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	        
	    
	      
	    ServletContext sc = this.getServletContext();	    
	    RequestDispatcher rd = sc.getRequestDispatcher("/ProcessCustomerDataRequest.jsp");
	    rd.forward(request, response);
	    //response.sendRedirect("ProcessCustomerDataRequest.jsp");
	    
		
		
		
	}

  public static String[] getLatLongPositions(String address) throws Exception
  {
    int responseCode = 0;
    String goo_api = "http://maps.googleapis.com/maps/api/geocode/xml?address=" + URLEncoder.encode(address, "UTF-8") + "&sensor=true";
    URL url = new URL(goo_api);
    HttpURLConnection httpConnection = (HttpURLConnection)url.openConnection();
    httpConnection.connect();
    responseCode = httpConnection.getResponseCode();
    System.out.println("responseCode::"+responseCode);
    //This will check whether it is getting the 200 ok response from the server
    if(responseCode == 200)
    {
      DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();;
      Document doc = builder.parse(httpConnection.getInputStream());
      XPathFactory xPathfactory = XPathFactory.newInstance();
      XPath xpath = xPathfactory.newXPath();
      XPathExpression expression = xpath.compile("/GeocodeResponse/status");
      String status = (String)expression.evaluate(doc, XPathConstants.STRING);
      if(status.equals("OK"))
      {
    	  expression = xpath.compile("//geometry/location/lat");
    	  
    	  
          String latitude = (String)expression.evaluate(doc, XPathConstants.STRING);
          expression = xpath.compile("//geometry/location/lng");
          
          
          String longitude = (String)expression.evaluate(doc, XPathConstants.STRING);
          return new String[] {latitude, longitude};
      }
      else
      {
         throw new Exception("Error -----response status: "+status);
      }
    }
    return null;
  }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("11111");
		doGet(request, response);
		
		    
		
	}

}
