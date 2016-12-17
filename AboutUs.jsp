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
			<div >

				<div class="width">
						</br>
						
                        <h3 align = 'center'>About US</h3>
						</br>
						<p>With EasyTrip Car Rental, the less you spend the more you get. With every click of button you get closer to the luxurious drive.
						   Our guiding principles, and humble beginning, revolve around personal honesty and integrity.</p>
						<p>We provide range of cars to choose from, with additional insurance benefits and accessories</p>
						</br>
						
						<h3 align='center'>Our Team</h3>
						<p align='center'> Ankit Malviya</p>
						<p align='center'> Bijay Sharma</p>
						<p align='center'> Mohammed Shethwala</p>
						<p align='center'> Priyanka</p>
						<p align='center'> Shailesh Maurya</p>

						</br></br></br></br>
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
