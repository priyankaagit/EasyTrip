
<%@ page import="registerPackage.*,java.util.*,java.io.*"%>

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
		
		String successfulSignUpMessage = "";
		String errorMessage = "";
		
		if(action!=null && action.equals("notLoggedIn"))
		{
			successfulSignUpMessage = "To Book your Car, Please ";
		}
		
		if(action!=null && action.equals("signUpSuccessful"))
		{
			successfulSignUpMessage = "Congratulations ! SignUp Successful. Please ";
		}
		
		if(action!=null && action.equals("userDoesNotExist"))
		{
			errorMessage = "User Does Not Exist. Please Check Your Credentials or Sign Up !";
		}
		else if(action!=null && action.equals("selectCorrectUserType"))
		{
			errorMessage = "Please Select Correct User Type !";
		}
		else if(action!=null && action.equals("incorrectUsernamePassword"))
		{
			errorMessage = "Please enter correct combination of Username and Password !";
		}
		
	%>

	<body>

			<%@include file="Header.jsp"%>
			<div >

				<div class="width">
					<br/>
					<h4 align = 'center'><%=successfulSignUpMessage%>Login to your account</h4>
					<br/>

						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">

							<form action="/easytrip/Login" method="post">

							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Username: </label> <input type="TEXT" size="15" name="username"></input></p>
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Password: </label> <input type="password" size="15" name="password"></input></p>

							<p>
							<input  type='radio' name='usertype' value='customer' checked='checked'><label  style ="color: #FFFFFF; font-weight: bold;">&nbspCustomer&nbsp&nbsp&nbsp</label>
							<input type='radio' name='usertype' value='admin'><label style ="color: #FFFFFF; font-weight: bold;">&nbspAdmin&nbsp&nbsp&nbsp</label>
							</p>

							<p><input type="submit" value="Login" ></input></p>
							</form>
						</div>
						<br/><br/>
						
						<h5 align = 'center'><%=errorMessage%></h5>

						</br></br></br>

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
