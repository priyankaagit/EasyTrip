<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />

	</head>

	<body>
      <%@ page import="java.io.*,java.util.*,searchPackage.*,vehiclePackage.*,db.*" %>
			<%@include file="Header.jsp"%>
			<div >

				<div class="width">

						<table style="margin: 0px auto;" cellpadding='1' cellspacing='1'>
							 <tr>
								<td><h4 style ="color: #D3D3D3">1.Enter Booking Details</h4></td>
								<td><h4>2.Select Vehicle</h4></td>
								<td><h4 style ="color: #D3D3D3">3.Choose Extras<h4></td>
								<td><h4 style ="color: #D3D3D3">4.Review<h4></td>
								<td><h4 style ="color: #D3D3D3">5.Book<h4></td>
							 </tr>
						 </table>

						 <form action="#" method="get">
						 <table style="margin: 0px auto;" cellpadding='1' cellspacing='1'>
							 <tr>
								<td>
									<label for="fname">Change Vehicle Type:</label>
								</td>
								<td>
									<select id="car-type" name="selectedCarType">

										<option value="all" selected="selected">
											All Types
										</option>

										<option value="eco-friendly">
											Eco-Friendly
										</option>

										<option value="Sports">
											Sports
										</option>

										<option value="compact">
											Compact
										</option>

										<option value="fullSize">
											Fullsize
										</option>

										<option value="luxury">
											Luxury
										</option>

										<option value="suv">
											SUV
										</option>

										<option value="fullSizeSUV">
											Full-Size SUV
										</option>

										<option value="minivan">
											Minivan
										</option>

										<option value="convertible">
											Convertible
										</option>

										</select>
								</td>

								<td>
									<label for="fname">Sort By:</label>
								</td>
								<td>
									<select id="car-type" name="selectedCarType">

										<option value="price" selected="selected">
											Price
										</option>

										<option value="eco-friendly">
											Size
										</option>

										<option value="sports">
											Company
										</option>

										</select>
								</td>

								<td>
									<input type="submit" value="Search Vehicles" ></input>
								</td>

							 </tr>
						 </table>
						 </form>

						<br/>

<%  // Java code here

HashMap<String,Vehicle> availableVehicle = (HashMap<String,Vehicle>)session.getAttribute("availableVehicle");
HashMap<String,VehicleInfo> vehiclesInfo = (HashMap<String,VehicleInfo>)session.getAttribute("vehiclesInfo");

%>


						<h4 align = 'center' style ="color: #193a80">Available Vehicles</h4>

						<fieldset/>

            <%
            if(availableVehicle.isEmpty()){
				
							%>
							</br><h5 align = 'center' style ="color: #193a80">Sorry, No Available Vehicles for selected location, date & time</h5>
							<h5 align = 'center' style ="color: #193a80">Please go back and select another location, date or time</h5>
							</br></br></br></br></br></br></br></br></br></br></br></br></br>
							<%
						}else{

                for(String vin : availableVehicle.keySet()){
                  Vehicle vehicle = availableVehicle.get(vin);
							  	VehicleInfo vehicleInfo = vehiclesInfo.get(vehicle.getVehicleId());
                  if( vehicleInfo!=null	)
								 {
							 %>

							 <table style="width:100%" style="height:100%" border="1" bordercolor="#aaa" cellspacing="0" cellpadding="0">
							 						<form method = 'get' action = '/easytrip/VehicleSelect'>
							 						<tr>
                           <input type ="Hidden" name = "vin" value = "<%=vehicle.getVehicleVin()%>" />
													 <input type ="Hidden" name = "vid" value = "<%=vehicle.getVehicleId()%>" />
							 						<td style="vertical-align: middle;" width="30%"><table><tr><td>
							 						<a href="ProductDetails.html"><img style="width:220px;height:128px;" style="display:block;"  src="<%=vehicleInfo.getVehicleImage()%>"></a>
							 						</td></tr></table></td>
                          
							 						<td width="40%"><table>
							 						<tr><th width="40"><strong><%=vehicle.getVehicleMake()%> <%=vehicle.getVehicleModel()%></strong></th></tr>
							 						<tr><td width="40">Passenger Capacity : <%=vehicleInfo.getVehiclePassenger()%></td></tr>
							 						<tr><td width="40"><b><%=vehicleInfo.getVehicleLLuggage()%> Large Bags, </b><%=vehicleInfo.getVehicleSLuggage()%> Small Bags</td></tr>
							 						<tr><td><b><%=vehicleInfo.getVehicleTransmission()%> </b>Transmission</td></tr>
							 						<tr><td><b><%=vehicleInfo.getVehicleMilage()%> miles/gallon</b> or better</td></tr>
							 						</table></td>

							 						<td width="30%"><table>
							 						<tr><td><b>Price:</b></tr></td>
							 						<tr><td><b><%=vehicleInfo.getVehiclePrice()%> USD Per Hour</b></tr></td>

							 						<tr><td>
							 						<input type = 'submit' name = 'selectVehicle' value = 'Select'>

							 						</form></td></tr>
							 						</table></td></tr>

							 						</tr>
							 						</table>

							  <%


        }
             }
						}


					%>	<fieldset/>
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
