<!doctype html>
<%@page import="vehiclePackage.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.MySQLDataStoreUtilities"%>
<%@page import="utilityClasses.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>

		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles-admin.css" type="text/css" />

	</head>

	<body>
	<%
		HashMap<String,Promotion> promotions= new HashMap<String,Promotion>();
		promotions= MySQLDataStoreUtilitiesMohammed.getPromotionsListFromMySQL();
%>

			<%@include file="AdminHeader.jsp"%>
			<div >

				<div class="width">
					<br/>
					<table>
					<tr>
					<td><h4 align = 'center'>Search: </h4></td>
					<td><input type="TEXT" size="15" name="customerSearchQuery"></input></td>
					<td><h3 align = 'center'>Promotions List</h3></td>
					<td>
						<h4 align = 'center'>Sort by: </h4>
					</td>
					<td>
						<select id="car-type" name="selectedCarType">

							<option value="emailId" selected="selected">
								Promo Code
							</option>

							<option value="emailId">
								Discount
							</option>

							
						</select>
					</td>

					<td><input style="padding: 4px 7px; font-size: 0.9em;" type="submit" value="Submit" ></input></td>

					</tr>
					</table>

					<br/>

					<table>
						<tr>
							<th style ="color: #fff; background-color:#2F2F2F">Promo Code</th>
							<th style ="color: #fff; background-color:#2F2F2F">Discount</th>
							<th style ="color: #fff; background-color:#2F2F2F">Valid Till</th>
							<th style ="color: #fff; background-color:#2F2F2F">Update</th>
							<th style ="color: #fff; background-color:#2F2F2F">Delete</th>
						</tr>

						<%

					for(String key :promotions.keySet()){



						%>

						<form action='UpdatePromotionAdmin.jsp' method='get'>
						<tr>
							
							<td><label> <input type='hidden' name='promoCode' value=<%=promotions.get(key).getPromoCode() %> /><%=promotions.get(key).getPromoCode()%></label></td>
							<td><label> <input type='hidden' name='discount' value=<%=promotions.get(key).getPercentageOff() %> /><%=promotions.get(key).getPercentageOff() %></label></td>
							<td><label> <input type='hidden' name='validTill' value=<%=promotions.get(key).getValidTillDate() %> /><%=promotions.get(key).getValidTillDate()%></label></td>

							<td><input type="submit"  type="hidden" name="action"  value="Update" ></input></td>
						</form>
						<form action='DeletePromotionAdminServlet' method='post'>
							
							<td>
								<input type='hidden' name='promoCode' value=<%=promotions.get(key).getPromoCode() %> />
								<input type="submit"  type="hidden" name="action"  value="Delete" ></input>
							</td>
							</tr>
						</form>

						<%

						}
						%>



						</table>




					 </br></br></br></br></br></br></br></br></br>

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
