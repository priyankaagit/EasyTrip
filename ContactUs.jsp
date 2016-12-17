<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles.css" type="text/css" />
		<link rel="stylesheet" href="css/jquery-ui.css" type="text/css" />
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />

		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
		$(
			function()
			{
				$( "#pickupdate, #returndate" ).datepicker();
			}
		);
		</script>

	</head>

	<body>
	
			<%@include file="Header.jsp"%>
			<div>

				<div class="width">

						</br>
                       
						
							<div align = 'center'>		
								<h2></h2>
							</div>

							
							
							<div align = 'center'>
								<h3>Contact Us</h3>
								<span>EasyTrip</span>
								
								<div >
									<span>3001 S Michigan Avenue</span>
									<span>CHICAGO, </span>
									<span>IL </span>
									<span>60616</span>
								</div>
								
								<span >p:</span>
								<span > (312) 679- 7999
								</span>
								</a>
								<span >f:</span>
								<span > (312) 769- 6543</span>
								</a>
							</div>			

								</br>
																								
							<div align = 'center'>				
								<h3>Office Hours</h3>
								<ul >
									<li >
										<span >M:</span>
										<span >9:00 am - 10:00 pm</span>
									</li>
									<li >
										<span >T:</span>
										<span >9:00 am - 10:00 pm</span>
									</li>
									<li >
										<span >W:</span>
										<span >9:00 am - 10:00 pm</span>
									</li>
									<li >
										<span >Th:</span>
										<span >9:00 am - 10:00 pm</span>
									</li>
									<li >
										<span >F:</span>
										<span >9:00 am - 10:00 pm</span>
									</li>
									<li >
										<span >S:</span>
										<span >10:00 am - 3:00 pm</span>
									</li>
									<li >
										<span >Su:</span>
										<span>10:00 am - 3:00 pm</span>
									</li>
								</ul>
							</div>
							
							</br></br>

						<aside id="sidebar" class="column-left">		
													
						</aside>
						
          
				<div class="clear"></div>

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
