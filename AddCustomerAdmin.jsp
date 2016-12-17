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
					<h4 align = 'center'>Add a new Customer</h4>
					<br/>

						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">

							<form id="myForm" action="AddCustomerAdminServlet" method="post">

							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">First Name:* </label> <input type="TEXT" size="15" id="firstName" name="firstName"></input></p>
							<font color="red"><p id="firstNameMessage"></p>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Last Name: </label> <input type="TEXT" size="15" id="lastName" name="lastName"></input></p>
							<font color="red"><p id="lastNameMessage"></p></font>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Email Id:* </label> <input type="TEXT" size="15" id="emailId" name="emailId"></input></p>
							<font color="red"><p id="emailMessage"></p></font>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Phone Number:* </label> <input type="TEXT" size="15" id="phoneNumber" name="phoneNumber"></input></p>
							<font color="red"><p id="phoneNumberMessage"></p></font>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">License #: </label> <input type="TEXT" size="15" id="licenseNumber" name="licenseNumber"></input></p>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Password:* </label> <input type="password" size="15" id="password" name="password"></input></p>
							<font color="red"><p id="rePasswordMessage"></p></font>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Re-Enter Password:* </label> <input type="password" size="15" id="rePassword" name="rePassword"></input></p>
							<font color="red"><p id="passwordMessage"></p></font>
							<p><input type="button" onclick="myFunction()" value="Submit "></p>
							<script>

								function myFunction() {

									var text, password, rePassword, licenseNumber, phoneNumber, emailId, lastName, firstName;
									var numbers = /^[0-9]+$/;
									// Get the value of the input field with id="numb"
									password = document
											.getElementById("password").value;
									rePassword = document
											.getElementById("rePassword").value;
									licenseNumber = document
											.getElementById("licenseNumber").value;
									phoneNumber = document
											.getElementById("phoneNumber").value;
									emailId = document
											.getElementById("emailId").value;
									lastName = document
											.getElementById("lastName").value;
									firstName = document
											.getElementById("firstName").value;
									nullcheck = 0;
									if (nullcheck == 0) {
										text = "field is mandatory*"
										if (password.length == 0) {

											document
													.getElementById("passwordMessage").innerHTML = text;
											nullcheck++;
										}
										if (rePassword.length == 0) {

											document
													.getElementById("rePasswordMessage").innerHTML = text;
											nullcheck++;
										}

										if (phoneNumber.length == 0) {

											document
													.getElementById("phoneNumberMessage").innerHTML = text;
											nullcheck++;
										}
										if (emailId.length == 0) {

											document
													.getElementById("emailMessage").innerHTML = text;
											nullcheck++;
										}
										if (firstName.length == 0) {

											document
													.getElementById("firstNameMessage").innerHTML = text;
											nullcheck++;
										}

									}

									//If all mandatory fields are filled
									if (nullcheck == 0) {

										/*  if(!emailId.includes("@")&&emailId.includes(".com"))
											 {
											 text= "Email is not valid"
											 window.alert("wrong")
												 document.getElementById("emailMessage").innerHTML = text;
											 nullcheck++;
											 } */

										if (password != rePassword) {

											text = "Password is not Matched!";
											document
													.getElementById("rePasswordMessage").innerHTML = text;
											nullcheck++;
										}

										/* if(phoneNumber.value.match(numbers)==false)
											{
											window.alert("");
											text = "Invalid Phone Number!";
											document.getElementById("phoneNumberMessage").innerHTML = text;
											nullcheck++;
											} */
										if (nullcheck == 0) {

											document.getElementById("myForm")
													.submit();
										}
									}
								}
							</script></form>
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
