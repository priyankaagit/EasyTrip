<%@ page import="java.util.*, java.io.*, utilityClasses.*, vehiclePackage.*" %>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />
	
	</head>
	
	<%
		LinkedHashMap<String, Promotion> selectedPromotions;
		ArrayList<String> tweets;
	
		DealMatches dealMatches = new DealMatches();
		
		selectedPromotions = dealMatches.getselectedPromotionsFromTweets();
		tweets = dealMatches.getTweets();
	%>

	<body>

			<%@include file="Header.jsp"%>		
			<div >
			
				<div class="width">
					<br/>
					<h4 align='center'>Latest Deals on EasyTrip. DealMatch Guaranteed !</h4>
					<p align='center' style='color:#325b9e'>We match our deals with our competitors and provide the best deal in the market. EasyTrip Guaranteed !</p>
					<br/>
					
					<%
						if(tweets.isEmpty())
						{
					%>		
						<p align='center' style='color:#325b9e'>No Offers Available</p>
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
								<tr>
								<td style ="font-weight: bold;">EasyTrip Guaranteed DealMatch:</td>
								<td>Promo Code: <%= promoCode %></td>
								<td style ="font-weight: bold; color: #FF5722;">Deal: <label style ="font-weight: bold; color: #FF5722;"><%= percentageOff %><label> Off</td>
								<td>Valid Till: <%= validTillDate %></td>
								</tr>
								</table>
								
								</br>
								<fieldset>
								</fieldset>
								<fieldset>
								</fieldset>
								</br>
							
					<%
								i++;
							}
							
						}
					%>
					
					
						
					</br></br></br></br></br></br></br></br>
						
						
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
