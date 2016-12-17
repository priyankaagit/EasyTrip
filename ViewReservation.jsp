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
			<div >
				<%

				Integer bookingId = Integer.parseInt(request.getParameter("bookingId"));
				 HashMap<Integer,BookingTime> bookingTimes = (HashMap<Integer,BookingTime> )session.getAttribute("bookingTimes");
				 HashMap<Integer,Customer> customers =(HashMap<Integer,Customer>)session.getAttribute("customers");
			   ArrayList<BookingDetail> bookingDetails =(ArrayList<BookingDetail>)session.getAttribute("bookingDetails");
				 Account account = MySQLDataStoreUtilities.viewReservationFromBookingTransaction(bookingId.toString());
				 BookingTime bookingTime = bookingTimes.get(bookingId);
				 BookingDetail bookingDetail =null;
				 for(BookingDetail bookingDetail1:bookingDetails){
					 bookingDetail = bookingDetail1;
					 if(bookingDetail1.getBookingId() == bookingId){
						 break;
					 }
				 }

				 Integer custId = bookingDetail.getCustomerId();
				 Customer cust = customers.get(custId);

				%>

				<div class="width">

						<br/>

						<h4 align = 'center'>Reservation for Booking ID: <%=bookingId%></h4>

						<br/>

						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Driver Information</th>
						</tr>

						<tr>
							<td><label for="fname">First Name: </label></td>
							<td><label for="fname"><%=cust.getFirstName()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Last Name: </label></td>
							<td><label for="fname"><%=cust.getLastName()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Email Id: </label></td>
							<td><label for="fname"><%=cust.getEmailId()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Phone Number: </label></td>
							<td><label for="fname"><%=cust.getPhone()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Driver's License No: </label></td>
							<td><label for="fname"><%=cust.getLicenseNo()%></label></td>
						</tr>
						</table>

						<fieldset/>

						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Billing Information</th>
						</tr>

						<tr>
							<td><label for="fname">Card Holders Name: </label></td>
							<td><label for="fname"><%=account.getCardName()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Card Number: </label></td>
							<td><label for="fname"><%=account.getCardNum()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Address 1: </label></td>
							<td><label for="fname"><%=account.getAddress1()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Address 2: </label></td>
							<td><label for="fname"><%=account.getAddress2()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">City: </label></td>
							<td><label for="fname"><%=account.getCity()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Country: </label></td>
							<td><label for="fname"><%=account.getCountry()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Zip: </label></td>
							<td><label for="fname"><%=account.getZip()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Phone Number: </label></td>
							<td><label for="fname"><%=account.getPhoneNumber()%></label></td>
						</tr>
						</table>

						<fieldset/>

						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Itinerary</th>
						</tr>

						<tr>
							<td><label for="fname">Pick Up Location: </label></td>

							<% Integer location_id = Integer.parseInt(bookingDetail.getLocationId().substring(2));
							String location = MySQLDataStoreUtilities.getExactLocationNameFromLocationId(location_id);%>
							<td><label for="fname"><%=location%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Return Location: </label></td>
							<td><label for="fname"><%=location%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Pick Up Time: </label></td>
							<td><label for="fname"><%=bookingTime.getStartTime()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Return Time: </label></td>
							<td><label for="fname"><%=bookingTime.getEndTime()%></label></td>
						</tr>

						<tr>
							<td><label for="fname">Age: </label></td>
							<td><label for="fname"><%=bookingDetail.getCustomerAge()%></label></td>
						</tr>

						</table>

						<fieldset/>


						<%
						 VehicleInfo vehicleInfo = MySQLDataStoreUtilities.viewReservationFromVehicleInfo(bookingTime.getVehicleId());
						 String vehicleName = MySQLDataStoreUtilities.getFullVehicleNameFromVehicleId(bookingTime.getVehicleId());
						%>
						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Vehicle</th>
						</tr>
						<form method = 'get' action = 'VehiclesAvailable.jsp'>
						<tr>

						<td style="vertical-align: middle;" width="30%"><table><tr><td>
						<a href="ProductDetails.html"><img style="width:220px;height:128px;" style="display:block;"  src="<%=vehicleInfo.getVehicleImage(	)%>"></a>
						</td></tr></table></td>


						<td width="40%"><table>
						<tr><th width="40"><strong><%=vehicleName%></strong></th></tr>
						<tr><td width="40"><%=vehicleInfo.getVehiclePassenger()%></td></tr>
						<tr><td width="40"><b><%=vehicleInfo.getVehicleLLuggage()%> Large Bags, </b><%=vehicleInfo.getVehicleSLuggage()%> Small Bags</td></tr>
						<tr><td><b><%=vehicleInfo.getVehicleTransmission()%> </b>Transmission</td></tr>
						<tr><td><b><%=vehicleInfo.getVehicleMilage()%> miles/gallon </b>or better</td></tr>
						</table></td>

						<td width="30%"><table>
						<tr><td><b>Price:</b></tr></td>
						<tr><td><b><%=vehicleInfo.getVehiclePrice()%> USD Per Day</b></tr></td>


						</table></td></tr>
						</td>
						</tr>
						</form>
						</table>

						<fieldset/>

						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Extras</th>
						</tr>
						
						<%Insurance insurance = MySQLDataStoreUtilities.viewReservationFromInsurance(bookingDetail.getInsuranceId());  %>

						<tr>
							<td>
							<table>


								<tr><td>Insurance Name: <%=insurance.getInsuranceName()%></td></tr>
								<tr><td>Company: <%=insurance.getInsuranceCompany()%></td></tr>
								<tr><td>Insurance Type: <%=insurance.getInsuranceType()%></td></tr>
								<tr><td>Cost Covered: <%=insurance.getCostCovered()%></td></tr>
							</table>

							</td>
							<td><%=insurance.getInsurancePrice()%> USD Per Day</td>
						</tr>


<%     ArrayList<String> accessories = MySQLDataStoreUtilities.getAccessoryList(bookingId);
			HashMap<Integer,Accessory> availableAccessory = MySQLDataStoreUtilities.getAccessoryDetail();
%>
  						<tr>
							<td>
							<table>
					<%		for(String accessorykey :accessories ) {
               Accessory accessory = availableAccessory.get(Integer.parseInt(accessorykey));
							 if(accessory !=null){
						 %>
								<tr><td>Accessory Name:<%=accessory.getAccName()%></td></tr>
								<tr><td>Company: <%=accessory.getAccCompany()%></td></tr>
								</td>
							<td><%=accessory.getHourPrice()%> USD Per Day</td>
						</tr>
						<%} }%>	</table>

							

						</table>

						<fieldset/>

						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Total Price:</th>
							<th align='right' colspan='3' style ="color: #fff; background-color:#2F2F2F">$<%=bookingDetail.getTotalPrice()%></th>
						</tr>

						

						</table>

						<fieldset/>

						<form action="ReservationsListAdmin.jsp" method="get">
						 <table style="margin: 0px auto;" cellpadding='1' cellspacing='1'>
							 <tr>
								<td align = 'right'>
									<input type="submit" value="Ok" ></input>
								</td>

							 </tr>
						 </table>
						</form>

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
