
import vehiclePackage.Accessory;
import db.MySQLDataStoreUtilities;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddAccessoryAdminServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		// Session and request variables
		HttpSession session = request.getSession(true);

		String accessoryName = request.getParameter("accessoryName");
		String accessoryCompany = request.getParameter("accessoryCompany");
		int accessoryStock = Integer.parseInt(request.getParameter("accessoryStock"));
		int accessoryAvailStock = Integer.parseInt(request.getParameter("accessoryAvailStock"));
		Double accessoryPrice = Double.parseDouble(request.getParameter("accessoryPrice"));

		Accessory addAccessoryAdminObject = new Accessory(accessoryName, accessoryCompany, accessoryStock, accessoryAvailStock,
				accessoryPrice);

		MySQLDataStoreUtilities.enterAccessory(addAccessoryAdminObject);
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

		rd = sc.getRequestDispatcher("/AddAccessoryAdminMessage.jsp?action=add");
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
