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
					<h4 align = 'center'>Add a new Location</h4>
					<br/>
					
						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">
					
							<form id="myForm" action="AddLocationAdminServlet" method="post">
							
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Location Name: </label> <input type="TEXT" id="locationName" size="15" name="locationName"></input></p>
							<font color="red"><p id="locationNameMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">PIN Code: </label> <input type="TEXT" id ="locationPin" size="15" name="locationPin"></input></p>
							<font color="red"><p id="locationPinMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Location City: </label> <input type="text" id="locationCity" size="15" name="locationCity"></input></p>
							<font color="red"><p id="locationCityMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Location State: </label> <input type="text" id="locationState" size="15" name="locationState"></input></p>
							<font color="red"><p id="locationStateMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Location Country: </label> <input type="TEXT" id="locationCountry" size="15" name="locationCountry"></input></p>
							<font color="red"><p id="locationCountryMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Location Address: </label> <input type="TEXT" id="locationAddress" size="15" name="locationAddress"></input></p>
							<font color="red"><p id="locationAddressMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Location Open Hours: </label> <input type="TEXT" id="locationHours" size="15" name="locationHours"></input></p>
							<font color="red"><p id="locationHoursMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Phone Number: </label> <input type="TEXT" size="15" id="locationPhone" name="locationPhone"></input></p>
							<font color="red"><p id="locationPhoneMessage"></p></font>
							
							<p><input type="button" onclick="myFunction()" value="Add Location" ></input></p>
							
							
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
