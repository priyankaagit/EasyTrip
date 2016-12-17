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
HashMap<String,Location> displayLocation= new HashMap<String,Location>();
		displayLocation= MySQLDataStoreUtilities.getAllLocationList();

%>

			<%@include file="AdminHeader.jsp"%>
			<div >

				<div class="width">
					<br/>
					<table>
					<tr>
					<td><h4 align = 'center'>Search: </h4></td>
					<td><input type="TEXT" size="15" name="customerSearchQuery"></input></td>
					<td><h3 align = 'center'>Locations List</h3></td>
					<td>
						<h4 align = 'center'>Sort by: </h4>
					</td>
					<td>
						<select id="car-type" name="selectedCarType">

							<option value="emailId" selected="selected">
								PIN
							</option>

							<option value="firstName">
								City
							</option>

							<option value="lastName">
								State
							</option>

							<option value="lastName">
								Country
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
							<th style ="color: #fff; background-color:#2F2F2F">Name</th>
							<th style ="color: #fff; background-color:#2F2F2F">PIN</th>
							<th style ="color: #fff; background-color:#2F2F2F">City</th>
							<th style ="color: #fff; background-color:#2F2F2F">State</th>
							<th style ="color: #fff; background-color:#2F2F2F">Country</th>
							<th style ="color: #fff; background-color:#2F2F2F">Address</th>
							<th style ="color: #fff; background-color:#2F2F2F">Phone</th>
							<th style ="color: #fff; background-color:#2F2F2F">Hours</th>
							<th style ="color: #fff; background-color:#2F2F2F">Update</th>
							<th style ="color: #fff; background-color:#2F2F2F">Delete</th>
						</tr>

					<%

					for(String key :displayLocation.keySet()){



						%>

						<form action='UpdateLocationAdmin.jsp' method='get'>
						<tr>
							<td><label><b> <input type='hidden' name='locationId' value='<%=displayLocation.get(key).getLocationid()%>'/>LO<%=displayLocation.get(key).getLocationid() %></b></label></td>
							<td><label> <input type='hidden' name='locationName' value='<%=displayLocation.get(key).getLocationName() %>'/><%=displayLocation.get(key).getLocationName() %></label></td>
							<td><label> <input type='hidden' name='locationPin' value='<%=displayLocation.get(key).getLocationPin() %>'/><%=displayLocation.get(key).getLocationPin()%></label></td>
							<td><label> <input type='hidden' name='locationCity' value='<%=displayLocation.get(key).getLocationCity() %>'/><%=displayLocation.get(key).getLocationCity() %></label></td>
							<td><label> <input type='hidden' name='locationState' value='<%=displayLocation.get(key).getLocationState() %>'/><%=displayLocation.get(key).getLocationState()%></label></td>
					    <td><label> <input type='hidden' name='locationCountry' value='<%=displayLocation.get(key).getLocationCountry() %>'/><%=displayLocation.get(key).getLocationCountry() %></label></td>
							<td><label> <input type='hidden' size = "40" name='locationAddress' value="<%=displayLocation.get(key).getLocationAddress()%>"/><%=displayLocation.get(key).getLocationAddress() %></label></td>
							<td><label> <input type='hidden' name='locationPhone' value='<%=displayLocation.get(key).getLocationPhone() %>'/><%=displayLocation.get(key).getLocationPhone()%></label></td>
							<td><label> <input type='hidden' name='locationHours' value="<%=displayLocation.get(key).getLocationHours() %>"/><%=displayLocation.get(key).getLocationHours() %></label></td>
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
