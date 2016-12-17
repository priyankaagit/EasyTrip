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
			<div >

				<div class="width">

						<table style="margin: 0px auto;" cellpadding='1' cellspacing='1'>
							 <tr>
								<td><h4 style ="color: #D3D3D3">1.Enter Booking Details</h4></td>
								<td><h4 style ="color: #D3D3D3">2.Select Vehicle<h4></td>
								<td><h4 style ="color: #D3D3D3">3.Choose Extras<h4></td>
								<td><h4>4.Review<h4></td>
								<td><h4 style ="color: #D3D3D3">5.Book<h4></td>
							 </tr>
						 </table>

              <%
							Search search = (Search)session.getAttribute("search");
							//Displaying the BookingDetail as of now.
							BookingDetail bookingDetail = (BookingDetail) session.getAttribute("bookingDetail");
              HashMap<String,VehicleInfo> vehiclesInfo = (HashMap<String,VehicleInfo>)session.getAttribute("vehiclesInfo");
              HashMap<Integer,Insurance> insurances = (HashMap<Integer,Insurance>) session.getAttribute("insurances");
              HashMap<String,Vehicle> vehicles  = (HashMap<String,Vehicle>)session.getAttribute("availableVehicle");
							BookingTime bookingTime = (BookingTime) session.getAttribute("bookingTime");
							BookingPlace bookingPlace = (BookingPlace) session.getAttribute("bookingPlace");
							Integer dayDiff = bookingTime.getDayDiff();
              Integer insuranceId = bookingDetail.getInsuranceId();
              Insurance insurance = insurances.get(insuranceId);
              String vid = bookingDetail.getVehicleId();
              String vin = bookingDetail.getVehicleVin();
              Vehicle vehicle = vehicles.get(vin);
              ArrayList<Accessory> accessories = bookingDetail.getAccessory();
              VehicleInfo vehicleInfo = vehiclesInfo.get(vid);
              double totalPrice = 0.0 ;
			  
			  String stringToChange = search.getPickUpLocation().substring(2);
			  String pickupLocationName="bbb";
			  pickupLocationName = db.MySQLDataStoreUtilities.getLocationNameForLocationId(stringToChange);
			  

							%>
				
				
				<% String customerId1 = customer.getFirstName();%>		
					
				<% 	if(customerId1 !=null)
					{
					
				%>
					<form action="Book.jsp" method="get">
				<%
					}
					else
					{
				%>
					<form action="Login.jsp" method="get">
				<%
					}
				%>
		   
		   
						 
						 <table style="margin: 0px auto;" cellpadding='1' cellspacing='1'>
							 <tr>
								<td align = 'left'><label>Enter Promo Code: </label> <input type="TEXT" size="15" name="promoCode"></input><input type="hidden" name="action" value='notLoggedIn'></input></td>
								<td align = 'right'>
									<input type="submit" value="Book" ></input>
								</td>

							 </tr>
							 <tr>
								
							 </tr>
						 </table>


						 <br/>

						<fieldset/>

						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Your Itinerary</th>
						</tr>

						<tr>
							<td><label for="fname">Pick Up Location: </label></td>
							<td><label for="fname"><%=pickupLocationName%></label></td>
						</tr>
						<tr>
							<td><label for="fname">Return Location: </label></td>
							<td><label for="fname"><%=search.getReturnLocation()%></label></td>
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
						<tr>
						<td colspan='3' align = 'right'>


						</td>
						</tr>

						</table>

						<fieldset/>

						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Your Vehicle</th>
						</tr>

						<tr>

						<td style="vertical-align: middle;" width="30%"><table><tr><td>
						<a href="ProductDetails.html"><img style="width:220px;height:128px;" style="display:block;"  src="<%=vehicleInfo.getVehicleImage()%>"></a>
						</td></tr></table></td>

						<td width="40%"><table>
						<tr><th width="40"><strong><%=vehicle.getVehicleMake()%> <%=vehicle.getVehicleModel()%></strong></th></tr>
						<tr><td width="40"><%=vehicleInfo.getVehiclePassenger()%> Passenger</td></tr>
						<tr><td width="40"><b><%=vehicleInfo.getVehicleLLuggage()%> Large Bags, </b><%=vehicleInfo.getVehicleSLuggage()%> Small Bags</td></tr>
						<tr><td><b><%=vehicleInfo.getVehicleTransmission()%> </b>Transmission</td></tr>
						<tr><td><b><%=vehicleInfo.getVehicleMilage()%> miles/gallon </b>or better</td></tr>
						</table></td>

						<td width="30%"><table>
						<tr><td><b>Price:</b></tr></td>
						<tr><td><b><%=vehicleInfo.getVehiclePrice()%> USD Per day</b></tr></td>
            <% totalPrice = totalPrice + (dayDiff * vehicleInfo.getVehiclePrice());%>
						<tr><td align = 'right'>


						</td></tr>
						</table></td></tr>
						</td>
						</tr>

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
              <% totalPrice = totalPrice + (dayDiff * insurance.getInsurancePrice());%>
						</tr>


            <%
              if(!accessories.isEmpty())
              for(Accessory acc: accessories){
 							if(acc !=null){
             %>
						<tr>
							<td>
							<table>
								<tr><td>Accessory Name: <%=acc.getAccName()%></td></tr>
								<tr><td>Company: <%=acc.getAccCompany()%></td></tr>
               </table>
							</td>
							<td><%=acc.getHourPrice()%> USD Per Day</td>
              <% totalPrice = totalPrice + (dayDiff * acc.getHourPrice());%>

						</tr>
          <%
				}else{
					%>
					<%
				}
			}
			double tax = totalPrice * 0.1;
			totalPrice = totalPrice+tax;
           %>

          
						
						</table>

						<fieldset/>


						 <table style="margin: 0px auto;" cellpadding='1' cellspacing='1'>
							 <tr>
								<td align = 'right'>
									<input type="submit" value="Book" ></input>
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
