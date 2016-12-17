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
						<h4 align = 'center'>Delete Location</h4>
						<br/>
					
							<div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">
						<form id="myForm" action="DeleteAdminServlet" method="post">
						<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Are You Sure you want to delete?</label> </p>
						<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Location ID </label> <input type="TEXT" size="15" id="fName" name="locationId" value="<%=request.getParameter("locationId")%>" readonly></p>


						<p><input type="submit"  value="Yes "></p>

			<%	}
					else
					{

						 %>
						 <h4 align = 'center'>Update Location</h4>
							<br/>
					
						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">
						 
						<form id="myForm" action="UpdateLocationAdminServlet" method="post">
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Location ID </label> <input type="TEXT" size="15" id="locationId" name="locationId" value="<%=request.getParameter("locationId")%>" readonly></p>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Location Name: </label> <input type="TEXT" size="15" id="locationName" name="locationName" value="<%=request.getParameter("locationName")%>" ></input></p>
							<font color="red"><p id="locationNameMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Location Pin: </label> <input type="TEXT" size="15" id="locationPin" name="locationPin" value="<%=request.getParameter("locationPin")%>"></input></p>
							<font color="red"><p id="locationPinMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname"> City: </label> <input type="text" size="15" id="locationCity" name="locationCity" value="<%=request.getParameter("locationCity")%>"></input></p>
							<font color="red"><p id="locationCityMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname"> Company: </label> <input type="text" id="locationState" size="15" name="locationState" value="<%=request.getParameter("locationState")%>"></input></p>
							<font color="red"><p id="locationStateMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname"> Country: </label> <input type="text" size="15"  id="locationCountry"name="locationCountry" value="<%=request.getParameter("locationCountry")%>"></input></p>
							<font color="red"><p id="locationCountryMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname"> Address: </label> <input type="text" size="15"  id="locationAddress"name="locationAddress" value="<%=request.getParameter("locationAddress")%>"></input></p>
							<font color="red"><p id="locationAddressMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname"> Hours: </label> <input type="text" size="15"  id="locationHours"name="locationHours" value="<%=request.getParameter("locationHours")%>"></input></p>
							<font color="red"><p id="locationHoursMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname"> Phone: </label> <input type="text" size="15"  id="locationPhone"name="locationPhone" value="<%=request.getParameter("locationPhone")%>"></input></p>
							<font color="red"><p id="locationPhoneMessage"></p></font>
					<p><input type="button" onclick="myFunction()" value="Update Location" ></input></p>

							<%} %>
							<script>

								function myFunction() {

									var text, locationName, locationPin, locationCity,locationState,locationCountry,locationAddress,locationHours,locationPhone;

									// Get the value of the input field with id="numb"
									locationAddress = document
											.getElementById("locationAddress").value;

									locationHours = document
									.getElementById("locationHours").value;

									locationPhone = document
									.getElementById("locationPhone").value;
									locationName = document
											.getElementById("locationName").value;
									locationPin = document
											.getElementById("locationPin").value;
									locationCity = document
											.getElementById("locationCity").value;

									locationState = document
									.getElementById("locationState").value;

									locationCountry = document
									.getElementById("locationCountry").value;




									nullcheck = 0;

									//If all mandatory fields are filled

										 if(nullcheck == 0)
											 {
										 if(locationName.length==0)
											 {
												text = "Field is mandatory*"
											 document
												.getElementById("locationNameMessage").innerHTML = text;
										nullcheck++;
											 }
										 if(locationPin.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("locationPinMessage").innerHTML = text;
										nullcheck++;
										 }

										 if(isNaN(locationPhone))
											 {
											 text = "Invalid Entry, Accept only digitxs*"
												 document
													.getElementById("locationPhoneMessage").innerHTML = text;
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

	   <%@include file="FooterAdmin.jsp"%>

	</body>

</html>
