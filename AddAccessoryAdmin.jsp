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
					<h4 align = 'center'>Add a new Accessory</h4>
					<br/>

						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">

							<form id="myForm" action="AddAccessoryAdminServlet" method="post">


							<p><label style ="color: #fff; font-weight: bold;" for="fname">Accessory name: </label> <input type="TEXT" size="15" id="accessoryName"  name="accessoryName"></input></p>
							<font color="red"><p id="accessoryNameMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Accessory Company: </label> <input type="TEXT" size="15" id="accessoryCompany"  name="accessoryCompany"></input></p>
							<font color="red"><p id="accessoryNameMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Total Stock: </label> <input type="TEXT" size="15" id="accessoryStock"  name="accessoryStock"></input></p>
							<font color="red"><p id="accessoryStockMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Available Stock: </label> <input type="text" size="15" id="accessoryAvailStock" name="accessoryAvailStock"></input></p>
					    	<font color="red"><p id="accessoryAvailStockMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Accessory Price: </label> <input type="TEXT" size="15" id="accessoryPrice" name="accessoryPrice"></input></p>
					        <font color="red"><p id="accessoryPriceMessage"></p></font>
							<p><input type="button" onclick="myFunction()" value="Add Accessory" ></input></p>

							<script>

								function myFunction() {

									var text, accessoryName, accessoryStock,accessoryAvailStock,accessoryPrice;
									var numbers = /^[0-9]+$/;
									// Get the value of the input field with id="numb"
									accessoryName = document
											.getElementById("accessoryName").value;
									accessoryStock = document
											.getElementById("accessoryStock").value;
									accessoryAvailStock = document
											.getElementById("accessoryAvailStock").value;

									accessoryPrice = document
									.getElementById("accessoryPrice").value;






									nullcheck = 0;

									//If all mandatory fields are filled

										 if(nullcheck == 0)
											 {
										 if(accessoryName.length==0)
											 {
												text = "Field is mandatory*"
											 document
												.getElementById("accessoryNameMessage").innerHTML = text;
										nullcheck++;
											 }
										 if(accessoryStock.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("accessoryStockMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(accessoryAvailStock.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("accessoryAvailStockMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(accessoryPrice.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("accessoryPriceMessage").innerHTML = text;
										nullcheck++;
										 }

										 if(isNaN(accessoryPrice))
											 {
											 text = "Invalid input*, Accept numeric value"
												 document
													.getElementById("accessoryPriceMessage").innerHTML = text;
											nullcheck++;
											 }
										 if(isNaN(accessoryAvailStock))
										 {
										 text = "Invalid input*, Accept numeric value"
											 document
												.getElementById("accessoryAvailStockMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(isNaN(accessoryStock))
										 {
										 text = "Invalid input*, Accept numeric value"
											 document
												.getElementById("accessoryStockMessage").innerHTML = text;
										nullcheck++;
										 }
										if(accessoryAvailStock>accessoryStock)
											{
											 text = "Invalid input*, Available stock should be less than total"
												 document
													.getElementById("accessoryStockMessage").innerHTML = text;
											nullcheck++;
											}

										if (nullcheck == 0) {

											document.getElementById("myForm")
													.submit();
										}
									}
								}

							</script>

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
