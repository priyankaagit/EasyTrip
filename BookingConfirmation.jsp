<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />

	</head>

	<body>
      <%@ page import="java.io.*,java.util.*,searchPackage.*,vehiclePackage.*,reservationPackage.*,db.*" %>
			<%@include file="Header.jsp"%>

			<%
			Search search = (Search)session.getAttribute("search");
			//Displaying the BookingDetail as of now.
			BookingDetail bookingDetail = (BookingDetail) session.getAttribute("bookingDetail");
			HashMap<String,VehicleInfo> vehiclesInfo = (HashMap<String,VehicleInfo>)session.getAttribute("vehiclesInfo");
			HashMap<Integer,Insurance> insurances = (HashMap<Integer,Insurance>) session.getAttribute("insurances");
			HashMap<String,Vehicle> vehicles  = (HashMap<String,Vehicle>)session.getAttribute("availableVehicle");
			Account account = (Account) session.getAttribute("account");
			BookingTime bookingTime = (BookingTime) session.getAttribute("bookingTime");
			BookingPlace bookingPlace = (BookingPlace) session.getAttribute("bookingPlace");
			
			String pickupLocationId = bookingPlace.getPickUpLocation();
			String stringToChange = pickupLocationId.substring(2);
			String pickupLocationName="bbb";
			pickupLocationName = db.MySQLDataStoreUtilities.getLocationNameForLocationId(stringToChange);
			
			Integer insuranceId = bookingDetail.getInsuranceId();
			Insurance insurance = insurances.get(insuranceId);
			String vid = bookingDetail.getVehicleId();
			String vin = bookingDetail.getVehicleVin();
			Vehicle vehicle = vehicles.get(vin);
			ArrayList<Accessory> accessories = bookingDetail.getAccessory();
			VehicleInfo vehicleInfo = vehiclesInfo.get(vid);
			double totalPrice = 0.0 ; %>



			<div >

				<div class="width">

						<br/>

						<h5>Vehicle booked successfully.</h5>
						<h5>Your Booking Id is <%=bookingDetail.getBookingId()%>.</h5>
						
						<h5>You can view and cancel your booking from the Reservations tab using the Booking Id.</h5>

						<h5>Below are your confirmed booking details:</h5>

						<br/>

						<fieldset/>

						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Driver Information</th>
						</tr>

						<tr>
							<td><label for="fname">Name: </label></td>
							<td><label for="fname"><%=bookingDetail.getCustomerName()%></label></td>
						</tr>

						<tr>
							<td><label for="fname">Email Id: </label></td>
							<td><label for="fname"><%=bookingDetail.getEmailId()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Phone Number: </label></td>
							<td><label for="fname"><%=bookingDetail.getCustomerPhone()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Driver's License No: </label></td>
							<td><label for="fname"><%=bookingDetail.getDrivingLicense()%></label></td>
						</tr>
						</table>

						<fieldset/>

						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Billing Information</th>
						</tr>
<%  if(account !=null) {%>
						<tr>
							<td><label for="fname">Card Holders Name: </label></td>
							<td><label for="fname"><%=account.getCardName()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Card Number: </label></td>
							<% String accNum = account.getCardNum();
							  int len = accNum.length();
								String lastThreeCharacter = accNum.substring(len-3,len);

							%>
							<td><label for="fname">**** **** **** <%=lastThreeCharacter%></label></td>
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
							<% }%>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Your Itinerary</th>
						</tr>

						<tr>
							<td><label for="fname">Pick Up Location: </label></td>
							<td><label for="fname"><%=pickupLocationName%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Return Location: </label></td>
							<td><label for="fname"><%=bookingPlace.getReturnLocation()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Pick Up Date: </label></td>
							<td><label for="fname"><%=search.getPickUpDate()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Pick Up Time: </label></td>
							<td><label for="fname"><%=search.getPickUpTime()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Return Date: </label></td>
							<td><label for="fname"><%=search.getReturnDate()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Return Time: </label></td>
							<td><label for="fname"><%=search.getReturnTime()%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Your Age: </label></td>
							<td><label for="fname"><%=search.getCustomerAge()%></label></td>
						</tr>

						</table>

						<fieldset/>

						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Your Vehicle</th>
						</tr>
						<form method = 'get' action = 'VehiclesAvailable.jsp'>
						<tr>

						<td style="vertical-align: middle;" width="30%"><table><tr><td>
						<a href="ProductDetails.html"><img style="width:220px;height:128px;" style="display:block;"  src="<%=vehicleInfo.getVehicleImage()%>"></a>
						</td></tr></table></td>
        <%    if(vehicleInfo !=null) {%>
						<td width="40%"><table>
						<tr><th width="40"><strong><%=vehicle.getVehicleMake()%> <%=vehicle.getVehicleModel()%></strong></th></tr>
						<tr><td width="40"><%=vehicleInfo.getVehiclePassenger()%> Passengers</td></tr>
						<tr><td width="40"><b><%=vehicleInfo.getVehicleLLuggage()%> Large Bags, </b><%=vehicleInfo.getVehicleSLuggage()%> Small Bags</td></tr>
						<tr><td><b><%=vehicleInfo.getVehicleTransmission()%> </b>Transmission</td></tr>
						<tr><td><b><%=vehicleInfo.getVehicleMilage()%>miles/gallon </b>or better</td></tr>
					<% }	%>
						</table></td>

						<td width="30%"><table>
						<tr><td><b>Price:</b></tr></td>
						<tr><td><b><%=vehicleInfo.getVehiclePrice()%> USD Per Hour</b></tr></td>
              <% totalPrice = totalPrice + vehicleInfo.getVehiclePrice();%>
						</table></td></tr>
						</td>
						</tr>
						</form>
						</table>

						<fieldset/>

						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Your Extras</th>
						</tr>

						<tr>
							<td>
							<table>
								<tr><td>Insurance Id: <%=insurance.getInsuranceNumber()%></td></tr>
								<tr><td>Insurance Name: <%=insurance.getInsuranceName()%></td></tr>
								<tr><td>Company: <%=insurance.getInsuranceCompany()%></td></tr>
								<tr><td>Insurance Type: <%=insurance.getInsuranceType()%></td></tr>
								<tr><td>Cost Covered: <%=insurance.getCostCovered()%></td></tr>
							</table>

							</td>
						<td><%=insurance.getInsurancePrice()%> USD Per Day</td>
						  <% totalPrice = totalPrice + insurance.getInsurancePrice();%>
						</tr>
						<%
							if(!accessories.isEmpty())
							for(Accessory acc: accessories){

						 %>

						<tr>
							<td>
								<table>
									<tr><td>Accessory Name: <%=acc.getAccName()%></td></tr>
									<tr><td>Company: <%=acc.getAccCompany()%></td></tr>
	               </table>

							</td>
							<td><%=acc.getHourPrice()%> USD Per Day</td>
							  <% totalPrice = totalPrice + acc.getHourPrice();%>
						</tr>
						<%
								}
						 %>

						</table>

						<fieldset/>

						<form action="index.jsp" method="get">
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

	   <%@include file="Footer.jsp"%>

	</body>

</html>
