import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.MySQLDataStoreUtilities;
import vehiclePackage.Vehicle;

public class UpdateVehicleAdminServlet extends HttpServlet {

	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		// Session and request variables
		HttpSession session = request.getSession(true);

		String vehicleVin = request.getParameter("vehicleVin");
		String vehicleId = request.getParameter("vehicleId");
		String vehicleMake = request.getParameter("vehicleMake");
		String vehicleModel = request.getParameter("vehicleModel");
		String vehicleType = request.getParameter("vehicleType");
		String locationId = request.getParameter("locationId");

		Vehicle updateVehicleAdminBeanObject = new Vehicle(vehicleId, vehicleVin, vehicleModel, vehicleMake, locationId,
				vehicleType);

		MySQLDataStoreUtilities.updateVehicle(updateVehicleAdminBeanObject);

		RequestDispatcher rd;
		ServletContext sc = getServletContext();

		// session.setAttribute("firstName", firstName);
		// session.setAttribute("lastName", lastName);
		// Retrieving vehicles Info from vehiclesInfo table

		rd = sc.getRequestDispatcher("/AddVehicleAdminMessage.jsp?action=update");
		rd.forward(request, response);

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
