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
					<h4 align = 'center'>Add a new Vehicle</h4>
					<br/>

						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">

							<form id="myForm" action="AddVehicleAdminServlet" method="post">

							<p><label style ="color: #fff; font-weight: bold;" for="fname">VIN (Vehicle Identification No): </label> <input type="TEXT" size="15" id = "vehicleVin" name="vehicleVin"></input></p>
							<font color="red"><p id="vehicleVinMessage"></p></font>

							<p><label style ="color: #fff; font-weight: bold;" for="fname">Make: </label> <input type="TEXT" size="15" id = "vehicleMake" name="vehicleMake"></input></p>
							<font color="red"><p id="vehicleMakeMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Model: </label> <input type="text" size="15" id = "vehicleModel" name="vehicleModel"></input></p>
							<font color="red"><p id="vehicleModelMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Vehicle Type: </label>
							<!-- 
							 <input type="text" size="15" id = "vehicleType" name="vehicleType"></input></p> -->
							
							
							<select id="car-type" id = "vehicleType" name="vehicleType">
			
							<option value="Please Select a Type" selected="selected">
								Select a Type and Click View Vehicles
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
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Location Id: </label> <input type="TEXT" size="15" id = "locationId" name="locationId"></input></p>
							<font color="red"><p id="locationIdMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Vehicle Price: </label> <input type="TEXT" size="15" id = "vehiclePrice" name="vehiclePrice"></input></p>
							<font color="red"><p id="vehiclePriceMessage"></p></font>

								<p><input type="button" onclick="myFunctiono()" value="Add Vehicle" ></input></p>

							<script>

								function myFunctiono() {

									var text, vehicleVin, vehicleId, vehicleModel,vehicleMake,vehicleType,locationId,vehiclePrice;
									vehicleVin = document
									.getElementById("vehicleVin").value;
							
									vehicleModel = document
									.getElementById("vehicleModel").value;
									vehicleMake = document
									.getElementById("vehicleMake").value;
						
									locationId = document
									.getElementById("locationId").value;
									vehiclePrice = document
									.getElementById("vehiclePrice").value;
									nullcheck = 0;

									//If all mandatory fields are filled
									if(nullcheck==0)
										 {
											if(isNaN(vehicleVin.substring(0,1)))
										 	{
												text = "vehicle_vin must be in the format. ex 1HGCM82633A004352"
													 document
														.getElementById("vehicleVinMessage").innerHTML = text;
												nullcheck++;
										 	}

											if(isNaN(vehicleVin.substring(5,10)))
										 	{
												text = "vehicle_vin must be in the format. ex 1HGCM82633A004352"
													 document
														.getElementById("vehicleVinMessage").innerHTML = text;
												nullcheck++;
										 	}
											if(isNaN(vehicleVin.substring(11,17)))
										 	{
												text = "Vin must be in the format. ex 1HGCM82633A004352"
													 document
														.getElementById("vehicleVinMessage").innerHTML = text;
												nullcheck++;
										 	}
										 if(vehicleVin.length==0)
											 {

												text = "Field is mandatory*"
											 document
												.getElementById("vehicleVinMessage").innerHTML = text;
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
										 
										 if(locationId.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("locationIdMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(vehiclePrice.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("vehiclePriceMessage").innerHTML = text;
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
