<!doctype html>

<%@page import="java.util.LinkedHashMap"%>
<%@page import="vehiclePackage.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.MySQLDataStoreUtilities"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles-admin.css" type="text/css" />
	
	</head>

	<body>
	
	<%
    LinkedHashMap<String,Vehicle> displayVehicles= new LinkedHashMap<String,Vehicle>();
	LinkedHashMap<String, Vehicle> displaySelectedVehicle= new LinkedHashMap<String, Vehicle>();
	LinkedHashMap<String, Vehicle> displaySortedVehicle= new LinkedHashMap<String, Vehicle>();
	String customerSearchQuery= request.getParameter("customerSearchQuery");
	String customerSort= request.getParameter("selectedCarType");
	System.out.print(customerSort+" ======");
	
		displayVehicles= MySQLDataStoreUtilities.getAllVehicleList();

	
		displaySelectedVehicle= MySQLDataStoreUtilities.getSelectedVehicles(customerSearchQuery);	
		
		displaySortedVehicle= MySQLDataStoreUtilities.getSortedVehicles(customerSort);
		
		displayVehicles=displaySortedVehicle;

%>

			<%@include file="AdminHeader.jsp"%>		
			<div >
			
				<div class="width">
					<br/>
					<table>
					<tr>
					<td><h4 align = 'center'>Search: </h4></td>
							<form action="/easytrip/VehicleListAdmin.jsp" method="post">
					<td><input type="TEXT" size="15" placeholder="Search by model" name="customerSearchQuery"></input></td>
					<td><input style="padding: 4px 7px; font-size: 0.9em;" type="submit"  value="Search" ></input></td>
					<td><h3 align = 'center'>Vehicles List</h3></td>
					<td>
						<h4 align = 'center'>Sort by: </h4>
					</td>
					
					<form action="/easytrip/VehicleListAdmin.jsp" method="post">
					<td>
						<select id="car-type" name="selectedCarType">
			
							<option value="vehicle_type" selected="selected">
								Type
							</option>
						
							<option value="vehicle_make">
								Make
							</option>
						
							<option value="vehicle_model">
								Model
							</option>
							
							<option value="vehicle_id">
								ID
							</option>
							
							<option value="location_id">
								Location
							</option>
			
						</select>
					</td>
					
					<td><input style="padding: 4px 7px; font-size: 0.9em;" type="submit"  ></input></td>
					
					</tr>
					</table>
					
					<br/>
					
					<table>
						<tr>
							<th style ="color: #fff; background-color:#2F2F2F">VIN</th>
							<th style ="color: #fff; background-color:#2F2F2F">ID</th>
							<th style ="color: #fff; background-color:#2F2F2F">Make</th>
							<th style ="color: #fff; background-color:#2F2F2F">Model</th>
							<th style ="color: #fff; background-color:#2F2F2F">Type</th>
						
							<th style ="color: #fff; background-color:#2F2F2F">Location</th>
							<th style ="color: #fff; background-color:#2F2F2F">Update</th>
							<th style ="color: #fff; background-color:#2F2F2F">Delete</th>
						</tr>
						
						
							<%
							
						
							if(customerSearchQuery!=null&&customerSearchQuery.length()>0)
							{
								//if(customerSort!=null)
									//displaySelectedVehicle=displaySortedVehicle;
								
								for(String key :	displaySelectedVehicle.keySet()){
									
									
									
									%>
									
									<form action='UpdateVehicleAdmin.jsp' method='get'>
									<tr>
									<td><label><b> <input type='hidden' name='vehicleVin' value='<%=displaySelectedVehicle.get(key).getVehicleVin()%>' /><%=displaySelectedVehicle.get(key).getVehicleVin() %></label></td>
										<td><label><b> <input type='hidden' name='vehicleId' value='<%=displaySelectedVehicle.get(key).getVehicleId()%>' /><%=displaySelectedVehicle.get(key).getVehicleId() %></label></td>
										
										
										<td><label><b> <input type='hidden' name='vehicleMake' value='<%=displaySelectedVehicle.get(key).getVehicleMake()%>' /><%=displaySelectedVehicle.get(key).getVehicleMake() %></label></td>
										<td><label><b> <input type='hidden' name='vehicleModel' value='<%=displaySelectedVehicle.get(key).getVehicleModel()%>' /><%=displaySelectedVehicle.get(key).getVehicleModel() %></label></td>
										<td><label><b> <input type='hidden' name='vehicleType' value='<%=displaySelectedVehicle.get(key).getVehicleType()%>' /><%=displaySelectedVehicle.get(key).getVehicleType() %></label></td>
								        <td><label><b> <input type='hidden' name='locationId' value='<%=displaySelectedVehicle.get(key).getLocationId()%>' /><%=displaySelectedVehicle.get(key).getLocationId() %></label></td>
											<td><input type="submit" type="hidden" name="action" value="Update" ></input></td>
										<td><input type="submit" type="hidden" name="action" value="Delete" ></input></td>
									</tr>
									</form>
									<%
							
									}
								
							}
							else
							{
										
									%>
									
								
							
							
					
						
						
						
						
						
										<%
										if(customerSort!=null)
											
											displayVehicles=displaySortedVehicle;
										for(String key :	displayVehicles.keySet()){
											
											
											
											%>
											
											<form action='UpdateVehicleAdmin.jsp' method='get'>
											<tr>
											<td><label><b> <input type='hidden' name='vehicleVin' value='<%=displayVehicles.get(key).getVehicleVin()%>' /><%=displayVehicles.get(key).getVehicleVin() %></label></td>
												<td><label><b> <input type='hidden' name='vehicleId' value='<%=displayVehicles.get(key).getVehicleId()%>' /><%=displayVehicles.get(key).getVehicleId() %></label></td>
												
												
												<td><label><b> <input type='hidden' name='vehicleMake' value='<%=displayVehicles.get(key).getVehicleMake()%>' /><%=displayVehicles.get(key).getVehicleMake() %></label></td>
												<td><label><b> <input type='hidden' name='vehicleModel' value='<%=displayVehicles.get(key).getVehicleModel()%>' /><%=displayVehicles.get(key).getVehicleModel() %></label></td>
												<td><label><b> <input type='hidden' name='vehicleType' value='<%=displayVehicles.get(key).getVehicleType()%>' /><%=displayVehicles.get(key).getVehicleType() %></label></td>
										        <td><label><b> <input type='hidden' name='locationId' value='<%=displayVehicles.get(key).getLocationId()%>' /><%=displayVehicles.get(key).getLocationId() %></label></td>
													<td><input type="submit" type="hidden" name="action" value="Update" ></input></td>
												<td><input type="submit" type="hidden" name="action" value="Delete" ></input></td>
											</tr>
											</form>
											<%
									
											}	
										
										
										
							}
										
			
						%>
						
						
						
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
