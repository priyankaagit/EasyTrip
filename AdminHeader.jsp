<%--Begin Header--%>

<head>
<style>
.dropbtn {

    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: black;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
    color: white;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: black}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
</style>
</head>

<header>

	<div class="width">
			<h1><a href="#">EASY<strong>TRIP</strong></a></h1>
			<h2>Time to change the way you travel</h2>
			<h3 style="color:#E9A190;">Admin Portal</h3>
	</div>

</header>

	<nav id="mainnav">
		<div class="width">
  			<ul>
					<li><a href="AdminPortal.jsp">Home</a></li>

					<li>
					<div class="dropdown">
					  <a  class="dropbtn" >Customers</a>
					  <div class="dropdown-content">
						<a href="CustomerListAdmin.jsp">Customer List</a>
						<a href="AddCustomerAdmin.jsp">Add Customer</a>
					  </div>
					</div>
					</li>

					<li>
					<div class="dropdown">
					  <a  class="dropbtn" >Vehicles</a>
					  <div class="dropdown-content">
						<a href="VehicleListAdmin.jsp">Vehicle List</a>
						<a href="AddVehicleAdmin.jsp">Add Vehicle</a>
						<a href="AddVehicleTypeAdmin.jsp">Add Info</a>
						<a href="VehicleTypeListAdmin.jsp">Info List</a>
					  </div>
					</div>
					</li>

					<li>
					<div class="dropdown">
					  <a class="dropbtn" >Insurance</a>
					  <div class="dropdown-content">
						<a href="InsuranceListAdmin.jsp">Insurance List </a>
						<a href="AddInsuranceAdmin.jsp">Add Insurance</a>
					  </div>
					</div>
					</li>

					<li>
					<div class="dropdown">
					  <a  class="dropbtn" >Accessories</a>
					  <div class="dropdown-content">
						<a href="AccessoriesListAdmin.jsp">Accessory List</a>
						<a href="AddAccessoryAdmin.jsp">Add Accessory</a>
					  </div>
					</div>
					</li>

					<li>
					<div class="dropdown">
					  <a class="dropbtn" >Location</a>
					  <div class="dropdown-content">
						<a href="LocationsListAdmin.jsp">Location List</a>
						<a href="AddLocationAdmin.jsp">Add Location</a>
					  </div>
					</div>
					</li>

					<li>
					<div class="dropdown">
					  <a  class="dropbtn" >Reservations</a>
					  <div class="dropdown-content">
						<a href="ReservationsListAdmin.jsp">Reservations</a>
						
					  </div>
					</div>
					</li>
					
					<li>
					<div class="dropdown">
					  <a  class="dropbtn" >Promotions</a>
					  <div class="dropdown-content">
						<a href="PromotionsListAdmin.jsp">Promotions List</a>
						<a href="AddPromotionAdmin.jsp">Add Promotion</a>
						
					  </div>
					</div>
					</li>

					<li><a href="index.jsp">Logout</a></li>
            </ul>
			<div class="clear"></div>
		</div>
	</nav>

<%--End Header--%>
