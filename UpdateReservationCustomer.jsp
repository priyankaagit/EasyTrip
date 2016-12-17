<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />

	</head>

	<body>

		<%@ page import="java.io.*,java.util.*,searchPackage.*,vehiclePackage.*,reservationPackage.*,db.*,registerPackage.*" %>
		<%@include file="Header.jsp"%>
			<div >

				<div class="width">
					<br/>
					
					<%
					if(request.getParameter("action").contentEquals("Delete"))
					{
						Integer bookingId = Integer.parseInt(request.getParameter("bookingId"));
						MySQLDataStoreUtilities.cancelReservation(bookingId);
						%>
						<br/>
						<h4 align = 'center'>Reservation Successully Deleted !</h4>
						<br/>

						

			<%	}else if(request.getParameter("action").contentEquals("View")){
				 RequestDispatcher rd = request.getRequestDispatcher("/ViewReservation.jsp");
				 rd.forward(request,response);


		    	}
			 %>
						
						

						</br></br></br></br></br></br></br></br></br></br></br></br>

				</div>

			</div>

			<section id="body">

				<aside id="sidebar" class="column-left">
				</aside>

				<div class="clear"></div>

			</section>

	   <%@include file="Footer.jsp"%>

	</body>

</html>
