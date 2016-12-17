<%@ page import="java.util.*, java.io.*, db.*, utilityClasses.*, reviewPackage.*" %>
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
		
				<aside id="sidebar" >	
				
					</br>
				
					<div class="responsive-sidebar-hide block">
					
						<h5 align='left'><a href="Trending.jsp?trendType=topFiveLikedVehicles">Top 5 Most Liked Vehicles</a></h5>
						<h5 align='left'><a href="Trending.jsp?trendType=top5BookedVehicles">Top 5 Booked Vehicles</a></h5>
						<h5 align='left'><a href="Trending.jsp?trendType=top5ReviewedVehicles">Top 5 Reviewed Vehicles</a></h5>
						<h5 align='left'><a href="Trending.jsp?trendType=top5BookedLocations">Top 5 Booked Locations</a></h5>
						<h5 align='left'><a href="Trending.jsp?trendType=top5ReviewedZipCodes">Top 5 Reviewed Zip Codes</a></h5>
						<h5 align='left'><a href="Trending.jsp?trendType=top5ReviewedLocations">Top 5 Reviewed Locations</a></h5>
						
					</div>
					
					<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
								
				</aside>		
			
				<section id='content' class="column-right">
				
				<h4 align = 'center'>Trending on EasyTrip</h4>
				
				
				<%
					String trendType = request.getParameter("trendType");
					
					if(trendType.equals("topFiveLikedVehicles"))
					{
						
						Integer serialNumber = 1;
						LinkedHashMap<String, Double> topFiveLikedVehicles;
						topFiveLikedVehicles = MongoDBDataStoreUtilities.getTop5LikedVehicles();
				%>
				
				
						<table>
						<th colspan='3' align='center' style ="color: #fff; background-color:#2F2F2F">Top 5 Most Liked Vehicles</th>
						
						<tr style ="font-weight: bold;">
						<td align='center'>Sr.No</td>
						<td align='center'>Vehicle</td>
						<td align='center'>Average Rating</td>
						</tr>
						
						<%
								for(Map.Entry<String, Double> m :topFiveLikedVehicles.entrySet())
								{
									String key = m.getKey();
									Double value = m.getValue();
						%>
						
						
									<tr>
									<td align='center'><%= serialNumber %></td>
									<td align='center'><%= key %></td>
									<td align='center'><%= value %></td>
									</tr>
						
						<%
									serialNumber++;
								}
						%>
						
						</table>
				
				<%
					}
					
				%>
				
				<%
					
					if(trendType.equals("top5BookedVehicles"))
					{
						
						Integer serialNumber = 1;
						LinkedHashMap<String, Integer> top5BookedVehicles;
						top5BookedVehicles = MySQLDataStoreUtilitiesMohammed.getTop5BookedVehicles();
				%>
				
				
						<table>
						<th colspan='3' align='center' style ="color: #fff; background-color:#2F2F2F">Top 5 Booked Vehicles</th>
						
						<tr style ="font-weight: bold;">
						<td align='center'>Sr.No</td>
						<td align='center'>Vehicle</td>
						<td align='center'>Times Booked</td>
						</tr>
						
						<%
								for(Map.Entry<String, Integer> m :top5BookedVehicles.entrySet())
								{
									String key = m.getKey();
									Integer value = m.getValue();
						%>
						
						
									<tr>
									<td align='center'><%= serialNumber %></td>
									<td align='center'><%= key %></td>
									<td align='center'><%= value %></td>
									</tr>
						
						<%
									serialNumber++;
								}
						%>
						
						</table>
				
				<%
					}
					
				%>
				
				
				<%
					
					if(trendType.equals("top5ReviewedVehicles"))
					{
						
						Integer serialNumber = 1;
						LinkedHashMap<String, Integer> topFiveReviewedVehicles;
						topFiveReviewedVehicles = MongoDBDataStoreUtilities.getTop5ReviewedVehicles();
				%>
				
				
						<table>
						<th colspan='3' align='center' style ="color: #fff; background-color:#2F2F2F">Top 5 Reviewed Vehicles</th>
						
						<tr style ="font-weight: bold;">
						<td align='center'>Sr.No</td>
						<td align='center'>Vehicle</td>
						<td align='center'>Times Reviewed</td>
						</tr>
						
						<%
								for(Map.Entry<String, Integer> m :topFiveReviewedVehicles.entrySet())
								{
									String key = m.getKey();
									Integer value = m.getValue();
						%>
						
						
									<tr>
									<td align='center'><%= serialNumber %></td>
									<td align='center'><%= key %></td>
									<td align='center'><%= value %></td>
									</tr>
						
						<%
									serialNumber++;
								}
						%>
						
						</table>
				
				<%
					}
					
				%>
				
				<%
					
					if(trendType.equals("top5BookedLocations"))
					{
						
						Integer serialNumber = 1;
						LinkedHashMap<String, Integer> top5BookedLocations;
						top5BookedLocations = MySQLDataStoreUtilitiesMohammed.getTop5BookedLocations();
				%>
				
				
						<table>
						<th colspan='3' align='center' style ="color: #fff; background-color:#2F2F2F">Top 5 Booked Locations</th>
						
						<tr style ="font-weight: bold;">
						<td align='center'>Sr.No</td>
						<td align='center'>Location</td>
						<td align='center'>Times Booked</td>
						</tr>
						
						<%
								for(Map.Entry<String, Integer> m :top5BookedLocations.entrySet())
								{
									String key = m.getKey();
									Integer value = m.getValue();
						%>
						
						
									<tr>
									<td align='center'><%= serialNumber %></td>
									<td align='center'><%= key %></td>
									<td align='center'><%= value %></td>
									</tr>
						
						<%
									serialNumber++;
								}
						%>
						
						</table>
				
				<%
					}
					
				%>
				
				
				
				<%
					
					if(trendType.equals("top5ReviewedZipCodes"))
					{
						
						Integer serialNumber = 1;
						LinkedHashMap<String, Integer> top5ReviewedZipCodes;
						top5ReviewedZipCodes = MongoDBDataStoreUtilities.getTop5ReviewedZipCodes();
				%>
				
				
						<table>
						<th colspan='3' align='center' style ="color: #fff; background-color:#2F2F2F">Top 5 Reviewed Zip Codes</th>
						
						<tr style ="font-weight: bold;">
						<td align='center'>Sr.No</td>
						<td align='center'>Zip Code</td>
						<td align='center'>Times Reviewed</td>
						</tr>
						
						<%
								for(Map.Entry<String, Integer> m :top5ReviewedZipCodes.entrySet())
								{
									String key = m.getKey();
									Integer value = m.getValue();
						%>
						
						
									<tr>
									<td align='center'><%= serialNumber %></td>
									<td align='center'><%= key %></td>
									<td align='center'><%= value %></td>
									</tr>
						
						<%
									serialNumber++;
								}
						%>
						
						</table>
				
				<%
					}
					
				%>
				
				<%
					
					if(trendType.equals("top5ReviewedLocations"))
					{
						
						Integer serialNumber = 1;
						LinkedHashMap<String, Integer> top5ReviewedLocations;
						top5ReviewedLocations = MongoDBDataStoreUtilities.getTop5ReviewedLocations();
				%>
				
				
						<table>
						<th colspan='3' align='center' style ="color: #fff; background-color:#2F2F2F">Top 5 Reviewed Locations</th>
						
						<tr style ="font-weight: bold;">
						<td align='center'>Sr.No</td>
						<td align='center'>Location</td>
						<td align='center'>Times Reviewed</td>
						</tr>
						
						<%
								for(Map.Entry<String, Integer> m :top5ReviewedLocations.entrySet())
								{
									String key = m.getKey();
									Integer value = m.getValue();
						%>
						
						
									<tr>
									<td align='center'><%= serialNumber %></td>
									<td align='center'><%= key %></td>
									<td align='center'><%= value %></td>
									</tr>
						
						<%
									serialNumber++;
								}
						%>
						
						</table>
				
				<%
					}
					
				%>
				
						 
				<br/><br/><br/><br/><br/><br/>
				
				</section>
			
			
			
				
			</div>
			
			<div class="clear"></div>

	   <%@include file="Footer.jsp"%>

	</body>

</html>
