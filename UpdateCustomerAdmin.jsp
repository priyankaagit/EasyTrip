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
						<h4 align = 'center'>Delete Customer</h4>
						<br/>
					
							<div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">
						<form id="myForm" action="DeleteAdminServlet" method="post">
						<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Are You Sure you want to delete?</label> </p>
						<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Customer ID </label> <input type="TEXT" size="15" id="fName" name="customerId" value="<%=request.getParameter("customerId")%>" readonly></p>
							
						
						<p><input type="submit"  value="Yes "></p>
				<%	}
					else
					{
					%>
						<h4 align = 'center'>Update Customer</h4>
						<br/>
					
						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">
					
							<form id="myForm" action="UpdateCustomerAdminServlet" method="post">
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Customer ID </label> <input type="TEXT" size="15" id="fName" name="customerId" value="<%=request.getParameter("customerId")%>" readonly></p>
							
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">First Name:* </label> <input type="TEXT" size="15" id="firstName" name="firstName" value="<%=request.getParameter("fname")%>"></input></p>
							<font color="red"><p id="firstNameMessage"></p>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Last Name: </label> <input type="TEXT" size="15" id="lastName" name="lastName" value="<%=request.getParameter("lname")%>"></input></p>
							<font color="red"><p id="lastNameMessage"></p></font>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Email Id:* </label> <input type="TEXT" size="15" id="emailId" name="emailId" value="<%=request.getParameter("email")%>"></input></p>
							<font color="red"><p id="emailMessage"></p></font>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Phone Number:* </label> <input type="TEXT" size="15" id="phoneNumber" name="phoneNumber" value="<%=request.getParameter("phone")%>"></input></p>
							<font color="red"><p id="phoneNumberMessage"></p></font>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">License #: </label> <input type="TEXT" size="15" id="licenseNumber" name="licenseNumber" value="<%=request.getParameter("license")%>"></input></p>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Password:* </label> <input type="password" size="15" id="password" name="password" value="<%=request.getParameter("password")%>"></input></p>
							<font color="red"><p id="PasswordMessage"></p></font>
							<p><input type="button" onclick="myFunction()" value="Submit "></p>
							
							<%} %>
							<script>
							
								function myFunction() {
									nullcheck = 0;
									var text, password, licenseNumber, phoneNumber, emailId, lastName, firstName;
									
									password = document
											.getElementById("password").value;
								
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
									
							
										if (nullcheck == 0) {

											document.getElementById("myForm")
													.submit();
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
