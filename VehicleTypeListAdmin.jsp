<!doctype html>

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
HashMap<String,VehicleInfo> displayVehicleInfo= new HashMap<String,VehicleInfo>();
	displayVehicleInfo= MySQLDataStoreUtilities.getAllVehicleTypeList();
	if(displayVehicleInfo.isEmpty()) {%>
vehichle info is empty
<%}%>

			<%@include file="AdminHeader.jsp"%>
			<div >

				<div class="width">
					<br/>
					<table>
					<tr>
					<td><h4 align = 'center'>Search: </h4></td>
					<td><input type="TEXT" size="15" name="customerSearchQuery"></input></td>
					<td><h3 align = 'center'>Vehicles List</h3></td>
					<td>
						<h4 align = 'center'>Sort by: </h4>
					</td>
					<td>
						<select id="car-type" name="selectedCarType">

							<option value="emailId" selected="selected">
								Type
							</option>

							<option value="firstName">
								Make
							</option>

							<option value="lastName">
								Model
							</option>

							<option value="lastName">
								ID
							</option>

							<option value="lastName">
								Location
							</option>

						</select>
					</td>

					<td><input style="padding: 4px 7px; font-size: 0.9em;" type="submit" value="Submit" ></input></td>

					</tr>
					</table>

					<br/>

					<table>
						<tr>
							<th style ="color: #fff; background-color:#2F2F2F">ID</th>
							<th style ="color: #fff; background-color:#2F2F2F">Price</th>
							<th style ="color: #fff; background-color:#2F2F2F">Mileage</th>
							<th style ="color: #fff; background-color:#2F2F2F">Cap</th>
							<th style ="color: #fff; background-color:#2F2F2F">SL</th>
							<th style ="color: #fff; background-color:#2F2F2F">LL</th>
							<th style ="color: #fff; background-color:#2F2F2F">Image</th>
							<th style ="color: #fff; background-color:#2F2F2F">Transmission</th>
							<th style ="color: #fff; background-color:#2F2F2F">Update</th>
							<th style ="color: #fff; background-color:#2F2F2F">Delete</th>
						</tr>


							<%

					for(String key :displayVehicleInfo.keySet()){



						%>

						<form action='UpdateVehicleTypeAdmin.jsp' method='get'>
						<tr>
							<td><label><b> <input type='hidden' name='vehicleId' value='<%=displayVehicleInfo.get(key).getVehicleId()%>'/><%=displayVehicleInfo.get(key).getVehicleId() %></label></td>

							<td><label> <input type='hidden' name='vehiclePrice' value='<%=displayVehicleInfo.get(key).getVehiclePrice() %>'/><%=displayVehicleInfo.get(key).getVehiclePrice() %></label></td>
							<td><label> <input type='hidden' name='vehicleMilage' value='<%=displayVehicleInfo.get(key).getVehicleMilage() %>'/><%=displayVehicleInfo.get(key).getVehicleMilage() %></label></td>
							<td><label> <input type='hidden' name='vehiclePassenger' value='<%=displayVehicleInfo.get(key).getVehiclePassenger() %>'/><%= displayVehicleInfo.get(key).getVehiclePassenger()%></label></td>
							<td><label> <input type='hidden' name='vehicleSLuggage' value='<%=displayVehicleInfo.get(key).getVehicleSLuggage() %>'/><%= displayVehicleInfo.get(key).getVehicleSLuggage()%></label></td>
							<td><label> <input type='hidden' name='vehicleLLuggage' value='<%=displayVehicleInfo.get(key).getVehicleLLuggage() %>'/><%= displayVehicleInfo.get(key).getVehicleLLuggage()%></label></td>
							<td><label> <input type='hidden' name='vehicleImage' value='<%=displayVehicleInfo.get(key).getVehicleImage()%>'/><%= displayVehicleInfo.get(key).getVehicleImage()%></label></td>
							<td><label> <input type='hidden' name='vehicleTransmission' value='<%=displayVehicleInfo.get(key).getVehicleTransmission() %>'/><%= displayVehicleInfo.get(key).getVehicleTransmission()%></label></td>

							<td><input type="submit" type='hidden' name='action' value="Update" ></input></td>
							<td><input type="submit" type='hidden' name='action' value="Delete" ></input></td>
						</tr>
						</form>
						<%

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
