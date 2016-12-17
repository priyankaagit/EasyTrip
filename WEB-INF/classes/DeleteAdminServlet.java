import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.MySQLDataStoreUtilities;

public class DeleteAdminServlet<E> extends HttpServlet {

	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		RequestDispatcher rd;
		ServletContext sc = getServletContext();
			
		// Session and request variables
		HttpSession session = request.getSession(true);
		
		Enumeration<E> obj = (Enumeration<E>) request.getParameterNames();
		while (obj.hasMoreElements()) {

			String type = (String) obj.nextElement();

			if (type.equals("customerId")) {
				MySQLDataStoreUtilities.deleteCustomer(Integer.parseInt(request.getParameter("customerId")));
				rd = sc.getRequestDispatcher("/AddCustomerAdminMessage.jsp?action=delete");
				rd.forward(request, response);
			}
			if (type.equals("insuranceId")) {
				MySQLDataStoreUtilities.deleteInsurance(Integer.parseInt(request.getParameter("insuranceId")));
				rd = sc.getRequestDispatcher("/UpdateInsuranceMessage.jsp?action=delete");
				rd.forward(request, response);
			}

			if (type.equals("locationId")) {
				MySQLDataStoreUtilities.deleteLocation(Integer.parseInt(request.getParameter("locationId")));
				rd = sc.getRequestDispatcher("/AddLocationAdminMessage.jsp?action=delete");
				rd.forward(request, response);
			}
			if (type.equals("vehicleVin")) {
				MySQLDataStoreUtilities.deleteVehicle(request.getParameter("vehicleVin"));
				rd = sc.getRequestDispatcher("/AddVehicleAdminMessage.jsp?action=delete");
				rd.forward(request, response);
			}

			if (type.equals("vehicleId")) {
				MySQLDataStoreUtilities.deleteVehicleInfo(request.getParameter("vehicleId"));
				rd = sc.getRequestDispatcher("/AddVehicleAdminMessage.jsp?action=delete");
				rd.forward(request, response);
			}
			if (type.equals("accId")) {
				MySQLDataStoreUtilities.deleteAccessory(Integer.parseInt(request.getParameter("accId")));
				rd = sc.getRequestDispatcher("/AddAccessoryAdminMessage.jsp?action=delete");
				rd.forward(request, response);
			}
			
		}

		//
		// Vehicle addVehicleAdminObject = new Vehicle(vehicleId, vehicleVin,
		// vehicleModel, vehicleMake, locationId,
		// vehicleType, vehicleImage);
		//
		// MySQLDataStoreUtilities.enterVehicle(addVehicleAdminObject);

		

		// session.setAttribute("firstName", firstName);
		// session.setAttribute("lastName", lastName);
		// Retrieving vehicles Info from vehiclesInfo table

		

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		processRequest(request, response);
	}
}
