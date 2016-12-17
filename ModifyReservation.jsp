<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />
	
	</head>

	<body>
			<%@ page import="java.util.*,java.io.*,java.util.*,searchPackage.*,vehiclePackage.*,db.*,reservationPackage.*" %>
			<%@include file="Header.jsp"%>		
			<div >
			
				<div class="width">
					
						<br/>
						<%String bId = request.getParameter("bookingId").toString();
						String custId = request.getParameter("customerId").toString();%>
						<h4 align = 'center'>Modify Reservation for Booking ID: <%=bId%></h4>
						
						<br/>
						
						<form action="/easytrip/ModifyReservation" method="post">
			
						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Driver Information</th>
						</tr>
						
						<tr>
							<td><label for="fname">Name: </label> <input type="TEXT" size="15" name="customerName"></input></td>
							<!--<td><label for="fname">Last Name: </label> <input type="TEXT" size="15" name="lastName"></input></td>-->
						</tr>
						
						<tr>
							<td><label for="fname">Email Id: </label> <input type="TEXT" size="15" name="emailId" value="<%=custId%>"></input></td>
						</tr>
						
						<tr>
							<td><label for="fname">Phone Number: </label> <input type="TEXT" size="15" name="phNumber"></input></td>
						</tr>
						
						<tr>
							<td><label for="fname">Driver's License No: </label> <input type="TEXT" size="15" name="dlNumber"></input></td>
						</tr>
						</table>
						
						<fieldset/>
			
						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Card Information</th>
						</tr>
						
						<tr>
							<td>
							<label for="fname">Credit Card Type: </label>
							<select id="cardType" name="cardType">
										
												<option value="visa" selected="selected">
													VISA
												</option>
											
												<option value="masterCard">
													MasterCard
												</option>
											
												<option value="discover">
													Discover
												</option>
											
												<option value="americanExpress">
													American Express
												</option>
											
										</select>	
							</td>
							<td><label for="fname">Credit Card Number: (Do not include spaces or dashes)</label> <input type="TEXT" size="15" name="ccnum"></input></td>
						</tr>
						
						<tr>
							<td>
							<label for="fname">Expiration Date: </label>
							<select id="ccExpirationMonth" name="ccExpirationMonth">
								
									<option value="1" selected='selected'>Jan</option>
								
									<option value="2">Feb</option>
								
									<option value="3">Mar</option>
								
									<option value="4">Apr</option>
								
									<option value="5">May</option>
								
									<option value="6">Jun</option>
								
									<option value="7">Jul</option>
								
									<option value="8">Aug</option>
								
									<option value="9">Sep</option>
								
									<option value="10">Oct</option>
								
									<option value="11">Nov</option>
								
									<option value="12">Dec</option>
								
							</select>
							<select id="ccExpirationYear" name="ccExpirationYear">
								
									<option value="2016">2016</option>
								
									<option value="2017">2017</option>
								
									<option value="2018">2018</option>
								
									<option value="2019">2019</option>
								
									<option value="2020">2020</option>
								
									<option value="2021">2021</option>
								
									<option value="2022">2022</option>
								
									<option value="2023">2023</option>
								
									<option value="2024">2024</option>
								
									<option value="2025">2025</option>
								
									<option value="2026">2026</option>
								
							</select>
							</td>
						</tr>
						
						<tr>
							<td><label for="fname">CVV: </label> <input type="password" size="15" name="cvv"</input></td>
						</tr>
						</table>
			
						<fieldset/>
						
						<p>At the time of rental, you MUST produce the same credit card you paid online and valid drivers license in your name.  Once proof of this card has been provided, EasyTrip can accept any other valid credit card in your name at the time of rent for taxes, fees, and incidentals.   We may place an authorization amount of up to USD 200.00 plus the estimated charges on a customer's card, given certain conditions that will be outlined at time of rental. These funds will not be available for your use. Debit cards are not valid form of payment for prepaid rates. </p>
				
						<fieldset/>
						
						<table>
						<tr>
							<th colspan='3' style ="color: #fff; background-color:#2F2F2F">Billing Information</th>
						</tr>
						
						<tr>
							<td><label for="fname">Address 1: </label> <input type="TEXT" size="15" name="address1"></input></td>
							<td><label for="fname">Address 2: </label> <input type="TEXT" size="15" name="address2"></input></td>
						</tr>
						
						<tr>
							<td><label for="fname">Billing City: </label> <input type="TEXT" size="15" name="city"></input></td>
						</tr>
						
						<tr>
							<td><label for="fname">Billing Country: </label> <input type="TEXT" size="15" name="country"></input></td>
						</tr>
						
						<tr>
							<td><label for="fname">Billing Zip: </label> <input type="TEXT" size="15" name="zip"></input></td>
						</tr>
						
						<tr>
							<td><label for="fname">Phone Number: </label> <input type="TEXT" size="15" name="billingPhNumber"></input></td>
						</tr>
						</table>
						
						<fieldset/>
						
						 <table style="margin: 0px auto;" cellpadding='1' cellspacing='1'>
							 <tr>
								<td align = 'right'>
									<td><input TYPE='hidden' name='bookingId' value='<%=bId%>'></input></td>
									<input type="submit" value="Modify" ></input>
								</td>
								
							 </tr>
						 </table>	
						 </form>	
			
						
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
