<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />
		<script type="text/javascript" src="/easytrip/javascriptForLocationTabSearch.js"></script>
		
	</head>
	
	<%
		String locationValue = "";
	
		String valueFromRequest = request.getParameter("locationValue");
		
		if(valueFromRequest!=null)
		{
			locationValue = valueFromRequest;
			
		}
		
	%>

	<body onload="init()">

			<%@include file="Header.jsp"%>		
			<div >
			
				<div class="width">
					<br/>
					<h4>EasyTrip Car Rental Locations</h4>
					<br/>
							
						<form action="LocationResult" method="get" style="background-color: #D3D3D3;">
						<table style="background-color: #D3D3D3;">
						<tr><td colspan='2'><h5 style="background-color: #D3D3D3;">Enter a Location City or Zip Code:</h5></td></tr>
						<tr>
						
						<td>
						<div name='autofillform'>
						<input type="TEXT" size="15" name="locationSearchQuery" id="searchId" onkeyup="doCompletion()"  placeholder='Enter Location...' value='<%= locationValue %>'></input>
						<div id='auto-row'>
						<table border='0' id="complete-table" class="popupBox"></table>
						</div>
						</div>
						</td>
						
						<td><input type="submit" value="Find Locations" ></input></td>
						</tr>
						<tr><td colspan='2'><h5 style="background-color: #D3D3D3;">e.g. New York or 10011</h5></td></tr>
						</table>
						</form>
						
						
						
						</br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
						
						
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
