import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.MySQLDataStoreUtilities;
import vehiclePackage.Insurance;

public class UpdateInsuranceAdminServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		// Session and request variables
		HttpSession session = request.getSession(true);
		int insuranceId = Integer.parseInt(request.getParameter("insuranceId"));
		String insuranceName = request.getParameter("insuranceName");
		String insuranceType = request.getParameter("insuranceType");
		Double insuranceCostCovered = Double.parseDouble(request.getParameter("insuranceCostCovered"));
		String insuranceCompany = request.getParameter("insuranceCompany");
		Double insurancePrice = Double.parseDouble(request.getParameter("insurancePrice"));

		Insurance updateInsuranceAdminObject = new Insurance(insuranceId, insuranceName, insuranceType,
				insuranceCostCovered, insuranceCompany, insurancePrice);

		MySQLDataStoreUtilities.updateInsuranceInformation(updateInsuranceAdminObject);

		RequestDispatcher rd;
		ServletContext sc = getServletContext();

		// session.setAttribute("firstName", firstName);
		// session.setAttribute("lastName", lastName);
		// Retrieving vehicles Info from vehiclesInfo table

		rd = sc.getRequestDispatcher("/UpdateInsuranceMessage.jsp?action=update");
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
