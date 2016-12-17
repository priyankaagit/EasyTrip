/*
* This class contains sql utility methods

*/
package db;
import java.sql.*;
import java.util.*;
import searchPackage.*;
import vehiclePackage.*;
import reservationPackage.*;
import java.text.DateFormat;
import registerPackage.Customer;
import java.text.SimpleDateFormat;


public class MySQLDataStoreUtilities{

	static Connection conn = null;

static	Connection getConnection(){
		try{
			if(conn == null){
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/easytrip","root","root");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
   return conn;
	}

	/*
	* Belwo section has method to check vehicles available.
	*
	*/
	
	public static HashMap<Integer, Location> searchLocation(String searchLocation) {
		HashMap<Integer, Location> location = new HashMap<Integer, Location>();
		try {
		  	 getConnection();
				 String selectLocationQuery = "SELECT * from location where location_pin= ? or location_city = ?;";
         PreparedStatement pst=  conn.prepareStatement(selectLocationQuery);
				 pst.setString(1,searchLocation);
				 pst.setString(2,searchLocation);
				 ResultSet rs = pst.executeQuery();
		     while (rs.next())
		      	{
						Integer locationId = rs.getInt("location_id");
						String locationName = rs.getString("location_name");
						String locationPin = rs.getString("location_pin");
						String locationCity = rs.getString("location_city");
						String locationState = rs.getString("location_state");
						String locationCountry = 	rs.getString("location_country");
						String locationAddress = rs.getString("location_address");
						String locationHours = rs.getString("location_hours");
						String locationPhone = rs.getString("location_phone");

		        		Location loc = new Location(locationId, locationName,locationPin, locationCity, locationState,
								                            locationCountry, locationAddress,locationHours,locationPhone);

			        	location.put(locationId, loc);

			}
		} catch (Exception e2) {
			System.out.println(e2);
		}

		return location;
	}


	public static int BookingCount(){
 		Connection	conn = null;
 			try{
 				conn = getConnection();
 				String queryString = "SELECT MAX(booking_id) FROM booking_detail";
 			  PreparedStatement pst = conn.prepareStatement(queryString);
 			  ResultSet rs = pst.executeQuery();
 			  while(rs.next()){
 				 return rs.getInt(1);
 			  }
 		 }catch(Exception e){
 			 e.printStackTrace();
 		 }
 		 return 0;
 	 }


public static HashMap<String,Vehicle> getVehicleAvailable(Search search){
HashMap<String,Vehicle> getVehicleAtLoc = new HashMap<String,Vehicle>();
getVehicleAtLoc = getVehicleAvailableAtLocation(search);
//System.out.println("getVehicleAtLoc: "+getVehicleAtLoc);


ArrayList<String> vinsAvailable = new ArrayList<String>();
String pickUpDate = mm_dd_yyyy_To_yyyy_mm_dd(search.getPickUpDate());
String returnDate = mm_dd_yyyy_To_yyyy_mm_dd(search.getReturnDate());
String pickUpTime = search.getPickUpTime();
String returnTime = search.getReturnTime();
try{
    //Creating a formatter
		DateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd,HH:mm:ss");
    //Converting String Date + time to Util.dateTime
		java.util.Date pickUpDateTime = formatter1.parse(pickUpDate+","+pickUpTime);
		java.util.Date returnDateTime= formatter1.parse( returnDate+","+returnTime);
    // util.Date to sql.Date conversion
		java.sql.Timestamp pickUpDateTimeStamp = new java.sql.Timestamp(pickUpDateTime.getTime());
		java.sql.Timestamp returnTimeStamp = new java.sql.Timestamp(returnDateTime.getTime());
		conn = getConnection();
		String queryString = "SELECT * FROM booking_time where (start_time < ? and end_time  > ?)  or (start_time < ? and end_time  > ?)";
		PreparedStatement pst = conn.prepareStatement(queryString);
  	pst.setTimestamp(1,pickUpDateTimeStamp);
	  pst.setTimestamp(2,pickUpDateTimeStamp);
		pst.setTimestamp(3,returnTimeStamp);
		pst.setTimestamp(4,returnTimeStamp);
		ResultSet result = pst.executeQuery();
		while(result.next()){
			String vehicle_vin = result.getString("vehicle_vin");
			String vehicle_id = result.getString("vehicle_id");
      getVehicleAtLoc.remove(vehicle_vin);
   		}
		}catch(Exception e){
			e.printStackTrace();
		}
return getVehicleAtLoc;
}

public static HashMap<String,Vehicle> getVehicleAvailableAtLocation(Search search){
	Connection conn = getConnection();
	String vehicleType = search.getVehicleType();
	String pickUpLocation = search.getPickUpLocation();
	HashMap<String,Vehicle> vehicleAvailableAtLocation = new HashMap<String,Vehicle>();


	try{
	    conn = getConnection();
		
			String queryString = "SELECT * FROM vehicles where vehicle_type = ? AND location_id = ?";
		
			if(vehicleType.equals("all"))
			{
				queryString = "SELECT * FROM vehicles where location_id = ?";
				
				PreparedStatement pst = conn.prepareStatement(queryString);
				
				pst.setString(1,pickUpLocation);
				ResultSet result = pst.executeQuery();

				while(result.next()){
					String vehicle_vin = result.getString("vehicle_vin");
					String vehicle_id = result.getString("vehicle_id");
				//	String vehicleType = result.getString("vehicle_type");
					String vehicleMake = result.getString("vehicle_make");
					String vehicleModel = result.getString("vehicle_model");
					String locationId = pickUpLocation;
					Vehicle vehicle = new Vehicle(vehicle_id,vehicle_vin,vehicleModel,vehicleMake,locationId,vehicleType);
					vehicleAvailableAtLocation.put(vehicle_vin,vehicle);
				}
			}
			else
			{
				//String queryString = "SELECT * FROM vehicles where vehicle_type = ? AND location_id = ?";
				PreparedStatement pst = conn.prepareStatement(queryString);
				pst.setString(1,vehicleType);
				pst.setString(2,pickUpLocation);
				ResultSet result = pst.executeQuery();

				while(result.next()){
					String vehicle_vin = result.getString("vehicle_vin");
					String vehicle_id = result.getString("vehicle_id");
				//	String vehicleType = result.getString("vehicle_type");
					String vehicleMake = result.getString("vehicle_make");
					String vehicleModel = result.getString("vehicle_model");
					String locationId = pickUpLocation;
					Vehicle vehicle = new Vehicle(vehicle_id,vehicle_vin,vehicleModel,vehicleMake,locationId,vehicleType);
					vehicleAvailableAtLocation.put(vehicle_vin,vehicle);
				}
			}
			
			

		}catch(Exception e){
			e.printStackTrace();
		}




     return vehicleAvailableAtLocation;
  }
  
  //For fetching location_id from pickuplocation
  public static String getLocationIdForPickUpLocation(String pickUpLocation){
	Connection conn = getConnection();
	String getLocationIdForPickUpLocation="";
	
	try{
	    conn = getConnection();
		
			String queryString = "SELECT * FROM location where location_name = ?";
			
			PreparedStatement pst = conn.prepareStatement(queryString);
			pst.setString(1,pickUpLocation);
			ResultSet result = pst.executeQuery();

			while(result.next()){
				
				String locationId = result.getString("location_id");
				getLocationIdForPickUpLocation = locationId;
				
			}
	
		}catch(Exception e){
			e.printStackTrace();
		}

     return getLocationIdForPickUpLocation;
  }

  
  //For fetching pickuplocation from location_id
  public static String getLocationNameForLocationId(String pickUpLocation){
	Connection conn = getConnection();
	String getLocationIdForPickUpLocation="";
	
	Integer locationIdToSearch = Integer.parseInt(pickUpLocation);
	
	try{
	    conn = getConnection();
		
			String queryString = "SELECT * FROM location where location_id = ?";
			
			PreparedStatement pst = conn.prepareStatement(queryString);
			pst.setInt(1,locationIdToSearch);
			ResultSet result = pst.executeQuery();

			while(result.next()){
				
				String locationId = result.getString("location_name");
				getLocationIdForPickUpLocation = locationId;
				System.out.println("getLocationNameForLocationId"+getLocationIdForPickUpLocation);
				
			}
	
		}catch(Exception e){
			e.printStackTrace();
		}

     return getLocationIdForPickUpLocation;
  }

	public static HashMap<Integer,Insurance> getInsuranceDetail(){
		Connection conn = getConnection();
		HashMap<Integer,Insurance> insuranceDetail = new HashMap<Integer,Insurance>();


		try{
		    conn = getConnection();
				String queryString = "SELECT * FROM insurance";
				PreparedStatement pst = conn.prepareStatement(queryString);
			  ResultSet result = pst.executeQuery();

				while(result.next()){
					Integer insuranceNumber = result.getInt("policy_number");
					String insuranceName = result.getString("insurance_name");
				//	String vehicleType = result.getString("vehicle_type");
					String insuranceType = result.getString("insurance_type");
					double costCovered = result.getDouble("cost_covered");
					String insuranceCompany = result.getString("insurance_company");
					double insurancePrice = result.getDouble("insurance_price");

					Insurance insurance = new Insurance(insuranceNumber,insuranceName,insuranceType,costCovered,insuranceCompany,insurancePrice);
					insuranceDetail.put(insuranceNumber,insurance);
				}

				}catch(Exception e){
					e.printStackTrace();
				}
	     return insuranceDetail;
	  }



			public static HashMap<Integer,Accessory> getAccessoryDetail(){
				Connection conn = getConnection();
				HashMap<Integer,Accessory> accessories = new HashMap<Integer,Accessory>();


				try{
				    conn = getConnection();
						String queryString = "SELECT * FROM accessory";
						PreparedStatement pst = conn.prepareStatement(queryString);
					  ResultSet result = pst.executeQuery();

						while(result.next()){
							Integer accId = result.getInt("acc_id");
							String accName = result.getString("acc_name");
							String accCompany = result.getString("acc_Company");
							Integer totalNumber = result.getInt("total_Number");
							Integer availableNumber = result.getInt("available_Number");
							double hourPrice = result.getDouble("hour_price");


							Accessory accessory = new Accessory(accId,accName,accCompany,totalNumber,availableNumber,hourPrice);
							accessories.put(accId,accessory);
						}

						}catch(Exception e){
							e.printStackTrace();
						}
			     return accessories;
			  }



				public static void insertAccessory(Integer bookingId,Integer accId,Double price){
					Connection conn = getConnection();
					int count = 1;

					try{
					    conn = getConnection();
							String queryString = "insert into booking_accessories(booking_id,accessory_id,accessory_count,price) VALUES(?,?,?,?)";
							PreparedStatement pst = conn.prepareStatement(queryString);
							pst.setInt(1,bookingId);
							pst.setInt(2,accId);
							pst.setInt(3,count);
							pst.setDouble(4,price);
						  pst.execute();

							}catch(Exception e){
								e.printStackTrace();
							}

				  }


	public static HashMap<String,VehicleInfo> getVehicleInfo(){
		Connection conn = getConnection();

		HashMap<String,VehicleInfo> vehicleAvailable = new HashMap<String,VehicleInfo>();


		try{
		    conn = getConnection();
				String queryString = "SELECT * FROM vehicle_info";
				PreparedStatement pst = conn.prepareStatement(queryString);
				ResultSet result = pst.executeQuery();
				//pst.close();
				while(result.next()){

				String vehicleId = result.getString("vehicle_id");
				double vehiclePrice = result.getDouble("vehicle_price");
			  String vehicleMilage = result.getString("vehicle_milage");
				String vehiclePassenger = result.getString("vehicle_passenger");
				String vehicleSLuggage = result.getString("vehicle_sluggage");
				String vehicleLLuggage = result.getString("vehicle_lluggage");
			  String vehicleTransmission = result.getString("vehicle_transmission");
				String vehicleImage = result.getString("vehicle_image");
					VehicleInfo vehicleInfo = new VehicleInfo(vehicleId,vehiclePrice,vehicleMilage,vehiclePassenger,vehicleSLuggage,vehicleLLuggage,vehicleTransmission,vehicleImage);
					vehicleAvailable.put(vehicleId,vehicleInfo);
				}

				}catch(Exception e){
					e.printStackTrace();
				}
	     return vehicleAvailable;
	  }




	/*
	* Date mm-dd-yyyy to yyyy-mm-dd
	*
	*/

	public static String mm_dd_yyyy_To_yyyy_mm_dd(String sourceString){

         String targetDate = new String();
				 try{
					java.util.Date tempDate = new SimpleDateFormat("mm-dd-yyyy").parse(sourceString);
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
					targetDate = formatter.format(tempDate);
				}catch(Exception e){
				}
   return targetDate;
	}

public static	java.sql.Timestamp getTimeStamp(String date,String time){
java.sql.Timestamp javaSQLTimeStamp = null;
String pickUpDate = mm_dd_yyyy_To_yyyy_mm_dd(date);
	try{
		DateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd,hh:mm:ss");
		java.util.Date javaUtilTimeStamp = formatter2.parse(pickUpDate+","+time);
	javaSQLTimeStamp	 = new java.sql.Timestamp(javaUtilTimeStamp.getTime());
	} catch(Exception e){}
	  return javaSQLTimeStamp;
	}

/*
	public static	java.sql.Timestamp getTimeStampInput(String dateTime){
	java.sql.Timestamp javaSQLTimeStamp = null;
		try{
			DateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd,HH:mm:ss");
			java.util.Date javaUtilTimeStamp = formatter2.parse(date+","+time);
		javaSQLTimeStamp	 = new java.sql.Timestamp(javaUtilTimeStamp.getTime());
		} catch(Exception e){}
		  return javaSQLTimeStamp;
		}

*/

public static Integer getHourDiff(java.sql.Timestamp start,java.sql.Timestamp end){

	Integer diffInDays = (int) ((end.getTime() - start.getTime()) / (1000 * 60 * 60 * 24));
	System.out.println("day difference is "+diffInDays);
	return diffInDays;
}

/**
*
*Booking Detail
*/


public static void insertBookingDetail(BookingDetail bookingDetail){
	  Connection	conn = null;
		Integer bookingId = bookingDetail.getBookingId();
		String customerName = bookingDetail.getCustomerName();
		Integer customerId = bookingDetail.getCustomerId();
		Integer customerAge = bookingDetail.getCustomerAge();
		String customerPhone = bookingDetail.getCustomerPhone();
		String locationId = bookingDetail.getLocationId();
		Integer insuranceId = bookingDetail.getInsuranceId();
		Double rentalPrice = bookingDetail.getTotalPrice();
		String drivingLicense = bookingDetail.getDrivingLicense();
		String bookingTime = bookingDetail.getBookingTime();
		String bookingDate = bookingDetail.getBookingDate();




		try{
		conn = getConnection();
		String queryString = "INSERT INTO  booking_detail(booking_id,customer_name,customer_id,customer_age,customer_phone,location_id,insurance_id,rental_price,driver_license,booking_time,booking_date)"
		+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pst = conn.prepareStatement(queryString);

		pst.setInt(1,bookingId);
		pst.setString(2,customerName);
		pst.setInt(3,customerId);
		pst.setInt(4,customerAge);
		pst.setString(5,customerPhone);
		pst.setString(6,locationId);
		pst.setInt(7,insuranceId);
		pst.setDouble(8,rentalPrice);
		pst.setString(9,drivingLicense);
		pst.setString(10,bookingTime);
		pst.setString(11,bookingDate);


		pst.execute();


		}catch(Exception e){

			e.printStackTrace();
		}
	}







/*
* Booking time
*/

public static void insertBookingTime(BookingTime bookingTime){
	  Connection	conn = null;
		Integer bookingId = bookingTime.getBookingId();
		String vehicleVin = bookingTime.getVehicleVin();
		String vehicleId = bookingTime.getVehicleId();
		String vehicleType = bookingTime.getVehicleType();
		java.sql.Timestamp startTime = bookingTime.getStartTime();
		java.sql.Timestamp endTime = bookingTime.getEndTime();
	//	System.out.println("java.sql.Timestamp startTime"+startTime);
	//	Integer dayDiff = bookingTime.getDayDiff();



		try{
		conn = getConnection();
		String queryString = "INSERT INTO booking_time(booking_id,vehicle_vin,vehicle_id,vehicle_type,start_time,end_time)"
		+ "VALUES(?,?,?,?,?,?);";
		PreparedStatement pst = conn.prepareStatement(queryString);
		pst.setInt(1,bookingId);
		pst.setString(2,vehicleVin);
		pst.setString(3,vehicleId);
		pst.setString(4,vehicleType);
		pst.setTimestamp(5,startTime);
		pst.setTimestamp(6,endTime);

		pst.execute();


		}catch(Exception e){

			e.printStackTrace();
		}
	}



/*
* Payment infromation
*/

public static void insertPaymentTransaction(Account account){
	  Connection	conn = null;
		Integer bookingId = account.getBookingId();
		String cardName = account.getCardName();
		String cardNum = account.getCardNum();
		String cardType = account.getCardType();
		String expirationMonth = account.getExpirationMonth();
		String expirationYear = account.getExpirationYear();
		String cvv = account.getCvv();
		String address1 = account.getAddress1();
		String address2 = account.getAddress2();
		String city = account.getCity();
		String country = account.getCountry();
		String zip = account.getZip();
		String phoneNumber = account.getPhoneNumber();


		try{
		conn = getConnection();
		String queryString = "INSERT INTO booking_transaction(booking_id,name_on_card,card_number,card_type,card_expiry_month,card_expiry_year,card_cvv,address1,address2,zip,city,country,phone_number)"
		+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?);";
		PreparedStatement pst = conn.prepareStatement(queryString);
		pst.setInt(1,bookingId);
		pst.setString(2,cardName);
		pst.setString(3,cardNum);
		pst.setString(4,cardType);
		pst.setString(5,expirationMonth);
		pst.setString(6,expirationYear);
		pst.setString(7,cvv);
		pst.setString(8,address1);
		pst.setString(9,address2);
		pst.setString(10,zip);
		pst.setString(11,city);
		pst.setString(12,country);
		pst.setString(13,phoneNumber);
		pst.execute();


		}catch(Exception e){

			e.printStackTrace();
		}
	}

	/*
	* Belwo section has method for Admin Portal
	*
	*/

	// *************************************************************************************************************
		public static void enterCustomerInformation(Customer addCustomerAdminBeanObject) {
			try {
      conn = getConnection();
			PreparedStatement		ps = conn.prepareStatement("insert into customer(first_name,last_name,password,email_id,phone,license_no,customer_type)"
								+ "VALUES (?,?,?,?,?,?,?);");

				ps.setString(1, addCustomerAdminBeanObject.getFirstName());
				ps.setString(2, addCustomerAdminBeanObject.getLastName());
				ps.setString(3, addCustomerAdminBeanObject.getPassword());
				ps.setString(4, addCustomerAdminBeanObject.getEmailId());
				ps.setString(5, addCustomerAdminBeanObject.getPhone());
				ps.setString(6, addCustomerAdminBeanObject.getLicenseNo());
				ps.setString(7, addCustomerAdminBeanObject.getCustomerType());

				Boolean i = ps.execute();

				if (i) {
					System.out.println("LOG : Customer is successfully registered!");
				}

			} catch (Exception e2)

			{
				System.out.println("LOG: Something is wrong in database. Problem: " + e2);
			}

		}

	// *********************************************************************************************************************
		public static void updateCustomerInformation(Customer addCustomerAdminBeanObject) {
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("UPDATE customer SET first_name='"
						+ addCustomerAdminBeanObject.getFirstName() + "',last_name='"
						+ addCustomerAdminBeanObject.getLastName() + "',password='"
						+ addCustomerAdminBeanObject.getPassword() + "',email_id='"
						+ addCustomerAdminBeanObject.getEmailId() + "',phone='" + addCustomerAdminBeanObject.getPhone()
						+ "',license_no='" + addCustomerAdminBeanObject.getLicenseNo() + "' WHERE customer_id='"
						+ addCustomerAdminBeanObject.getCustomerId() + "'");

				ps.execute();

				Boolean i = ps.execute();

				if (i) {
					System.out.println("LOG : Customer is successfully registered!");
				}

			} catch (Exception e2)

			{
				System.out.println("LOG: Something is wrong in customer database. Problem: " + e2);
			}

		}

