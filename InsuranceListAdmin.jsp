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
HashMap<String,Insurance> displayInsurance= new HashMap<String,Insurance>();
		displayInsurance= MySQLDataStoreUtilities.getAllInsuranceList();

%>

			<%@include file="AdminHeader.jsp"%>
			<div >

				<div class="width">
					<br/>
					<table>
					<tr>
					<td><h4 align = 'center'>Search: </h4></td>
					<td><input type="TEXT" size="15" name="customerSearchQuery"></input></td>
					<td><h3 align = 'center'>Insurance List</h3></td>
					<td>
						<h4 align = 'center'>Sort by: </h4>
					</td>
					<td>
						<select id="car-type" name="selectedCarType">

							<option value="emailId" selected="selected">
								Name
							</option>

							<option value="firstName">
								Type
							</option>

							<option value="lastName">
								Company
							</option>

						</select>
					</td>

					<td><input style="padding: 4px 7px; font-size: 0.9em;" type="submit" value="Submit" ></input></td>

					</tr>
					</table>

					<br/>

					<table>
						<tr>
							<th style ="color: #fff; background-color:#2F2F2F">Policy No.</th>
							<th style ="color: #fff; background-color:#2F2F2F">Name</th>
							<th style ="color: #fff; background-color:#2F2F2F">Type</th>
							<th style ="color: #fff; background-color:#2F2F2F">Cost Covered</th>
							<th style ="color: #fff; background-color:#2F2F2F">Company</th>
							<th style ="color: #fff; background-color:#2F2F2F">Price</th>
							<th style ="color: #fff; background-color:#2F2F2F">Update</th>
							<th style ="color: #fff; background-color:#2F2F2F">Delete</th>
						</tr>



						<%

					for(String key :displayInsurance.keySet()){



						%>

						<form action='UpdateInsuranceAdmin.jsp' method='get'>
						<tr>
							<td><label><b> <input type='hidden' name='insuranceId' value="<%=displayInsurance.get(key).getInsuranceNumber()%>" /><%=displayInsurance.get(key).getInsuranceNumber() %></b></label></td>
							<td><label> <input type='hidden' name='insuranceName' value="<%=displayInsurance.get(key).getInsuranceName()%>" /><%=displayInsurance.get(key).getInsuranceName() %></label></td>
							<td><label> <input type='hidden' name='insuranceType' value="<%=displayInsurance.get(key).getInsuranceType()%>" /><%=displayInsurance.get(key).getInsuranceType()%></label></td>
							<td><label> <input type='hidden' name='insuranceCostCovered' value="<%=displayInsurance.get(key).getCostCovered()%>" /><%=displayInsurance.get(key).getCostCovered() %></label></td>
							<td><label> <input type='hidden' name='insuranceCompany' value="<%=displayInsurance.get(key).getInsuranceCompany()%>" /><%=displayInsurance.get(key).getInsuranceCompany()%></label></td>
					    <td><label> <input type='hidden' name='insurancePrice' value="<%=displayInsurance.get(key).getInsurancePrice()%>" /><%=displayInsurance.get(key).getInsurancePrice()%></label></td>

							<td><input type="submit" type="hidden" name="action" value="Update" ></input></td>
							<td><input type="submit" type='hidden' name='action' value="Delete"></input></td>
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
