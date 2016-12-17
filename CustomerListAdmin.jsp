<!doctype html>
<%@page import="registerPackage.Customer"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.MySQLDataStoreUtilities"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>EasyTrip</title>


		<link rel="stylesheet" href="css/reset.css" type="text/css" />
		<link rel="stylesheet" href="css/styles-admin.css" type="text/css" />
	
	</head>

	<body>
<%
HashMap<Integer,Customer> displayCustomers= new HashMap<Integer,Customer>();
displayCustomers= MySQLDataStoreUtilities.getAllCustomerList();

%>

			<%@include file="AdminHeader.jsp"%>		
			<div >
			
				<div class="width">
					<br/>
					<table>
					<tr>
					<td><h4 align = 'center'>Search: </h4></td>
					<td><input type="TEXT" size="15" name="customerSearchQuery"></input></td>
					<td><h3 align = 'center'>Customers List</h3></td>
					<td>
						<h4 align = 'center'>Sort by: </h4>
					</td>
					<td>
						<select id="car-type" name="selectedSortItem">
			
							<option value="emailId" selected="selected">
								Email Id
							</option>
						
							<option value="firstName">
								First Name
							</option>
						
							<option value="lastName">
								Last Name
							</option>
			
						</select>
					</td>
					
					<td><input style="padding: 4px 7px; font-size: 0.9em;" type="submit" value="Submit" ></input></td>
					
					</tr>
					</table>
					
					<br/>
					
					<table>
						<tr>
						    <th style ="color: #fff; background-color:#2F2F2F">Customer Id</th>
							<th style ="color: #fff; background-color:#2F2F2F">First Name</th>
							<th style ="color: #fff; background-color:#2F2F2F">Last Name</th>
							<th style ="color: #fff; background-color:#2F2F2F">Email Id</th>
							<th style ="color: #fff; background-color:#2F2F2F">Phone No</th>
							<th style ="color: #fff; background-color:#2F2F2F">License No</th>
							<th style ="color: #fff; background-color:#2F2F2F">Password</th>
							<th style ="color: #fff; background-color:#2F2F2F">Update</th>
							<th style ="color: #fff; background-color:#2F2F2F">Delete</th>
						</tr>
						<%
						
					for(Integer key :	displayCustomers.keySet()){
						

								
						%>
						
						<form action='UpdateCustomerAdmin.jsp' method='get'>
						<tr>
						<td><label><b> <input type='hidden' name='customerId' value='<%=displayCustomers.get(key).getCustomerId()%>' /><%=displayCustomers.get(key).getCustomerId()%> </b></label></td>
							<td><label> <input type='hidden' name='fname' value='<%=displayCustomers.get(key).getFirstName()%>' /><%=displayCustomers.get(key).getFirstName()%> </label></td>
							<td><label> <input type='hidden' name='lname' value='<%=displayCustomers.get(key).getLastName()%>' /><%=displayCustomers.get(key).getLastName() %></label></td>
							<td><label>  <input type='hidden' name='email' value='<%=displayCustomers.get(key).getEmailId()%>' /><%=displayCustomers.get(key).getEmailId() %></label></td>
							<td><label>  <input type='hidden' name='phone' value='<%=displayCustomers.get(key).getPhone()%>' /><%=displayCustomers.get(key).getPhone() %></label></td>
							<td><label >  <input type='hidden' name='license' value='<%=displayCustomers.get(key).getLicenseNo()%>' /><%=displayCustomers.get(key).getLicenseNo() %></label></td>
							<td><label >  <input type='hidden' name='password' value='<%=displayCustomers.get(key).getPassword()%>' /><%=displayCustomers.get(key).getPassword() %></label></td>
							<td><input type="submit" type="hidden" name="action" value="Update" ></input></td>
							
							<td><input type="submit" type='hidden' name='action' value="Delete" ></input></td>
						</tr>
						</form>
						<%
				
						}
						%>
					
						
						
						</table>
						
						
						
						 
					 </br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
						
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
