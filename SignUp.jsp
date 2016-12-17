<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />

	</head>
	
	<%
	
		String action = request.getParameter("action");
		
		String firstName = "";
		String lastName = "";
		String emailId = "";
		String phone = "";
		String password = "";
		String licenseNo = "";
		
		if(request.getParameter("firstName") != null)
		{
			firstName = request.getParameter("firstName");
		}
		if(request.getParameter("lastName") != null)
		{
			lastName = request.getParameter("lastName");
		}
		if(request.getParameter("emailId") != null)
		{
			emailId = request.getParameter("emailId");
		}
		if(request.getParameter("phone") != null)
		{
			phone = request.getParameter("phone");
		}
		if(request.getParameter("password") != null)
		{
			password = request.getParameter("password");
		}
		if(request.getParameter("licenseNo") != null)
		{
			licenseNo = request.getParameter("licenseNo");
		}
		
		String errorMessage = "";
		
		if(action!=null && action.equals("usernameAlreadyExists"))
		{
			errorMessage = "Username already exists ! Please choose a different Username for your account !";
		}
		else if(action!=null && action.equals("blankFields"))
		{
			errorMessage = "Please fill all the fields ! No blank fields allowed !";
		}
		
		
	%>

	<body>

			<%@include file="Header.jsp"%>
			<div >

				<div class="width">
					<br/>
					<h4 align = 'center'>SignUp with EasyTrip Car Rental</h4>
					<br/>

						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">

							<form action="/easytrip/SignUp" method="post">

							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">First Name: </label> <input type="TEXT" size="15" name="firstName" value='<%=firstName%>'></input></p>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Last Name: </label> <input type="TEXT" size="15" name="lastName" value='<%=lastName%>'></input></p>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Email Id: </label> <input type="TEXT" size="15" name="emailId" value='<%=emailId%>'></input></p>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Phone Number: </label> <input type="TEXT" size="15" name="phone" value='<%=phone%>'></input></p>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">License Number: </label> <input type="TEXT" size="15" name="licenseNo" value='<%=licenseNo%>'></input></p>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Password: </label> <input type="password" size="15" name="password" value='<%=password%>'></input></p>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Re-Enter Password: </label> <input type="password" size="15" name="rePassword" value='<%=password%>'></input></p>

							<p><input type="submit" value="Sign Up" ></input></p>
							</form>
						</div>
						
						<br/><br/>
						
						<h5 align = 'center'><%=errorMessage%></h5>

						</br></br>

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
