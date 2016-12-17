<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles-admin.css" type="text/css" />

	</head>
	
	<%
		String action = request.getParameter("action");
		
		String message = "Insurance Added Successfully !";
		
		if(action.equals("add"))
		{
			message = "Insurance Added Successfully !";
		}
		else if(action.equals("update"))
		{
			message = "Insurance Updated Successfully !";
		}
		else if(action.equals("delete"))
		{
			message = "Insurance Deleted Successfully !";
		}
	%>

	<body>

			<%@include file="AdminHeader.jsp"%>
			<div >

				<div class="width">
					<br/>
					

						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">



							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname"><%=message%></label> </p>



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
