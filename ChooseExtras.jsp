<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />

	</head>

	<body>
      <%@ page import="java.util.*,java.io.*,java.util.*,searchPackage.*,vehiclePackage.*,db.*,reservationPackage.*" %>
			<%@include file="Header.jsp"%>
			<div >

				<div class="width">

						<table style="margin: 0px auto;" cellpadding='1' cellspacing='1'>
							 <tr>
								<td><h4 style ="color: #D3D3D3">1.Enter Booking Details</h4></td>
								<td><h4 style ="color: #D3D3D3">2.Select Vehicle<h4></td>
								<td><h4>3.Choose Extras</h4></td>
								<td><h4 style ="color: #D3D3D3">4.Review<h4></td>
								<td><h4 style ="color: #D3D3D3">5.Book<h4></td>
							 </tr>
						 </table>


						 <form action="/easytrip/AccessorySelect" method="get">
						 <table style="margin: 0px auto;" cellpadding='1' cellspacing='1'>
							 <tr>
								
								<td align = 'right'>
									<input type="submit" value="Submit" ></input>
								</td>

							 </tr>
						 </table>


						<br/>


						<fieldset/>


						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Insurance</th>
						</tr>


						<tr>
							<th>Add</th>
							<th>Item Description</th>
							<th>Price</th>
						</tr>

            <%

						HashMap<Integer,Accessory> accessories =  (HashMap<Integer,Accessory> )session.getAttribute("accessories");
						HashMap<Integer,Insurance> insurances = (HashMap<Integer,Insurance>) session.getAttribute("insurances");
           if(insurances !=null)
						for(Integer accId : insurances.keySet()) {
              Insurance insurane = insurances.get(accId);


						  %>
						<tr>
							<td><input type="RADIO" name="insurance" value="<%=insurane.getInsuranceNumber()%>" checked="true"></td>
							<td>
							<table>
								<tr><td>Insurance Name: <%=insurane.getInsuranceName()%></td></tr>
								<tr><td>Company: <%=insurane.getInsuranceCompany()%></td></tr>
								<tr><td>Insurance Type: <%=insurane.getInsuranceType()%></td></tr>
								<tr><td>Cost Covered: <%=insurane.getCostCovered()%></td></tr>
							</table>

							</td>
							<td><%=insurane.getInsurancePrice()%> USD Per Day</td>
						</tr>
						<%
					}
							%>


						<fieldset/>

						<table>

						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Accessories</th>
						</tr>
						<tr>
							<th>Add</th>
							<th>Item Description</th>
							<th>Price</th>
						</tr>
            <%
						if(accessories !=null)
							for(Integer accId : accessories.keySet()) {

								Accessory accessory = accessories.get(accId);

							  %>
						<tr>
							<td><input type="checkbox" name="accessory" value="<%=accessory.getAccId()%>"></td>
							<td>
							<table>
								<tr><td>Accessory Id: <%=accessory.getAccId()%></td></tr>
								<tr><td>Accessory Name: <%=accessory.getAccName()%></td></tr>
								<tr><td>Company Name: <%=accessory.getAccCompany()%></td></tr>

							</table>

							</td>
							<td><%=accessory.getHourPrice()%> USD Per Day</td>
						</tr>

						<% } %>

						</table>

						<fieldset/>


						 <table style="margin: 0px auto;" cellpadding='1' cellspacing='1'>
							 <tr>
								<td align = 'right'>
									<input type="submit" value="Submit" ></input>
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
