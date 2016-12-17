<%@ page import="java.util.*,java.io.*,java.text.*,reviewPackage.*" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />

	</head>
	<%
		String vehicleMake = request.getParameter("vehicleMake");
		String vehicleModel = request.getParameter("vehicleModel");
	%>

	<body>

			<%@include file="Header.jsp"%>
			<div >

				<div class="width">
					<br/>
					<table>
					<tr>

					<td><h4 align = 'center'>Vehicle Reviews for <%=vehicleMake%> <%=vehicleModel%></h4></td>
					<td>
						<h4 align = 'center'>Sort by: </h4>
					</td>
					<td>
						<select id="car-type" name="selectedCarType">

							<option value="emailId" selected="selected">
								Rating
							</option>

							<option value="firstName">
								Location
							</option>

							<option value="lastName">
								Zip
							</option>

							<option value="lastName">
								City
							</option>

							<option value="lastName">
								State
							</option>

							<option value="lastName">
								Country
							</option>

						</select>
					</td>

					<td><input style="padding: 4px 7px; font-size: 0.9em;" type="submit" value="Submit" ></input></td>

					</tr>
					</table>

					<br/>

					<table>
						<tr>
							<th style ="color: #fff; background-color:#2F2F2F">No.</th>
							<th style ="color: #fff; background-color:#2F2F2F">Customer</th>
							<th style ="color: #fff; background-color:#2F2F2F">Rating</th>
							<th style ="color: #fff; background-color:#2F2F2F">Location</th>
							<th style ="color: #fff; background-color:#2F2F2F">Zip</th>
							<th style ="color: #fff; background-color:#2F2F2F">City</th>
							<th style ="color: #fff; background-color:#2F2F2F">State</th>
							<th style ="color: #fff; background-color:#2F2F2F">Country</th>
							<th style ="color: #fff; background-color:#2F2F2F">Review</th>

						</tr>

						<%
						ArrayList<ReviewVehicle> listReview = (ArrayList<ReviewVehicle>)session.getAttribute("reviewList");
						if(listReview != null)
						{
							int i=1;
							for(ReviewVehicle review : listReview)
							{
								
								%>

								<tr>
									<td><label for="fname"><%=i%></label></td>
									<td><label for="fname"><%=review.getUserEmailId()%></label></td>
									<td><label for="fname"><%=review.getReviewRating()%></label></td>
									<td><label for="fname"><%=review.getLocationName()%></label></td>
									<td><label for="fname"><%=review.getLocationZip()%></label></td>
									<td><label for="fname"><%=review.getLocationCity()%></label></td>
									<td><label for="fname"><%=review.getLocationState()%></label></td>
									<td><label for="fname"><%=review.getLocationCountry()%></label></td>
									<td><label for="fname"><%=review.getReviewText()%></label></td>
								</tr>

								<%
								i++;
							}
						}
						%>

						<!--
						This other rows are just for template purpose.
						-->

						</table>




					 </br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>

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
