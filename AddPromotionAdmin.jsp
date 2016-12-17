<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles-admin.css" type="text/css" />

	</head>

	<body>

			<%@include file="AdminHeader.jsp"%>
			<div >

				<div class="width">
					<br/>
					<h4 align = 'center'>Add a new Promotion</h4>
					<br/>

						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">

							<form action="AddPromotionAdminServlet?action=add" method="post">

							<p><label style ="color: #fff; font-weight: bold;" for="fname">Promo Code: </label> <input type="TEXT" size="15" id="promoCode"  name="promoCode"></input></p>
							<font color="red"><p id="accessoryNameMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Discount: </label> <input type="TEXT" size="15" id="percentageOff"  name="percentageOff"></input></p>
							<font color="red"><p id="accessoryStockMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Valid Till Date (YYYY-MM-DD): </label> <input type="text" size="15" id="validTillDate" name="validTillDate"></input></p>
					    	<font color="red"><p id="accessoryAvailStockMessage"></p></font>
							
							<p><input type="submit" value="Add Promotion" ></input></p>

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

	   <%@include file="FooterAdmin.jsp"%>

	</body>

</html>
