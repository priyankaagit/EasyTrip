<%@ page import="java.util.*, java.io.*, utilityClasses.*, vehiclePackage.*" %>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles-admin.css" type="text/css" />
	
	</head>
	
	<%
		LinkedHashMap<String, Promotion> selectedPromotions;
		ArrayList<String> tweets;
	
		DealMatches dealMatches = new DealMatches();
		
		selectedPromotions = dealMatches.getselectedPromotionsFromTweets();
		tweets = dealMatches.getTweets();
	%>

	<body>

			<%@include file="AdminHeader.jsp"%>		
			<div >
			
				<div class="width">
					<br/>
					<h4 align = 'center'>Admin Dashboard</h4>
					
					
						<p align = 'center'>Latest Tweets/Promotions from rivals ! Add EasyTrip Promotions matching these tweets to boost EasyTrip Sales !</p></br>
						 
						<%
							if(tweets.isEmpty())
							{
						%>		
							<p align='center' style='color:#325b9e'>No Current Promotions From Rivals</p>
							</br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
						<%
							}
							else
							{
								int i=0;
								for(Map.Entry<String,Promotion> m :selectedPromotions.entrySet())
								{
									Promotion s = m.getValue();
									String promoCode = s.getPromoCode();
									String percentageOff = s.getPercentageOff();
									String validTillDate = s.getValidTillDate();
									
									String currentTweet = tweets.get(i);
						%>
									<table>
									<tr>
									<td colspan='4' style ="color: #fff; background-color:#616161"><%= i+1 %>. <%= currentTweet %></td>
									</tr>
									
									</table>
									
									</br>
									
									<fieldset>
									</fieldset>
									</br>
								
						<%
									i++;
								}
								
							}
						%>
						 
						 </br></br></br></br></br></br>
						
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
