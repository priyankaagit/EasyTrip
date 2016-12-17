<%@ page import="registerPackage.*,vehiclePackage.*,java.util.*,java.io.*"%>
<% HashMap<Integer, Location> location =( HashMap<Integer, Location>)session.getAttribute("location");
%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />

	</head>
	<%
		String locationSearchQuery = request.getParameter("locationSearchQuery");
	%>

	<body>

			<%@include file="Header.jsp"%>
			<div >

				<div class="width">
					<br/>
					<h4>Location Search Results For <%=locationSearchQuery%></h4>
					<% for (Integer locationId:location.keySet()){
					   Location loc = location.get(locationId);
					%>
					<br/>

					<table style="width:100%" style="height:100%" border="1" bordercolor="#aaa" cellspacing="0" cellpadding="0">
					<form method = 'get' action = 'ViewLocation.jsp'>
					<tr>

					<td width="40%"><table>
					<tr><th width="40"><strong><%=loc.getLocationName()%></strong></th></tr>
					<tr><td width="40" ><input type="hidden" name="location" value='<%=loc.getLocationAddress()  %>' ><%=loc.getLocationAddress()%></td></tr>
					<tr><td width="40"><input type="hidden" name="location" value='<%=loc.getLocationCity()  %>' ><%=loc.getLocationCity()%> , <%=loc.getLocationState()%> , <%=loc.getLocationCountry()%> , <%=loc.getLocationPin()%> </td></tr>
					<tr><td>Phone: <%=loc.getLocationPhone()%></td></tr>
					<tr><td>Hours of Operation: <%=loc.getLocationHours()%> </td></tr>
					<tr>
					<td rowspan = '4'>
					<input type = 'submit' name = 'viewLocation' value = 'View Location'>
					</td>
					</tr>
					</table></td>

					</tr>
					</form>
					</table>
          <%}%>
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
