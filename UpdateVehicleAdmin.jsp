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
						<h4 align = 'center'>Delete Vehicle</h4>
						<br/>
					
							<div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">
						<form id="myForm" action="/EasyTrip/DeleteAdminServlet" method="post">
						<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Are You Sure you want to delete?</label> </p>
						<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Vehicle Vin </label> <input type="TEXT" size="15" id="vehicleVin" name="vehicleVin" value="<%=request.getParameter("vehicleVin")%>" readonly></p>
							
						
						<p><input type="submit"  value="Yes "></p>
						
						
				
			<%	}
					else
					{
						
						 %>
							<h4 align = 'center'>Update Vehicle</h4>
							<br/>
					
						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">
						 
							<form id="myForm" action="UpdateVehicleAdminServlet" method="post">
							
							
							
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">VIN (Vehicle Identification No): </label> <input type="TEXT" size="15" id="vehicleVin" name="vehicleVin" value="<%=request.getParameter("vehicleVin")%>" readonly></p>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Vehicle Id : </label> <input type="TEXT" size="15" id="vehicleId" name="vehicleId" value="<%=request.getParameter("vehicleId")%>" readonly></input></p>

							
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Make: </label> <input type="TEXT" size="15" id="vehicleMake" name="vehicleMake" value="<%=request.getParameter("vehicleMake")%>" ></input></p>
							<font color="red"><p id="vehicleMakeMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Model: </label> <input type="TEXT" size="15" id="vehicleModel" name="vehicleModel" value="<%=request.getParameter("vehicleModel")%>" ></input></p>
							<font color="red"><p id="vehicleModelMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Vehicle Type: </label> <input type="TEXT" size="15" id="vehicleType" name="vehicleType" value="<%=request.getParameter("vehicleType")%>" ></input></p>
							<font color="red"><p id="vehicleTypeMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Location Id: </label> <input type="TEXT" size="15" id="locationId" name="locationId" value="<%=request.getParameter("locationId")%>" ></input></p>
							<font color="red"><p id="locationIdMessage"></p></font>

							
							
							
							<p><input type="button" onclick="myFunction()" value="Update Vehicle" ></input></p>
							<%} %>
							<script>
							
								function myFunction() {
								
									var text, vehicleVin, vehicleId, vehicleModel,vehicleMake,vehicleType,locationId,vehiclePrice;
									vehicleVin = document
									.getElementById("vehicleVin").value;
									vehicleId = document
									.getElementById("vehicleId").value;
									vehicleModel = document
									.getElementById("vehicleModel").value;
									vehicleMake = document
							        .getElementById("vehicleMake").value;
									vehicleType = document
									.getElementById("vehicleType").value;
									locationId = document
									.getElementById("locationId").value;
							
						
							
									
									var nullcheck = 0;
									
									//If all mandatory fields are filled
									if(nullcheck==0)
										{
										 
					
										 if(vehicleVin.length==0)
											 {
							
												text = "Field is mandatory*"
											 document
												.getElementById("vehicleVinMessage").innerHTML = text;
										nullcheck++;
											 }
										 if(vehicleId.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("vehicleIdMessage").innerHTML = text;
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
										 if(vehicleType.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("vehicleTypeMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(locationId.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("locationIdMessage").innerHTML = text;
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
					
						</br></br></br></br></br></br></br></br></br></br>
						
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
