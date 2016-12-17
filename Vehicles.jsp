<%@ page import="java.util.*, java.io.*, vehiclePackage.*, utilityClasses.*" %>

<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />
	
	</head>
	
	
	
	<%
		//MySQLDataStoreUtilitiesMohammed.deleteAllVehiclesFromTableMySQL();
		//MySQLDataStoreUtilitiesMohammed.insertVehiclesFromXMLToMySQL();
	
		LinkedHashMap<String,Vehicle> vehicles = new LinkedHashMap<String,Vehicle>();
		LinkedHashMap<String,VehicleInfo> vehicleInfos = new LinkedHashMap<String,VehicleInfo>();
		
		vehicles = MySQLDataStoreUtilitiesMohammed.getVehiclesFromMySQL();
		vehicleInfos = MySQLDataStoreUtilitiesMohammed.getVehicleInfoFromMySQL();
		
		String selectedCarType = request.getParameter("selectedCarType");
		ArrayList<String> alltypesArraylist = null;
		
		if(selectedCarType.equals("all"))
		{
			alltypesArraylist = new ArrayList<String>();
			alltypesArraylist.add("Eco-Friendly");
			alltypesArraylist.add("Sports");
			alltypesArraylist.add("Compact");
			alltypesArraylist.add("Fullsize");
			alltypesArraylist.add("Luxury");
			alltypesArraylist.add("SUV");
			alltypesArraylist.add("Full-Size SUV");
			alltypesArraylist.add("Minivan");
			alltypesArraylist.add("Convertible");
		}
	%>

	<body>

			<%@include file="Header.jsp"%>		
			<div >
			
				<div class="width">
					
						</br>
						
						<h4>Select Vehicle Type: </h4>
						
						<form action='Vehicles.jsp' method='get'>
						<table>
						<tr>
						<td>
						
						<select id="car-type" name="selectedCarType">
			
							<option value="Please Select a Type and Click View Vehicles" selected="selected">
								Select a Type and Click View Vehicles
							</option>
			
							<option value="all" >
								All Types
							</option>
						
							<option value="Eco-Friendly">
								Eco-Friendly
							</option>
						
							<option value="Sports">
								Sports
							</option>
				
							<option value="Compact">
								Compact
							</option>
							
							<option value="Fullsize">
								Fullsize
							</option>
						
							<option value="Luxury">
								Luxury
							</option>
						
							<option value="SUV">
								SUV
							</option>
							
							<option value="Full-Size SUV">
								Full-Size SUV
							</option>
							
							<option value="Minivan">
								Minivan
							</option>
						
							<option value="Convertible">
								Convertible
							</option>
					
						</select>
						</td>
						<td>
						<input type="submit" value="View Vehicles" ></input>
						</td>
						</tr>
						</table>
						</form>
						
	<%
		
	
	%>
						
			<%
				
				if(alltypesArraylist!=null)
				{
					for(String type: alltypesArraylist)
					{
						
			%>
						
					<table>
					
					<tr>
						<th colspan='3' style ="color: #fff; background-color:#2F2F2F"><%= type %></th>
					</tr>
					
					<%
							for(Map.Entry<String,Vehicle> m :vehicles.entrySet())
							{
								Vehicle c = m.getValue();
								
								String vehicleId = c.getVehicleId();
								String vehicleVin = c.getVehicleVin();
								String vehicleModel = c.getVehicleModel();
								String vehicleMake = c.getVehicleMake();
								String locationId = c.getLocationId();
								String vehicleType = c.getVehicleType();
								
								
								VehicleInfo v = new VehicleInfo();
								
								
								for(Map.Entry<String,VehicleInfo> n :vehicleInfos.entrySet())
								{
									VehicleInfo d = n.getValue();
									
									if(d.getVehicleId().equals(c.getVehicleId()))
									{
										v = d;
									}
								}
								
								
								String vehicleMilage = v.getVehicleMilage();
								String vehiclePassenger = v.getVehiclePassenger();
								String vehicleSLuggage = v.getVehicleSLuggage();
								String vehicleLLuggage = v.getVehicleLLuggage();
								String vehicleTransmission = v.getVehicleTransmission();
								String vehicleImage = v.getVehicleImage();
								double vehiclePrice = v.getVehiclePrice();
								
								double weeklyPrice = vehiclePrice*7;
								double monthlyPrice = vehiclePrice*30;

								if(vehicleType.equals(type))
								{
	
					%>
					
									<table style="width:100%" style="height:100%" border="1" bordercolor="#aaa" cellspacing="0" cellpadding="0">
									
									<tr>
									
									<td style="vertical-align: middle;" width="30%"><table><tr><td>
									<a href="ProductDetails.html"><img style="width:220px;height:128px;" style="display:block;"  src="<%= vehicleImage %>"></a>
									</td></tr></table></td>
									
									<td width="40%"><table>
									<tr><th width="40"><strong><%= vehicleMake %> <%= vehicleModel %></strong></th></tr>
									<tr><td width="40"><%= vehiclePassenger %> Passengers</td></tr>
									<tr><td width="40"><b><%= vehicleLLuggage %> Large Bags, </b><%= vehicleSLuggage %> Small Bags</td></tr>
									<tr><td><b><%= vehicleTransmission %> </b>Transmission</td></tr>
									<tr><td><b><%= vehicleMilage %> miles/gallon </b>or better</td></tr>
									</table></td>
									
									<td width="30%"><table>
									<tr><td colspan='2'><b>Price:</b></tr></td>
									<tr><td colspan='2'><b><%= vehiclePrice %> USD Per Day</b></tr></td>
									<tr><td colspan='2'><b><%= weeklyPrice %> USD Per Week</b></tr></td>
									<tr><td colspan='2'><b><%= monthlyPrice %> USD per month</b></tr></td>
									
									<tr>
									<td>
									<form method = 'get' action = 'ViewReview'>
									<input type='hidden' name='vehicleId' value='<%= vehicleId %>'>
									<input type='hidden' name='vehicleMake' value='<%= vehicleMake %>'>
									<input type='hidden' name='vehicleModel' value='<%= vehicleModel %>'>
									<input style="padding: 2px 3px; font-size: 0.6em;" type = 'submit' name = 'View Reviews' value = 'View Reviews'>
									</form>
									</td>
									
									<% String customerId1 = customer.getFirstName();%>		
					
									<% 	if(customerId1 !=null)
										{
										
									%>
										<td>
										<form method = 'get' action = 'WriteReviewVehicle.jsp'>
										<input type='hidden' name='vehicleId' value='<%= vehicleId %>'>
										<input type='hidden' name='vehicleMake' value='<%= vehicleMake %>'>
										<input type='hidden' name='vehicleModel' value='<%= vehicleModel %>'>
										<input type='hidden' name='vehicleType' value='<%= vehicleType %>'>
										<input style="padding: 2px 3px; font-size: 0.6em;" type = 'submit' name = 'Write Review' value = 'Write Review'>
										</form>
										</td>
									<%
										}
										
									%>
									
									</tr>
									
									</table></td></tr>
									
									</table>
						
			<%		
								}
							}
			%>
					</table>
			<%
					}
				}
				else
				{
					
			%>
					<table>
					
					<tr>
						<th colspan='3' style ="color: #fff; background-color:#2F2F2F"><%= selectedCarType %></th>
					</tr>
					
					<%
							for(Map.Entry<String,Vehicle> m :vehicles.entrySet())
							{
								Vehicle c = m.getValue();
								
								String vehicleId = c.getVehicleId();
								String vehicleVin = c.getVehicleVin();
								String vehicleModel = c.getVehicleModel();
								String vehicleMake = c.getVehicleMake();
								String locationId = c.getLocationId();
								String vehicleType = c.getVehicleType();
								
								
								VehicleInfo v = new VehicleInfo();
								
								
								for(Map.Entry<String,VehicleInfo> n :vehicleInfos.entrySet())
								{
									VehicleInfo d = n.getValue();
									
									if(d.getVehicleId().equals(c.getVehicleId()))
									{
										v = d;
									}
								}
								
								
								String vehicleMilage = v.getVehicleMilage();
								String vehiclePassenger = v.getVehiclePassenger();
								String vehicleSLuggage = v.getVehicleSLuggage();
								String vehicleLLuggage = v.getVehicleLLuggage();
								String vehicleTransmission = v.getVehicleTransmission();
								String vehicleImage = v.getVehicleImage();
								double vehiclePrice = v.getVehiclePrice();
								
								double weeklyPrice = vehiclePrice*7;
								double monthlyPrice = vehiclePrice*30;

								if(vehicleType.equals(selectedCarType))
								{
	
					%>
					
									<table style="width:100%" style="height:100%" border="1" bordercolor="#aaa" cellspacing="0" cellpadding="0">
									
									<tr>
									
									<td style="vertical-align: middle;" width="30%"><table><tr><td>
									<a href="ProductDetails.html"><img style="width:220px;height:128px;" style="display:block;"  src="<%= vehicleImage %>"></a>
									</td></tr></table></td>
									
									<td width="40%"><table>
									<tr><th width="40"><strong><%= vehicleMake %> <%= vehicleModel %></strong></th></tr>
									<tr><td width="40"><%= vehiclePassenger %> Passengers</td></tr>
									<tr><td width="40"><b><%= vehicleLLuggage %> Large Bags, </b><%= vehicleSLuggage %> Small Bags</td></tr>
									<tr><td><b><%= vehicleTransmission %> </b>Transmission</td></tr>
									<tr><td><b><%= vehicleMilage %> miles/gallon </b>or better</td></tr>
									</table></td>
									
									<td width="30%"><table>
									<tr><td colspan='2'><b>Price:</b></tr></td>
									<tr><td colspan='2'><b><%= vehiclePrice %> USD Per Day</b></tr></td>
									<tr><td colspan='2'><b><%= weeklyPrice %> USD Per Week</b></tr></td>
									<tr><td colspan='2'><b><%= monthlyPrice %> USD per month</b></tr></td>
									
									<tr>
									<td>
									<form method = 'get' action = 'ViewReview'>
									<input type='hidden' name='vehicleId' value='<%= vehicleId %>'>
									<input type='hidden' name='vehicleMake' value='<%= vehicleMake %>'>
									<input type='hidden' name='vehicleModel' value='<%= vehicleModel %>'>
									<input style="padding: 2px 3px; font-size: 0.6em;" type = 'submit' name = 'View Reviews' value = 'View Reviews'></input>
									</form>
									</td>
									
									<% String customerId1 = customer.getFirstName();%>		
					
									<% 	if(customerId1 !=null)
										{
										
									%>
										<td>
										<form method = 'get' action = 'WriteReviewVehicle.jsp'>
										<input type='hidden' name='vehicleId' value='<%= vehicleId %>'>
										<input type='hidden' name='vehicleMake' value='<%= vehicleMake %>'>
										<input type='hidden' name='vehicleModel' value='<%= vehicleModel %>'>
										<input type='hidden' name='vehicleType' value='<%= vehicleType %>'>
										<input style="padding: 2px 3px; font-size: 0.6em;" type = 'submit' name = 'Write Review' value = 'Write Review'>
										</form>
										</td>
									<%
										}
										
									%>
									
									
									
									</tr>
									
									</table></td></tr>
									
									</table>
						
			<%		
								}
							}
			%>
					</table>
			<%
					
				}
			%>
						
						
	 
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