		// *********************************************************************************************************************

		public static HashMap<Integer, Customer> getAllCustomerList() {
			HashMap<Integer, Customer> hashmap = new HashMap<Integer, Customer>();
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("SELECT * FROM customer");
				ResultSet rs = ps.executeQuery();

				while (rs.next())

				{

					Customer addCustomerAdminBeanObject = new Customer(rs.getInt("customer_id"), rs.getString("first_name"),
							rs.getString("last_name"), rs.getString("email_id"), rs.getString("password"),
							rs.getString("phone"), rs.getString("license_no"),rs.getString("customer_type"));
					hashmap.put(rs.getInt("customer_id"), addCustomerAdminBeanObject);

				}
			} catch (Exception e2) {
				System.out.println(e2);
			}

			return hashmap;
		}

		// *********************************************************************************************************************

		public static void deleteCustomer(int customerId) {

			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("Delete FROM customer where customer_id=" + customerId);
				ps.execute();

			} catch (Exception e2) {
				System.out.println(e2);
			}

		}



		// *********************************************************************************************************************

		public static void enterVehicleInformation(VehicleInfo addVehicleInfoAdminObject) {
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement(
						"insert into vehicle_info(vehicle_id,vehicle_price,vehicle_milage,vehicle_passenger,vehicle_sluggage,vehicle_lluggage,vehicle_transmission,vehicle_image)"
								+ "VALUES (?,?,?,?,?,?,?,?);");

				ps.setString(1, addVehicleInfoAdminObject.getVehicleId());
				ps.setDouble(2, addVehicleInfoAdminObject.getVehiclePrice());
				ps.setString(3, addVehicleInfoAdminObject.getVehicleMilage());
				ps.setString(4, addVehicleInfoAdminObject.getVehiclePassenger());
				ps.setString(5, addVehicleInfoAdminObject.getVehicleSLuggage());
				ps.setString(6, addVehicleInfoAdminObject.getVehicleLLuggage());
				ps.setString(7, addVehicleInfoAdminObject.getVehicleTransmission());
				ps.setString(8, addVehicleInfoAdminObject.getVehicleImage());


				Boolean i = ps.execute();

				if (i) {
					System.out.println("LOG : Vehicle is successfully registered!");
				}

			} catch (Exception e2)

			{
				System.out.println("LOG: Something is wrong in database. Problem: " + e2);
			}

		}

		public static void updateVehicleInformation(VehicleInfo updateVehicleAdminBeanObject) {
			try {

			int vehiclePassenger = Integer.parseInt(updateVehicleAdminBeanObject.getVehiclePassenger());
			int vehicleSLuggage = Integer.parseInt(updateVehicleAdminBeanObject.getVehicleSLuggage());
			int vehicleLLuggage = Integer.parseInt(updateVehicleAdminBeanObject.getVehicleLLuggage());
			
				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement(
						"UPDATE vehicle_info SET vehicle_price='" + updateVehicleAdminBeanObject.getVehiclePrice()
								+ "',vehicle_milage='" + updateVehicleAdminBeanObject.getVehicleMilage()
								+ "',vehicle_passenger='" + vehiclePassenger
								+ "',vehicle_sluggage='" + vehicleSLuggage
								+ "',vehicle_lluggage='" + vehicleLLuggage
								+ "',vehicle_transmission='" + updateVehicleAdminBeanObject.getVehicleTransmission()
								+ "' WHERE vehicle_id='" + updateVehicleAdminBeanObject.getVehicleId() + "'");

				ps.execute();

				Boolean i = ps.execute();

				if (i) {
					System.out.println("LOG : VehicleInfo is successfully registered!");
				}

			} catch (Exception e2)

			{
				System.out.println("LOG: Something is wrong in VehicleInfo database. Problem: " + e2);
			}

		}

		// *********************************************************************************************************************

		public static void deleteVehicleInfo(String vehicleId) {

			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("Delete FROM vehicle_info where vehicle_id=" + vehicleId);
				ps.execute();

			} catch (Exception e2) {
				System.out.println(e2);
			}

		}

		// *********************************************************************************************************************

		public static void enterVehicle(Vehicle addVehicleAdminObject) {
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement(
						"insert into vehicles(vehicle_id,vehicle_vin,vehicle_model,vehicle_make,location_id,vehicle_type)"
								+ "VALUES (?,?,?,?,?,?);");

				ps.setString(1, addVehicleAdminObject.getVehicleId());
				ps.setString(2, addVehicleAdminObject.getVehicleVin());
				ps.setString(3, addVehicleAdminObject.getVehicleModel());
				ps.setString(4, addVehicleAdminObject.getVehicleMake());
				ps.setString(5, addVehicleAdminObject.getLocationId());
				ps.setString(6, addVehicleAdminObject.getVehicleType());

				Boolean i = ps.execute();

				if (i) {
					System.out.println("LOG : Vehicle is successfully registered!");
				}

			} catch (Exception e2)

			{
				System.out.println("LOG: Something is wrong in database. Problem: " + e2);
			}

		}

