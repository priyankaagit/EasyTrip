<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles-admin.css" type="text/css" />

	</head>

	<body>
			<%@ page import="java.io.*,java.util.*,searchPackage.*,vehiclePackage.*,reservationPackage.*,db.*" %>
			<%@include file="AdminHeader.jsp"%>
			<div >

				<div class="width">
					<br/>
					<h4 align = 'center'>Add Vehicle Info</h4>
					<br/>

						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">
						  <%
							ArrayList<String> vehicleList = MySQLDataStoreUtilities.getVehicleClass();
						  %>

							<form  id="myForm" action="AddVehicleTypeAdminServlet" method="post" enctype="multipart/form-data">
              <p>	<label style ="color: #fff; font-weight: bold;" for="fname">Vehicle Id</label>
										 <select name="vehicleId">
											<% for(String vid : vehicleList){ %>
												<option value="<%=vid%>">
													<%=vid%>
												</option>
                        <% } %>
										</select></p>


							<p><label style ="color: #fff; font-weight: bold;" for="fname">Vehicle Price: </label> <input type="TEXT" size="15" id="vehiclePrice" name="vehiclePrice"></input></p>
							<font color="red"><p id="vehiclePriceMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Mileage: </label> <input type="TEXT" size="15" id="vehicleMilage" name="vehicleMilage"></input></p>
							<font color="red"><p id="vehicleMilageMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Passengers: </label> <input type="TEXT" size="15" id="vehiclePassenger" name="vehiclePassenger"></input></p>
								<font color="red"><p id="vehiclePassengerMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Small Luggage: </label> <input type="TEXT" size="15" id="vehicleSLuggage" name="vehicleSLuggage"></input></p>
								<font color="red"><p id="vehicleSLuggageMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Large Luggage: </label> <input type="TEXT" size="15" id="vehicleLLuggage" name="vehicleLLuggage"></input></p>
								<font color="red"><p id="vehicleLLuggageMessage"></p></font>
								<p><label style ="color: #fff; font-weight: bold;" for="fname">Image Path  : </label> <input  type="text"   size="15" id="vehicleImage" name="vehicleImage"></input></p>
								           
								
								<font color="red"><p id="vehicleImageMessage"></p></font>
	
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Transmission: </label> <input type="TEXT" size="15" id="vehicleTransmission" name="vehicleTransmission"></input></p>
							<font color="red"><p id="vehicleTransmissionMessage"></p></font>
							<input type ="submit" value="Upload" name="upload" id="upload" >




							</form>
						</div>

						</br></br></br></br></br>

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
