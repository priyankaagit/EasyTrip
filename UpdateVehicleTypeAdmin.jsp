<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles-admin.css" type="text/css" />

	</head>

	<body>

			<%@include file="AdminHeader.jsp"%>
			<div >

				<div class="width">
					<br/>
					
					<%
					if(request.getParameter("action").contentEquals("Delete"))
					{
						%>
						<h4 align = 'center'>Delete Vehicle Info</h4>
						<br/>
					
							<div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">
						<form id="myForm" action="DeleteAdminServlet" method="post">
						<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Are You Sure you want to delete?</label> </p>
						<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Vehicle Id</label> <input type="TEXT" size="15" id="fName" name="vehicleId" value="<%=request.getParameter("vehicleId")%>" readonly></p>


						<p><input type="submit"  value="Yes "></p>

			<%	}
					else
					{

						 %>
						 <h4 align = 'center'>Update Vehicle Info</h4>
							<br/>
					
						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">
							<form  id="myForm" action="UpdateVehicleTypeAdminServlet" method="post" enctype="multipart/form-data">

							
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Vehicle Id: </label> <input type="text" size="15" id="vehicleModel" name="vehicleId" value="<%=request.getParameter("vehicleId")%>" readonly></input></p>
							<font color="red"><p id="vehicleModelMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Vehicle Price: </label> <input type="TEXT" size="15" id="vehiclePrice" name="vehiclePrice" value="<%=request.getParameter("vehiclePrice")%>" ></input></p>
							<font color="red"><p id="vehiclePriceMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Mileage: </label> <input type="TEXT" size="15" id="vehicleMilage" name="vehicleMilage" value="<%=request.getParameter("vehicleMilage")%>"></input></p>
							<font color="red"><p id="vehicleMilageMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Passengers: </label> <input type="TEXT" size="15" id="vehiclePassenger" name="vehiclePassenger" value="<%=request.getParameter("vehiclePassenger")%>"></input></p>
								<font color="red"><p id="vehiclePassengerMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Small Luggage: </label> <input type="TEXT" size="15" id="vehicleSLuggage" name="vehicleSLuggage" value="<%=request.getParameter("vehicleSLuggage")%>"></input></p>
								<font color="red"><p id="vehicleSLuggageMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Large Luggage: </label> <input type="TEXT" size="15" id="vehicleLLuggage" name="vehicleLLuggage" value="<%=request.getParameter("vehicleLLuggage")%>"></input></p>
								<font color="red"><p id="vehicleLLuggageMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Transmission: </label> <input type="TEXT" size="15" id="vehicleTransmission" name="vehicleTransmission" value="<%=request.getParameter("vehicleTransmission")%>"></input></p>
							<font color="red"><p id="vehicleTransmissionMessage"></p></font>
								<p><label style ="color: #fff; font-weight: bold;" for="fname">Image Path  : </label> <input  type="TEXT"   size="15" id="vehicleImage" name="vehicleImage" value='<%=request.getParameter("vehicleImage")%>'></input></p>
								           
							

							<p><input type="submit" onclick="myFunction()" value="Upload" name="upload" id="upload" ></input></p>
								<%} %>
							<script>

								function myFunction() {

									var text, vehiclePassenger, vehicleSLuggage, vehicleLLuggage,vehicleMake,vehicleTransmission,vehicleMilage,vehiclePrice,vehicleModel;
									var numbers = /^[0-9]+$/;
									// Get the value of the input field with id="numb"
									vehiclePassenger = document
											.getElementById("vehiclePassenger").value;
									vehicleSLuggage = document
											.getElementById("vehicleSLuggage").value;
									vehicleLLuggage = document
											.getElementById("vehicleLLuggage").value;

									vehicleTransmission = document
									.getElementById("vehicleTransmission").value;

									vehicleMilage = document
									.getElementById("vehicleMilage").value;

									vehiclePrice = document
									.getElementById("vehiclePrice").value;

									vehicleModel = document
									.getElementById("vehicleModel").value;

									vehicleMake = document
									.getElementById("vehicleMake").value;

									nullcheck = 0;

									//If all mandatory fields are filled
									if (nullcheck == 0) {
										text = "Invalid field, Accept only numeric"
										 if (isNaN(vehiclePassenger))
										  {

												document.getElementById("vehiclePassengerMessage").innerHTML = text;
												nullcheck++;
										  }
										 if (isNaN(vehicleSLuggage))
										  {

												document
														.getElementById("vehicleSLuggageMessage").innerHTML = text;
												nullcheck++;
										  }
										 if (isNaN(vehicleLLuggage))
										  {
											 document
												.getElementById("vehicleLLuggageMessage").innerHTML = text;
										nullcheck++;
										  }

										 if(vehicleMake.length==0)
											 {
												text = "Field is mandatory*"
											 document
												.getElementById("vehicleMakeMessage").innerHTML = text;
										nullcheck++;
											 }
										 if(vehicleModel.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("vehicleModelMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(vehiclePrice.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("vehiclePriceMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(vehicleTransmission.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("vehicleTransmissionMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(vehicleLLuggage.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("vehicleLLuggageMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(vehicleSLuggage.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("vehicleSLuggageMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(vehiclePassenger.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("vehiclePassengerMessage").innerHTML = text;
										nullcheck++;
										 }

										if (nullcheck == 0) {

											document.getElementById("myForm")
													.submit();
										}
									}
								}
							</script>
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
