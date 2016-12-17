import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.MySQLDataStoreUtilities;
import vehiclePackage.Accessory;

public class UpdateAccessoryAdminServlet extends HttpServlet {

	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		// Session and request variables
		HttpSession session = request.getSession(true);
		Integer accId = Integer.parseInt(request.getParameter("accId"));
		String accessoryName = request.getParameter("accessoryName");
		String accessoryCompany = request.getParameter("accessoryCompany");
		Integer accessoryStock = Integer.parseInt(request.getParameter("accessoryStock"));
		Integer accessoryAvailStock = Integer.parseInt(request.getParameter("accessoryAvailStock"));
		Double accessoryPrice = Double.parseDouble(request.getParameter("accessoryPrice"));

		Accessory updateAccessoryAdminObject = new Accessory(accId, accessoryName,accessoryCompany, accessoryStock, accessoryAvailStock,accessoryPrice);

		MySQLDataStoreUtilities.updateAccessory(updateAccessoryAdminObject);
		//
		// Vehicle addVehicleAdminObject = new Vehicle(vehicleId, vehicleVin,
		// vehicleModel, vehicleMake, locationId,
		// vehicleType, vehicleImage);
		//
		// MySQLDataStoreUtilities.enterVehicle(addVehicleAdminObject);

		RequestDispatcher rd;
		ServletContext sc = getServletContext();

		// session.setAttribute("firstName", firstName);
		// session.setAttribute("lastName", lastName);
		// Retrieving vehicles Info from vehiclesInfo table

		rd = sc.getRequestDispatcher("/AddAccessoryAdminMessage.jsp?action=update");
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
