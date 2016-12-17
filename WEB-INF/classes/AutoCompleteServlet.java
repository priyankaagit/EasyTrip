
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.*;
import java.util.Iterator;

import utilityClasses.*;
import vehiclePackage.*;

public class AutoCompleteServlet extends HttpServlet {
	
	HashMap<Integer, Location> locationMap = new HashMap<Integer, Location>();
	
	public void init()
	{
		//loadDataFromMySQL();
	}
	
	void loadDataFromMySQL()
	{
		try{
			locationMap = AjaxUtility.getLocationsFromMySQL();
		
		}catch(Exception E){
		System.out.println("Exception");
		}
	}


    private ServletContext context;

    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
				
		loadDataFromMySQL();

        String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        StringBuffer sb = new StringBuffer();

        if (targetId != null) {
            targetId = targetId.trim().toLowerCase();
        } else {
            context.getRequestDispatcher("/error.jsp").forward(request, response);
        }

        boolean namesAdded = false;
        if (action.equals("complete")) {

            // check if user sent empty string
            if (!targetId.equals("")) {

                Iterator it = locationMap.keySet().iterator();

                while (it.hasNext()) {
                    Integer id = (Integer) it.next();
                    Location location = (Location) locationMap.get(id);

                    if ( // targetId matches location name
                         location.getLocationName().toLowerCase().startsWith(targetId) ||
                         // targetId matches location city
                         location.getLocationCity().toLowerCase().startsWith(targetId)
                         )
					 {
				
                        sb.append("<location>");
                        sb.append("<id>" + location.getLocationid() + "</id>");
                        sb.append("<name>" + location.getLocationName() + "</name>");
                        sb.append("<city>" + location.getLocationCity() + "</city>");
                        sb.append("</location>");
                        namesAdded = true;
						
                    }
					
                }
            }

            if (namesAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<locations>" + sb.toString() + "</locations>");
            } else {
                //nothing to show
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }

        if (action.equals("lookup")) {

            // put the target composer in the request scope to display 
            //if ((targetId != null) && locationMap.containsKey(targetId.trim())) {
                request.setAttribute("product", locationMap.get(targetId));
				request.setAttribute("productName", targetId);
                context.getRequestDispatcher("/ShowSearchedProductServlet").forward(request, response);
				//context.getRequestDispatcher("/Home.jsp").forward(request, response);
            //}
        }
    }
}