// *********************************************************************************************************************

		public static LinkedHashMap<String, Vehicle> getAllVehicleList() {
			LinkedHashMap<String, Vehicle> hashmap = new LinkedHashMap<String, Vehicle>();
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("SELECT * FROM vehicles");
				ResultSet rs = ps.executeQuery();

				while (rs.next())

				{

					Vehicle addVehicleAdminObject = new Vehicle(rs.getString("vehicle_id"), rs.getString("vehicle_vin"),
							rs.getString("vehicle_model"), rs.getString("vehicle_make"), rs.getString("location_id"),
							rs.getString("vehicle_type"));

					hashmap.put(rs.getString("vehicle_id"), addVehicleAdminObject);

				}
			} catch (Exception e2) {
				System.out.println(e2);
			}

			return hashmap;
		}



		public static ArrayList<String> getVehicleClass() {
		ArrayList<String> vehicleClasses = new ArrayList<String>();
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("SELECT distinct vehicle_id FROM vehicles");
				ResultSet rs = ps.executeQuery();

				while (rs.next())

				{
					vehicleClasses.add(rs.getString("vehicle_id"));

				}
			} catch (Exception e2) {
				System.out.println(e2);
			}

			return vehicleClasses;
		}

		// ****************************************************************************************************************
		public static void updateVehicle(Vehicle updateVehicleAdminBeanObject) {
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("UPDATE vehicles SET location_id='" + updateVehicleAdminBeanObject.getLocationId()
								+ "',vehicle_model='" + updateVehicleAdminBeanObject.getVehicleModel() + "',vehicle_make='"
								+ updateVehicleAdminBeanObject.getVehicleMake() + "',vehicle_type='"
								+ updateVehicleAdminBeanObject.getVehicleType() + "' WHERE vehicle_vin='"
								+ updateVehicleAdminBeanObject.getVehicleVin() + "'");

				ps.execute();

				Boolean i = ps.execute();

				if (i) {
					System.out.println("LOG : Vehicle is successfully registered!");
				}

			} catch (Exception e2)

			{
				System.out.println("LOG: Something is wrong in Vehicle database. Problem: " + e2);
			}

		}
		// *********************************************************************************************************************

		public static void deleteVehicle(String vehicleVin) {

			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("Delete FROM vehicles where vehicle_vin='" + vehicleVin + "'");
				ps.execute();

			} catch (Exception e2) {
				System.out.println(e2);
			}

		}
		// *********************************************************************************************************************

		public static HashMap<String, VehicleInfo> getAllVehicleTypeList() {
			HashMap<String, VehicleInfo> hashmap = new HashMap<String, VehicleInfo>();
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("SELECT * FROM vehicle_info");
				ResultSet rs = ps.executeQuery();

				while (rs.next())

				{

					VehicleInfo addVehicleTypeAdminObject = new VehicleInfo(rs.getString("vehicle_id"),
							rs.getDouble("vehicle_price"), rs.getString("vehicle_milage"), rs.getString("vehicle_passenger"),
							rs.getString("vehicle_sluggage"), rs.getString("vehicle_lluggage"),
							rs.getString("vehicle_transmission"), rs.getString("vehicle_image"));

					hashmap.put(rs.getString("vehicle_id"), addVehicleTypeAdminObject);

				}
			} catch (Exception e2) {
				System.out.println(e2);
			}

			return hashmap;
		}

		// *********************************************************************************************************************

		public static void enterInsurance(Insurance addInsuranceAdminObject) {
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement(
						"insert into insurance(insurance_name,insurance_type,cost_covered,insurance_company,insurance_price)"
								+ "VALUES (?,?,?,?,?);");

				ps.setString(1, addInsuranceAdminObject.getInsuranceName());
				ps.setString(2, addInsuranceAdminObject.getInsuranceType());
				ps.setDouble(3, addInsuranceAdminObject.getCostCovered());
				ps.setString(4, addInsuranceAdminObject.getInsuranceCompany());
				ps.setDouble(5, addInsuranceAdminObject.getInsurancePrice());

				Boolean i = ps.execute();

				if (i) {
					System.out.println("LOG : Insurance is successfully registered!");
				}

			} catch (Exception e2)

			{
				System.out.println("LOG: Something is wrong in database. Problem: " + e2);
			}

		}

		// ****************************************************************************************************************
		public static void updateInsuranceInformation(Insurance updateInsuranceAdminBeanObject) {
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("UPDATE insurance SET insurance_name='"
						+ updateInsuranceAdminBeanObject.getInsuranceName() + "',insurance_type='"
						+ updateInsuranceAdminBeanObject.getInsuranceType() + "',cost_covered='"
						+ updateInsuranceAdminBeanObject.getCostCovered() + "',insurance_company='"
						+ updateInsuranceAdminBeanObject.getInsuranceCompany() + "',insurance_price='"
						+ updateInsuranceAdminBeanObject.getInsurancePrice() + "' WHERE policy_number='"
						+ updateInsuranceAdminBeanObject.getInsuranceNumber() + "'");

				ps.execute();

				Boolean i = ps.execute();

				if (i) {
					System.out.println("LOG : INsurance is successfully registered!");
				}

			} catch (Exception e2)

			{
				System.out.println("LOG: Something is wrong in INsurance database. Problem: " + e2);
			}

		}

		// *********************************************************************************************************************

		public static HashMap<String, Insurance> getAllInsuranceList() {
			HashMap<String, Insurance> hashmap = new HashMap<String, Insurance>();
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("SELECT * FROM insurance");
				ResultSet rs = ps.executeQuery();

				while (rs.next())

				{

					Insurance addVehicleTypeAdminObject = new Insurance(rs.getInt("policy_number"),
							rs.getString("insurance_name"), rs.getString("insurance_type"), rs.getDouble("cost_covered"),
							rs.getString("insurance_company"), rs.getDouble("insurance_price")

					);

					hashmap.put(rs.getString("policy_number"), addVehicleTypeAdminObject);

				}
			} catch (Exception e2) {
				System.out.println(e2);
			}

			return hashmap;
		}

		// *********************************************************************************************************************

		public static void deleteInsurance(int insuranceId) {

			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("Delete FROM insurance where policy_number=" + insuranceId);
				ps.execute();

			} catch (Exception e2) {
				System.out.println(e2);
			}

		}

		// *********************************************************************************************************************

		public static void enterAccessory(Accessory addAccessoryAdminObject) {
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement(
						"insert into accessory(acc_name,total_number,available_number,hour_price,acc_company)" + "VALUES (?,?,?,?,?);");

				ps.setString(1, addAccessoryAdminObject.getAccName());
				ps.setInt(2, addAccessoryAdminObject.getTotalNumber());
				ps.setInt(3, addAccessoryAdminObject.getAvailableNumber());
				ps.setDouble(4, addAccessoryAdminObject.getHourPrice());
				ps.setString(5, addAccessoryAdminObject.getAccCompany());

				Boolean i = ps.execute();

				if (i) {
					System.out.println("LOG : Accessory is successfully registered!");
				}

			} catch (Exception e2)

			{
				System.out.println("LOG: Something is wrong in database. Problem: " + e2);
			}

		}

		// ****************************************************************************************************************
		public static void updateAccessory(Accessory updateAccessoryObject) {
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("UPDATE accessory SET acc_name='"
						+ updateAccessoryObject.getAccName() + "',acc_company='"
								+ updateAccessoryObject.getAccCompany() + "',total_number='" + updateAccessoryObject.getTotalNumber()
						+ "',available_number='" + updateAccessoryObject.getAvailableNumber() + "',hour_price='"
						+ updateAccessoryObject.getHourPrice() + "' WHERE acc_id='" + updateAccessoryObject.getAccId()
						+ "'");

				ps.execute();

				Boolean i = ps.execute();

				if (i) {
					System.out.println("LOG : Accessory is successfully registered!");
				}

			} catch (Exception e2)

			{
				System.out.println("LOG: Something is wrong in Accessory database. Problem: " + e2);
			}

		}

		// *********************************************************************************************************************

		public static void deleteAccessory(int accessoryId) {

			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("Delete FROM accessory where acc_id=" + accessoryId);
				ps.execute();

			} catch (Exception e2) {
				System.out.println(e2);
			}

		}
		// *********************************************************************************************************************

		public static HashMap<String, Accessory> getAllAccessoryList() {
			HashMap<String, Accessory> hashmap = new HashMap<String, Accessory>();
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("SELECT * FROM accessory");
				ResultSet rs = ps.executeQuery();

				while (rs.next())

				{

					Accessory addAccessoryAdminObject = new Accessory(rs.getInt("acc_id"), rs.getString("acc_name"),rs.getString("acc_company"),
							rs.getInt("total_number"), rs.getInt("available_number"), rs.getDouble("hour_price")

					);

					hashmap.put(rs.getString("acc_id"), addAccessoryAdminObject);

				}
			} catch (Exception e2) {
				System.out.println(e2);
			}

			return hashmap;
		}

		// *********************************************************************************************************************

		public static void enterLocation(Location addLocationAdminObject) {
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement(
						"insert into location(location_name,location_pin,location_city,location_country,location_state,location_address,location_hours,location_phone)"
								+ "VALUES (?,?,?,?,?,?,?,?);");

				ps.setString(1, addLocationAdminObject.getLocationName());
				ps.setString(2, addLocationAdminObject.getLocationPin());
				ps.setString(3, addLocationAdminObject.getLocationCity());
				ps.setString(4, addLocationAdminObject.getLocationState());
				ps.setString(5, addLocationAdminObject.getLocationCountry());
				ps.setString(6, addLocationAdminObject.getLocationAddress());
				ps.setString(7, addLocationAdminObject.getLocationHours());
				ps.setString(8, addLocationAdminObject.getLocationPhone());
				Boolean i = ps.execute();

				if (i) {
					System.out.println("LOG : Location is successfully registered!");
				}

			} catch (Exception e2)

			{
				System.out.println("LOG: Something is wrong in Location  database. Problem: " + e2);
			}

		}

		// *********************************************************************************************************************

		public static HashMap<String, Location> getAllLocationList() {
			HashMap<String, Location> hashmap = new HashMap<String, Location>();
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("SELECT * FROM location");
				ResultSet rs = ps.executeQuery();

				while (rs.next())

				{

					Location addLocationAdminObject = new Location(rs.getInt("location_id"), rs.getString("location_name"),
							rs.getString("location_pin"), rs.getString("location_city"), rs.getString("location_state"),
							rs.getString("location_country"), rs.getString("location_address"),
							rs.getString("location_hours"), rs.getString("location_phone")

					);

					hashmap.put(rs.getString("location_id"), addLocationAdminObject);

				}
			} catch (Exception e2) {
				System.out.println(e2);
			}

			return hashmap;
		}

		// ****************************************************************************************************************
		public static void updateLocation(Location updateLocationAdminBeanObject) {
			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement(
						"UPDATE location SET location_name='" + updateLocationAdminBeanObject.getLocationName()
								+ "',location_pin='" + updateLocationAdminBeanObject.getLocationPin() + "',location_city='"
								+ updateLocationAdminBeanObject.getLocationCity() + "',location_state='"
								+ updateLocationAdminBeanObject.getLocationState() + "',location_address='"
								+ updateLocationAdminBeanObject.getLocationAddress() + "',location_hours='"
								+ updateLocationAdminBeanObject.getLocationHours() + "',location_phone='"
								+ updateLocationAdminBeanObject.getLocationPhone() + "' WHERE location_id='"
								+ updateLocationAdminBeanObject.getLocationid() + "'");

				ps.execute();

				Boolean i = ps.execute();

				if (i) {
					System.out.println("LOG : Location is successfully registered!");
				}

			} catch (Exception e2)

			{
				System.out.println("LOG: Something is wrong in Location database. Problem: " + e2);
			}

		}
		// *********************************************************************************************************************

		public static void deleteLocation(int locationId) {

			try {

				conn = getConnection();
				PreparedStatement		ps = conn.prepareStatement("Delete FROM location where location_id=" + locationId);
				ps.execute();

			} catch (Exception e2) {
				System.out.println(e2);
			}

		}
		
		// *********************************************************************************************************************

				public static LinkedHashMap<String, Vehicle> getSelectedVehicles(String vehicleModel) {
					LinkedHashMap<String, Vehicle> hashmap = new LinkedHashMap<String, Vehicle>();
					try {

						conn = getConnection();
						PreparedStatement		ps = conn.prepareStatement("SELECT * FROM vehicles where vehicle_model="+"'"+vehicleModel+"'");
						ResultSet rs = ps.executeQuery();

						while (rs.next())

						{

							Vehicle addVehicleAdminObject = new Vehicle(rs.getString("vehicle_id"), rs.getString("vehicle_vin"),
									rs.getString("vehicle_model"), rs.getString("vehicle_make"), rs.getString("location_id"),
									rs.getString("vehicle_type"));

							hashmap.put(rs.getString("vehicle_id"), addVehicleAdminObject);

						}
					} catch (Exception e2) {
						System.out.println(e2);
					}

					return hashmap;
				}



				// *********************************************************************************************************************

				public static LinkedHashMap<String, Vehicle> getSortedVehicles(String sortValue) {
					LinkedHashMap<String, Vehicle> hashmap = new LinkedHashMap<String, Vehicle>();
					try {

						conn = getConnection();
						PreparedStatement		ps = conn.prepareStatement("SELECT * FROM vehicles ORDER BY "+sortValue);
						ResultSet rs = ps.executeQuery();

						while (rs.next())

						{

							Vehicle addVehicleAdminObject = new Vehicle(rs.getString("vehicle_id"), rs.getString("vehicle_vin"),
									rs.getString("vehicle_model"), rs.getString("vehicle_make"), rs.getString("location_id"),
									rs.getString("vehicle_type"));

							hashmap.put(rs.getString("vehicle_id"), addVehicleAdminObject);

						}
					} catch (Exception e2) {
						System.out.println(e2);
					}

					return hashmap;
				}






























	/*
	* Belwo section has method for sign/Signup
	*
	*/



	public static void insertCustomer(Customer customer){
			String firtsName = customer.getFirstName();
			String lastName = customer.getLastName();
			String emailId = customer.getEmailId();
			String password = customer.getPassword();
			String phone = customer.getPhone();
			String licenseNo = customer.getLicenseNo();
			String customerType = customer.getCustomerType();

			try{
				  getConnection();
					String insertIntoCustomerQuery = "INSERT INTO customer(first_name,last_name,password,email_id,phone,license_no,customer_type)" + "VALUES(?,?,?,?,?,?,?)";
					PreparedStatement pst = conn.prepareStatement(insertIntoCustomerQuery);
					pst.setString(1,firtsName);
					pst.setString(2,lastName);
					pst.setString(3,password);
					pst.setString(4,emailId);
					pst.setString(5,phone);
					pst.setString(6,licenseNo);
					pst.setString(7,customerType);
					pst.execute();
					pst.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}

		}

	public static boolean checkCustomer(String emailId){
		boolean status = false;
		try{
			getConnection();

			String checkCutomerQuery = "SELECT email_id from customer where email_id = ?;";
			PreparedStatement pst = conn.prepareStatement(checkCutomerQuery);
			pst.setString(1,emailId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				String emailIdDb = (rs.getString("email_id"));
				//System.out.println(emailIdDb);
				if (emailId.equals(emailIdDb)){
					status = true;
				}
				else{
					status = false;
				}
			}
			pst.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}

	public static HashMap<String, Customer> selectCustomer(String emailId){
	  HashMap<String, Customer> customer = new HashMap<String, Customer>();
		try{
			getConnection();
			String selectCustomerQuery = "SELECT * from customer where email_id = ?;";
			PreparedStatement pst = conn.prepareStatement(selectCustomerQuery);
			pst.setString(1,emailId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				Integer customerId = rs.getInt("customer_id");
				String firtsName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
			  emailId = rs.getString("email_id");
				String password = rs.getString("password");
				String phone = rs.getString("phone");
				String licenseNo = rs.getString("license_no");
				String customerType = rs.getString("customer_type");

				Customer cust = new Customer(customerId,firtsName,lastName,emailId,password,phone,licenseNo,customerType);
				customer.put(emailId,cust);
			}
	   pst.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return customer;
	}


/*
***View Reservation***
**BEGINS**
*/




public static ArrayList<BookingDetail> getBookingDetails(Integer customerId)
{
        ArrayList<BookingDetail> rList = new ArrayList<BookingDetail>();
        try{
            conn = getConnection();
						String selectFromBookingDetail = null;
						if(customerId !=null && customerId!=0){
							System.out.println("customerId is available");
							selectFromBookingDetail = "SELECT * FROM booking_detail WHERE customer_id='"+customerId+"';";
					 }
						else
						{ selectFromBookingDetail = "SELECT * FROM booking_detail;";
							System.out.println("customerId is not available");
					}
            PreparedStatement pst = conn.prepareStatement(selectFromBookingDetail);
            ResultSet result = pst.executeQuery();
            while(result.next()){
							Integer age = result.getInt("customer_age");

						BookingDetail bookingDetail = new BookingDetail();
						bookingDetail.setBookingId(result.getInt("booking_id"));
						bookingDetail.setCustomerName(result.getString("customer_name"));
						bookingDetail.setCustomerId(result.getInt("customer_id"));
						bookingDetail.setCustomerAge(age);
						bookingDetail.setCustomerName(result.getString("customer_phone"));
						bookingDetail.setLocationId(result.getString("location_id"));
						bookingDetail.setInsuranceId(result.getInt("insurance_id"));
						bookingDetail.setTotalPrice(result.getDouble("rental_price"));
						bookingDetail.setDrivingLicense(result.getString("driver_license"));
						bookingDetail.setBookingTime(result.getString("booking_time"));
						bookingDetail.setBookingDate(result.getString("booking_date"));

						rList.add(bookingDetail);

			}

        }
        catch(Exception e){
					e.printStackTrace();
				}
        return rList;
}

public static ArrayList<String> viewReservationFromBookingDetail(String customerId)
{
        ArrayList<String> rList = new ArrayList<String>();
        try{
            conn = getConnection();
            String selectFromBookingDetail = "SELECT * FROM booking_detail WHERE customer_id='"+customerId+"';";
            PreparedStatement pst = conn.prepareStatement(selectFromBookingDetail);
            ResultSet result = pst.executeQuery();
            while(result.next()){

			rList.add(result.getString("bookingId"));
			rList.add(result.getString("customerName"));
      rList.add(result.getString("customerId"));
			rList.add(Integer.toString(result.getInt("customerAge")));
			rList.add(result.getString("customerPhone"));
			rList.add(result.getString("locationId"));
			rList.add(result.getString("insuranceId"));
			rList.add(Double.toString(result.getDouble("rentalPrice")));
			rList.add(result.getString("drivingLicense"));

			}

        }
        catch(Exception e){}
        return rList;
}

public static HashMap<Integer,BookingTime>  viewReservationFromBookingTime()
{
      	HashMap<Integer,BookingTime>  bookingTimes = new HashMap<Integer,BookingTime>();
				
        try{

            conn = getConnection();

						String selectFromBookingTime = "SELECT * FROM booking_time;";
            PreparedStatement pst = conn.prepareStatement(selectFromBookingTime);
            ResultSet result = pst.executeQuery();
          while(result.next()){
			  BookingTime bookingTime = new BookingTime();

            bookingTime.setBookingId(Integer.parseInt(result.getString("booking_id")));
						bookingTime.setVehicleId(result.getString("vehicle_id"));
						bookingTime.setVehicleVin(result.getString("vehicle_vin"));
						bookingTime.setVehicleType(result.getString("vehicle_type"));
						bookingTime.setStartTime(result.getTimestamp("start_time"));
						bookingTime.setEndTime(result.getTimestamp("end_time"));
						
						bookingTimes.put(Integer.parseInt(result.getString("booking_id")),bookingTime);

					}

			//start date
			//end date

        }
        catch(Exception e){}
        return bookingTimes;
}

public static Account viewReservationFromBookingTransaction(String bookingId)
{
				Account account = null;
        List<String> rList = new ArrayList<String>();
        try{
            conn = getConnection();
            String selectFromBookingTransaction = "SELECT * FROM booking_transaction WHERE booking_id='"+bookingId+"';";
            PreparedStatement pst = conn.prepareStatement(selectFromBookingTransaction);
            ResultSet result = pst.executeQuery();
            result.first();
						account = new Account(Integer.parseInt(result.getString("booking_id")),result.getString("name_on_card"),result.getString("card_number"),
						result.getString("card_type"),result.getString("card_expiry_month"),result.getString("card_expiry_year"),
						result.getString("card_cvv"),result.getString("address1"),result.getString("address2"),result.getString("city"),
						result.getString("country"),result.getString("zip"),result.getString("phone_number"));

        }
        catch(Exception e){}
        return account;
}


public static String getFullVehicleNameFromVehicleId(String vehicleId)
                {
                                String fullVehicleName = "";
                                try
                                {
                                                Connection conn = getConnection();

                                                String getFullNameQuery = "select vehicle_model, vehicle_make from vehicles where vehicle_id = ?";
                                                PreparedStatement pst=  conn.prepareStatement(getFullNameQuery);
                                                pst.setString(1,vehicleId);
                                                ResultSet rs = pst.executeQuery();

                                                while (rs.next ())
                                                {
                                                                String make = rs.getString("vehicle_make");
                                                                String model = rs.getString("vehicle_model");

                                                                fullVehicleName = make + " " + model;
                                                }

                                                rs.close ();
                                                //s.close ();
                                                //conn.close();
                                }
                                catch(Exception e)
                                {
                                                e.printStackTrace();
                                }
                                return fullVehicleName;
                }


public static VehicleInfo viewReservationFromVehicleInfo(String vehicleId)
{
        VehicleInfo vehicleInfo = new VehicleInfo();
        try{
            conn = getConnection();
            String selectFromVehicleInfo = "SELECT * FROM vehicle_info WHERE vehicle_id='"+vehicleId+"';";
            PreparedStatement pst = conn.prepareStatement(selectFromVehicleInfo);
            ResultSet result = pst.executeQuery();
            result.first();
       vehicleInfo.setVehicleId(result.getString("vehicle_id"));
			 vehicleInfo.setVehicleMilage(result.getString("vehicle_milage"));
			 Integer vehiclePassenger = result.getInt("vehicle_passenger");
			 vehicleInfo.setVehiclePassenger(vehiclePassenger.toString());
			 Integer vehicleSLuggage = result.getInt("vehicle_sluggage");
			 vehicleInfo.setVehicleSLuggage(vehicleSLuggage.toString());
			 Integer vehicleLLuggage = result.getInt("vehicle_lluggage");
			 vehicleInfo.setVehicleLLuggage(vehicleLLuggage.toString());
			 vehicleInfo.setVehicleImage(result.getString("vehicle_image"));
			 vehicleInfo.setVehicleTransmission(result.getString("vehicle_transmission"));
			 vehicleInfo.setVehiclePrice(result.getDouble("vehicle_price"));


        }
        catch(Exception e){
					e.printStackTrace();
				}
        return vehicleInfo;
}

public static Insurance viewReservationFromInsurance(Integer insuranceId)
{
      Insurance insurance = new Insurance();
        try{
            conn = getConnection();
            String selectFromInsurance = "SELECT * FROM insurance WHERE policy_number='"+insuranceId+"';";
            PreparedStatement pst = conn.prepareStatement(selectFromInsurance);
            ResultSet result = pst.executeQuery();
            result.first();
					//	Double price =   * 1.0;
      			insurance = new Insurance();
						insurance.setInsuranceNumber(result.getInt("policy_number"));
						insurance.setInsuranceName(result.getString("insurance_name"));
						insurance.setInsuranceType(result.getString("insurance_type"));
						insurance.setCostCovered(result.getInt("cost_covered"));
						insurance.setInsuranceCompany(result.getString("insurance_company"));
						insurance.setInsurancePrice(result.getDouble("insurance_price"));
        }
        catch(Exception e){}
        return insurance;
}

public static ArrayList<String> getAccessoryList(Integer bookingId){
	ArrayList<String> accessorieLiest = new ArrayList<String>();
	Connection conn = getConnection();
	int count = 1;

	try{
			conn = getConnection();
			String queryString = "select accessory_id from booking_accessories where booking_id = ?";
			PreparedStatement pst = conn.prepareStatement(queryString);
			pst.setString(1,bookingId.toString());
			ResultSet result = pst.executeQuery();
			while(result.next()){
				accessorieLiest.add(result.getString("accessory_id"));
			}

			}catch(Exception e){
				e.printStackTrace();
			}
			return accessorieLiest;
	}


public static Accessory viewReservationFromAccessory(Integer accId)
{
        Accessory accessory = null;
        try{
            conn = getConnection();
            		String selectFromAccessory = "SELECT * FROM accessory WHERE accId='"+accId+"';";
								PreparedStatement pst = conn.prepareStatement(selectFromAccessory);
							  ResultSet result = pst.executeQuery();

								while(result.next()){
									Integer acc_Id = result.getInt("acc_id");
									String accName = result.getString("acc_name");
									String accCompany = result.getString("acc_Company");
									Integer totalNumber = result.getInt("total_Number");
									Integer availableNumber = result.getInt("available_Number");
									double hourPrice = result.getDouble("hour_price");


									accessory = new Accessory(acc_Id,accName,accCompany,totalNumber,availableNumber,hourPrice);
								}
        }
        catch(Exception e){}
        return accessory;
}

public static Location viewReservationFromLocation(String locationId)
{
        Location location = null;
        try{
            conn = getConnection();
            String selectFromInsurance = "SELECT * FROM location WHERE location_id='"+locationId+"';";
            PreparedStatement pst = conn.prepareStatement(selectFromInsurance);
            ResultSet result = pst.executeQuery();
            result.first();
						location = new Location(result.getInt("location_id"),result.getString("location_name"),result.getString("location_pin"),result.getString("location_City"),result.getString("location_state"),
						result.getString("location_country"),result.getString("location_address"),result.getString("location_hours"),result.getString("location_phone"));



		}
        catch(Exception e){}
        return location;
}

public static Vehicle viewReservationFromVehicle(String vehicleId)
{
        	Vehicle vehicle = null;
        try{
							conn = getConnection();
							String selectFromVehicle = "SELECT * FROM vehicle WHERE vehicle_id='"+vehicleId+"';";
							PreparedStatement pst = conn.prepareStatement(selectFromVehicle);

							ResultSet result = pst.executeQuery();

							while(result.next()){
								String vehicle_vin = result.getString("vehicle_vin");
								String vehicle_id = result.getString("vehicle_id");
								String vehicleType = result.getString("vehicle_type");
								String vehicleMake = result.getString("vehicle_make");
								String vehicleModel = result.getString("vehicle_model");
						    String locationId = result.getString("location_id");
						    vehicle	 = new Vehicle(vehicle_id,vehicle_vin,vehicleModel,vehicleMake,locationId,vehicleType);

					}
				}
        catch(Exception e){}
        return vehicle;
}

/*
***View Reservation***
**ENDS**
*/


/*
***Cancel Reservation***
**BEGINS**
*/


public static void cancelReservation(Integer bookingId)
{
        try{
            conn = getConnection();
			PreparedStatement pst = null;

            String deleteFromBookingDetail = "DELETE FROM booking_detail WHERE booking_id='"+bookingId+"';";
			String deleteFromBookingTime = "DELETE FROM booking_time WHERE booking_id='"+bookingId+"';";
			String deleteFromBookingTransaction = "DELETE FROM booking_transaction WHERE booking_id='"+bookingId+"';";
			String deleteFromBookingAccessories = "DELETE FROM booking_accessories WHERE booking_id='"+bookingId+"';";

            pst = conn.prepareStatement(deleteFromBookingDetail);
			pst.execute();

			pst = conn.prepareStatement(deleteFromBookingTime);
			pst.execute();

			pst = conn.prepareStatement(deleteFromBookingTransaction);
			pst.execute();
			
			pst = conn.prepareStatement(deleteFromBookingAccessories);
			pst.execute();

        }
        catch(Exception e){}
}

/*
***Cancel Reservation***
**ENDS**
*/


/*
***Modify Reservation***
**BEGINS**
*/


public static void modifyReservation(String bookingId,String cname,String phno,String dlno,String cardtype,String cardnum,String emonth,String eyear,String cvv,String a1,String a2,String city,String country,String zip,String phnum)
{
		try{
		conn = getConnection();
		PreparedStatement pst = null;

		String queryString = "UPDATE TABLE booking_transaction set (card_type,card_number,card_expiry_month,card_expiry_year,card_cvv,address1,address2,zip,city,country,phone_number) WHERE booking_id='"+bookingId+"'"
		+ "VALUES(?,?,?,?,?,?,?,?,?,?,?);";
		pst = conn.prepareStatement(queryString);
		pst.setString(1,cardtype);
		pst.setString(2,cardnum);
		pst.setString(3,emonth);
		pst.setString(4,eyear);
		pst.setString(5,cvv);
		pst.setString(6,a1);
		pst.setString(7,a2);
		pst.setString(8,zip);
		pst.setString(9,city);
		pst.setString(10,country);
		pst.setString(11,phnum);
		pst.execute();

		String queryString1 = "UPDATE TABLE booking_detail set (customerName,customerPhone,drivingLicense) WHERE customer_id='"+bookingId+"'"
		+ "VALUES(?,?,?);";
		pst = conn.prepareStatement(queryString1);
		pst.setString(1,"customerName");
		pst.setString(2,"customerPhone");
		pst.setString(3,"drivingLicense");

		}
		catch(Exception e){}
}


/*
***Modify Reservation***
**ENDS**
*/


	// Class Driver


	public static void main(String[] args){
	  String time = "00:30:00";
 	  String time1 = "00:30:00";
 	  String startDateString = "11-13-2016";
		String endDateString = "11-14-2016";
		Search search = new Search();
		search.setPickUpTime(time);
		search.setReturnTime(time1);
		search.setPickUpDate(startDateString);
		search.setReturnDate(endDateString);
		search.setPickUpLocation("LO1");
		search.setVehicleType("Sports");

   HashMap<String,Vehicle> v = MySQLDataStoreUtilities.getVehicleAvailable(search);
	// int size = v.size();
	// System.out.println("size= " + size);

	 for(String vin: v.keySet()){
       System.out.println(vin);

	 }


	}
	
	public static String getExactLocationNameFromLocationId(Integer locationId)
	{
		String exactLocationName = "";
		try
		{
			Connection conn = getConnection();
			
			String getFullNameQuery = "select location_name from location where location_id = ?";
			PreparedStatement pst=  conn.prepareStatement(getFullNameQuery);
			pst.setInt(1,locationId);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next ())
			{
				String locationName = rs.getString("location_name");
				exactLocationName = locationName;
			}
			
			rs.close ();
			//s.close ();
			//conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return exactLocationName;
	}

}
