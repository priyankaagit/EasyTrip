<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />
	
	</head>

	<body>

			<%@include file="Header.jsp"%>
			
			<%@ page import="java.util.*,java.io.*,java.util.*,searchPackage.*,vehiclePackage.*,db.*,reservationPackage.*" %>
			<%@ page session="true"%>
			<%String bId = session.getAttribute("bId").toString();%>
			
			<div >
			
				<div class="width">
					<br/>
					<h4 align = 'center'>It's sad to see you leaving!!</h4>
					<br/>
					
						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">
					
							<form action="/Reservations.jsp" method="post">
							
							<p><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Your reservation <%=bId%> has been cancelled</label>
							
							<p><input type="submit" value="Back to Reservations" ></input></p>
							</form>
						</div>
					
						</br></br></br></br>
						
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
