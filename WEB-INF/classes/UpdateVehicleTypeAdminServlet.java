import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import db.MySQLDataStoreUtilities;
import vehiclePackage.VehicleInfo;
@WebServlet(name = "FileUploadServlet", urlPatterns = {"/upload"})
@MultipartConfig
public class UpdateVehicleTypeAdminServlet extends HttpServlet {

	
	ServletContext context = null;
	public void init(ServletConfig config) throws ServletException {
		context = config.getServletContext();
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		// Session and request variables
		HttpSession session = request.getSession(true);

		String vehicleId = request.getParameter("vehicleId");
		//String vehicleModel = request.getParameter("vehicleModel");
		Double vehiclePrice = Double.parseDouble(request.getParameter("vehiclePrice"));
		String vehicleMilage = request.getParameter("vehicleMilage");
		String vehiclePassenger = request.getParameter("vehiclePassenger");
		String vehicleSLuggage = request.getParameter("vehicleSLuggage");
		String vehicleLLuggage = request.getParameter("vehicleLLuggage");
		String vehicleTransmission = request.getParameter("vehicleTransmission");
		String vehicleImage = request.getParameter("vehicleImage");
		
		

		VehicleInfo updateVehicleInfoAdminObject = new VehicleInfo(vehicleId, vehiclePrice,
				vehicleMilage, vehiclePassenger, vehicleSLuggage, vehicleLLuggage, vehicleTransmission, vehicleImage);

		MySQLDataStoreUtilities.updateVehicleInformation(updateVehicleInfoAdminObject);
		//
		// Vehicle addVehicleAdminObject = new Vehicle(vehicleId, vehicleVin,
		// vehicleModel, vehicleMake, locationId,
		// vehicleType, vehicleImage);
		//
		// MySQLDataStoreUtilities.enterVehicle(addVehicleAdminObject);

		RequestDispatcher rd;


		// session.setAttribute("firstName", firstName);
		// session.setAttribute("lastName", lastName);
		// Retrieving vehicles Info from vehiclesInfo table

		rd = context.getRequestDispatcher("/AddVehicleAdminMessage.jsp?action=update");
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
