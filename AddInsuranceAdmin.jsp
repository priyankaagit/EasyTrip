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
					<h4 align = 'center'>Add a new Insurance</h4>
					<br/>
					
						 <div align="center" style = "border-radius: 5px; background-color:#666;width: 400px;padding: 10px; margin-right:auto; margin-left:auto;">
					
							<form id="myForm" form action="AddInsuranceAdminServlet" method="post">
							
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Insurance Name: </label> <input type="TEXT" size="15" id="insuranceName" name="insuranceName"></input></p>
							<font color="red"><p id="insuranceNameMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Insurance Type: </label> <input type="TEXT" size="15" id="insuranceType" name="insuranceType"></input></p>
							<font color="red"><p id="insuranceTypeMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Cost Covered: </label> <input type="text" size="15" id="insuranceCostCovered" name="insuranceCostCovered"></input></p>
							<font color="red"><p id="insuranceCostCoveredMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Insurance Company: </label> <input type="text" id="insuranceCompany" size="15" name="insuranceCompany"></input></p>
							<font color="red"><p id="insuranceCompanyMessage"></p></font>
							<p><label style ="color: #fff; font-weight: bold;" for="fname">Insurance Price: </label> <input type="text" size="15"  id="insurancePrice"name="insurancePrice"></input></p>
							<font color="red"><p id="insurancePriceMessage"></p></font>
					<p><input type="button" onclick="myFunction()" value="Add Insurance" ></input></p>
						
						<script>
							
								function myFunction() {
									
									var text, insuranceName, insuranceType, insuranceCostCovered,insuranceCompany,insurancePrice;
									var numbers = /^[0-9]+$/;
									// Get the value of the input field with id="numb"
									insuranceName = document
											.getElementById("insuranceName").value;
									insuranceType = document
											.getElementById("insuranceType").value;
									insuranceCostCovered = document
											.getElementById("insuranceCostCovered").value;
									
									insuranceCompany = document
									.getElementById("insuranceCompany").value;
									
									insurancePrice = document
									.getElementById("insurancePrice").value;
									
									
								
									
									var nullcheck = 0;
																		//If all mandatory fields are filled
									
										 if(nullcheck == 0)
											 {
											 
											 if(isNaN(insurancePrice))
												{
												text = "FIeld should be numeric*"
													 document
														.getElementById("insurancePrice").innerHTML = text;
												 document
													
												nullcheck++;
												}
											 if(isNaN(insuranceCostCovered))
												{
												text = "FIeld should be numeric*"
											
												 document
													.getElementById("insuranceCostCovered").innerHTML = text;
												nullcheck++;
												}
										 if(insuranceName.length==0)
											 {
												text = "Field is mandatory*"
											 document
												.getElementById("insuranceNameMessage").innerHTML = text;
										nullcheck++;
											 }
										 if(insuranceType.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("insuranceTypeMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(insuranceCostCovered.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("insuranceCostCoveredMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(insuranceCompany.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("insuranceCompanyMessage").innerHTML = text;
										nullcheck++;
										 }
										 if(insurancePrice.length==0)
										 {
												text = "Field is mandatory*"
											 document
												.getElementById("insurancePriceMessage").innerHTML = text;
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
