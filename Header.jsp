<%--Begin Header--%>
<%@ page import="register.*,java.util.*,java.io.*"%>
<jsp:useBean id="customer" class="registerPackage.Customer" scope="session"/>
<% String customerId = customer.getFirstName();%>
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
			<h1 ><a href="#">EASY<strong>TRIP</strong></a></h1>
			<h2>Time to change the way you travel</h2>
      <% if(customerId !=null){%>
			<div align ="right">
			  <h5 style="color:#fff;">Welcome, <%= customerId %></h5>
			</div>
      <%}%>
	</div>

</header>

	<nav id="mainnav">
		<div class="width">
  			<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="Locations.jsp">Locations</a></li>
					<li><a href="Vehicles.jsp?selectedCarType=all">Vehicles</a></li>
					<li><a href="Trending.jsp?trendType=topFiveLikedVehicles">Trending</a></li>
					<li><a href="Promotions.jsp">Promotions</a></li>
					
          <% if(customerId !=null){%>
          <li><a href="Reservations.jsp">Reservations</a></li>
          <li><a href="Logout">Logout</a></li>
          <%} else{ %>
					<li><a href="Login.jsp">Login</a></li>
					<li><a href="SignUp.jsp">Signup</a></li>
          <%}%>
            </ul>
			<div class="clear"></div>
		</div>
	</nav>

<%--End Header--%>
