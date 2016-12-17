<%@ page import="reviewPackage.*,registerPackage.*,java.util.*,java.io.*"%>

<% String vehicleType = request.getParameter("vehicleType");
   String vehicleMake = request.getParameter("vehicleMake");
	 String vehicleModel = request.getParameter("vehicleModel");
	 String vehicleId = request.getParameter("vehicleId");
	 Customer customernew = (Customer)session.getAttribute("customer");
	 String userId = customernew.getEmailId();
%>

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
			<div >

				<div class="width">
					<br/>
					<h4 align = 'center'>Write Review for Vehicle Nissan Quest</h4>
					<br/>

						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 500px;padding: 10px; margin-right:auto; margin-left:auto;">

							<form action="WriteReview" method="post">

							<table border="0">
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;">Vehicle Type: </label></td>
							<td><label style ="color: #FFFFFF; font-weight: bold;" ><%=vehicleType%></label></td>
							<input type='hidden' name='vehicleType' value='<%= vehicleType %>'>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Vehicle Make: </label></td>
							<td><label style ="color: #FFFFFF; font-weight: bold;" ><%=vehicleMake%></label></td>
							<input type='hidden' name='vehicleMake' value='<%= vehicleMake %>'>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Vehicle Model: </label></td>
							<td><label style ="color: #FFFFFF; font-weight: bold;" ><%=vehicleModel%></label></td>
							<input type='hidden' name='vehicleModel' value='<%= vehicleModel %>'>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Vehicle ID: </label></td>
							<td><label style ="color: #FFFFFF; font-weight: bold;" ><%=vehicleId%></label></td>
							<input type='hidden' name='vehicleId' value='<%= vehicleId %>'>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Location Name: </label></td>
							<td><input type="TEXT" size="15" name="locationName"></input></td>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Location Zip: </label></td>
							<td><input type="TEXT" size="15" name="locationZip"></input></td>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Location City: </label></td>
							<td><input type="TEXT" size="15" name="locationCity"></input></td>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Location State: </label></td>
							<td><input type="TEXT" size="15" name="locationState"></input></td>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Location Country: </label></td>
							<td><input type="TEXT" size="15" name="locationCountry"></input></td>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">User Email Id: </label></td>
							<td><label style ="color: #FFFFFF; font-weight: bold;" ><%=userId%></label></td>
							<input type='hidden' name='userEmailId' value='<%= userId %>'>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">User Age: </label></td>
							<td><input type="TEXT" size="15" name="userAge"></input></td>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">User Gender: </label></td>
							<td><input type="TEXT" size="15" name="userGender"></input></td>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">User Occupation: </label></td>
							<td><input type="TEXT" size="15" name="userOccupation"></input></td>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Review Rating: </label></td>
							<td><select name='reviewRating'><option name='reviewRating' value='1' selected>1</option><option name='reviewRating' value='2'>2</option>
								<option name='reviewRating' value='3'>3</option><option name='reviewRating' value='4'>4 </option><option name='reviewRating' value='5'>5</option></select></td>
							<tr>
							<tr>
							<td><label style ="color: #FFFFFF; font-weight: bold;" for="fname">Review Text: </label></td>
							<td><textarea rows="4" cols="35" name="reviewText"></textarea></td>
							<tr>
							<tr>
							<td align='center' colspan='2'><input type="submit" value="Write Review" ></input></td>
							<tr>

							</table>


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
