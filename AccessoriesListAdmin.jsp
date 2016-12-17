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
HashMap<String,Accessory> displayAccessory= new HashMap<String,Accessory>();
		displayAccessory= MySQLDataStoreUtilities.getAllAccessoryList();

%>

			<%@include file="AdminHeader.jsp"%>
			<div >

				<div class="width">
					<br/>
					<table>
					<tr>
					<td><h4 align = 'center'>Search: </h4></td>
					<td><input type="TEXT" size="15" name="customerSearchQuery"></input></td>
					<td><h3 align = 'center'>Accessories List</h3></td>
					<td>
						<h4 align = 'center'>Sort by: </h4>
					</td>
					<td>
						<select id="car-type" name="selectedCarType">

							<option value="emailId" selected="selected">
								Name
							</option>

							<option value="emailId">
								Total
							</option>

							<option value="emailId">
								Available
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
							<th style ="color: #fff; background-color:#2F2F2F">Company Name</th>
							<th style ="color: #fff; background-color:#2F2F2F">Total</th>
							<th style ="color: #fff; background-color:#2F2F2F">Available</th>
							<th style ="color: #fff; background-color:#2F2F2F">Price</th>
							<th style ="color: #fff; background-color:#2F2F2F">Update</th>
							<th style ="color: #fff; background-color:#2F2F2F">Delete</th>
						</tr>

						<%

					for(String key :displayAccessory.keySet()){



						%>

						<form action='UpdateAccessoryAdmin.jsp' method='get'>
						<tr>
							<td><label><b> <input type='hidden' name='accId' value='<%=displayAccessory.get(key).getAccId()%>'/>ACC<%=displayAccessory.get(key).getAccId() %></label></td>
							<td><label> <input type='hidden' name='accessoryName' value='<%=displayAccessory.get(key).getAccName() %>' /><%=displayAccessory.get(key).getAccName() %></label></td>
							<td><label> <input type='hidden' name='accessoryCompany' value='<%=displayAccessory.get(key).getAccCompany() %>' /><%=displayAccessory.get(key).getAccCompany() %></label></td>
							<td><label> <input type='hidden' name='accessoryStock' value='<%=displayAccessory.get(key).getTotalNumber() %>' /><%=displayAccessory.get(key).getTotalNumber()%></label></td>
							<td><label> <input type='hidden' name='accessoryAvailStock' value='<%=displayAccessory.get(key).getAvailableNumber() %>' /><%=displayAccessory.get(key).getAvailableNumber() %></label></td>
							<td><label> <input type='hidden' name='accessoryPrice' value='<%=displayAccessory.get(key).getHourPrice() %>' /><%=displayAccessory.get(key).getHourPrice()%></label></td>

							<td><input type="submit"  type="hidden" name="action"  value="Update" ></input></td>
							<td><input type="submit"  type="hidden" name="action"  value="Delete" ></input></td>
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
