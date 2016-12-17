<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles-admin.css" type="text/css" />

	</head>

	<body>
      <%@ page import="java.io.*,java.util.*,searchPackage.*,vehiclePackage.*,reservationPackage.*,db.*,registerPackage.*" %>
			<%@include file="AdminHeader.jsp"%>
			<% ArrayList<BookingDetail> bookingDetails = new ArrayList<BookingDetail>();
			 bookingDetails = MySQLDataStoreUtilities.getBookingDetails(new Integer(0));
			 HashMap<Integer,BookingTime> bookingTimes = MySQLDataStoreUtilities.viewReservationFromBookingTime();
			 HashMap<Integer,Customer> customers = MySQLDataStoreUtilities.getAllCustomerList();
			session.setAttribute("bookingTimes",bookingTimes);
			session.setAttribute("customers",customers);
			session.setAttribute("bookingDetails",bookingDetails);

			 %>

			<div >

				<div style="width: 98.75%; margin: 0 auto;">
					<br/>
					<table>
					<tr>
					<td><h4 align = 'center'>Search: </h4></td>
					<td><input type="TEXT" size="15" name="customerSearchQuery"></input></td>
					<td><h3 align = 'center'>Reservations List</h3></td>
					<td>
						<h4 align = 'center'>Sort by: </h4>
					</td>
					<td>
						<select id="car-type" name="selectedCarType">

							<option value="emailId" selected="selected">
								Email ID
							</option>

							<option value="firstName">
								Location ID
							</option>

							<option value="lastName">
								Car Type
							</option>

							<option value="lastName">
								Booking ID
							</option>

							<option value="lastName">
								Pickup Date
							</option>

							<option value="lastName">
								Return Date
							</option>

						</select>
					</td>

					<td><input style="padding: 4px 7px; font-size: 0.9em;" type="submit" value="Submit" ></input></td>

					</tr>
					</table>

					<br/>

					<table>
						<tr>
							<th style ="color: #fff; background-color:#2F2F2F">Booking ID</th>
							<th style ="color: #fff; background-color:#2F2F2F">Email Id</th>
							<th style ="color: #fff; background-color:#2F2F2F">Location ID</th>
							<th style ="color: #fff; background-color:#2F2F2F">VIN</th>
							<th style ="color: #fff; background-color:#2F2F2F">Type</th>
							<th style ="color: #fff; background-color:#2F2F2F">Pickup Date</th>
							<th style ="color: #fff; background-color:#2F2F2F">Return Date</th>
							<th style ="color: #fff; background-color:#2F2F2F">View</th>
							<th style ="color: #fff; background-color:#2F2F2F">Modify</th>
							<th style ="color: #fff; background-color:#2F2F2F">Cancel</th>
						</tr>
						
			<%  if(!bookingDetails.isEmpty())
				{	
					     for(BookingDetail bookingDetail:bookingDetails)
						 {
							 Integer customerId = bookingDetail.getCustomerId();
							 if(customers.containsKey(customerId))
							 {
			%>
								
								<tr>
								<input type="HIDDEN" name="bookingId" value="<%=bookingDetail.getBookingId()%>">
								<td><label for="fname"><%=bookingDetail.getBookingId()%></label></td>
								<td><label for="fname"><%=customers.get(customerId).getEmailId()%></label></td>
								<td><label for="fname"><%=bookingDetail.getLocationId()%></label></td>

				<% 
								BookingTime bookingTime = bookingTimes.get(bookingDetail.getBookingId());
								if(bookingTime !=null)
								{
				%>
									<td><label for="fname"><%=bookingTime.getVehicleVin()%></label></td>
									<td><label for="fname"><%=bookingTime.getVehicleType()%></label></td>
									<td><label for="fname"><%=bookingTime.getStartTime()%></label></td>

									<td><label for="fname"><%=bookingTime.getEndTime()%></label></td>
				<%
								}
				%>

								
								<form action='ViewReservation.jsp' method='get'>
								<td><input TYPE='hidden' name='bookingId' value='<%=bookingDetail.getBookingId()%>'></input>
								<input TYPE='hidden' name='customerId' value='<%=customerId%>'></input>
								<input type="submit" value="View" ></input></td>
								</form>
								
								<td><input TYPE='hidden' name='bookingId' value='<%=bookingDetail.getBookingId()%>'></input>
								<input type="button" value="Modify" ></input></td>
								
								<form action='UpdateReservationAdmin.jsp?action=delete' method='get'>
								<td><input TYPE='hidden' name='bookingId' value='<%=bookingDetail.getBookingId()%>'></input>
								<input type="submit" value="Delete" name="action" ></input></td>
								</form>
								</tr>
						
				<%
							}

						}
				}
						 else
						{
				%>
						No Booking infromation
				<%
						}
				%>
						<!--
						This other rows are just for template purpose.
						-->


						</table>




					 </br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>

				</div>

			</div>

			<section id="body">

				<aside id="sidebar" class="column-left">
				</aside>

				<div class="clear"></div>

			</section>

	   <%@include file="FooterAdmin.jsp"%>

	</body>

</html>
