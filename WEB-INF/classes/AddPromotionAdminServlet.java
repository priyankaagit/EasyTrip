import utilityClasses.*;
import vehiclePackage.Accessory;
import db.MySQLDataStoreUtilities;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddPromotionAdminServlet extends HttpServlet {

	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		String action = request.getParameter("action");

		String promoCode = request.getParameter("promoCode");
		String percentageOff = request.getParameter("percentageOff");
		String validTillDate = request.getParameter("validTillDate");
		
		String originalPromoCode = request.getParameter("originalPromoCode");

		Promotion promotion = new Promotion(promoCode, percentageOff, validTillDate);

		

		if(action.equals("add"))
		{
			MySQLDataStoreUtilitiesMohammed.insertPromotionInMySQL(promoCode, percentageOff, validTillDate);
		
			RequestDispatcher rd;
			ServletContext sc = getServletContext();
			
			rd = sc.getRequestDispatcher("/AddPromotionAdminMessage.jsp?action=add");
			rd.forward(request, response);
		}
		else if(action.equals("update"))
		{
			MySQLDataStoreUtilitiesMohammed.updatePromotionInMySQL(promoCode, percentageOff, validTillDate, originalPromoCode);
		
			RequestDispatcher rd;
			ServletContext sc = getServletContext();
			
			rd = sc.getRequestDispatcher("/AddPromotionAdminMessage.jsp?action=update");
			rd.forward(request, response);
		}
		
		

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
