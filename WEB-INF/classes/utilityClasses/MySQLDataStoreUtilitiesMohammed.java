package utilityClasses;

import java.util.*;
import java.sql.*;
import vehiclePackage.*;

public class MySQLDataStoreUtilitiesMohammed{

	//Connection conn = null;

	static private Connection getConnection(){
		Connection conn = null;
		
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

	public static String getDiscountForPromoCode(String promoCode)
	{
		String discount = "";

		try{
			Connection conn = getConnection();
			String queryString = "SELECT * FROM promotion where promo_code=?";
			PreparedStatement pst = conn.prepareStatement(queryString);
			pst.setString(1,promoCode);
			ResultSet result = pst.executeQuery();

			while(result.next()){
				
				discount = result.getString("percentage_off");
				
			}

		}catch(Exception e){
			e.printStackTrace();
		}
		
		return discount;
	}
	
	public static void deletePromotionFromMySQL(String promoCode)
	{
		try
		{
			Connection conn = getConnection();
			
			String deleteQuery = "DELETE FROM promotion where promo_code=?;";
			PreparedStatement pst = conn.prepareStatement(deleteQuery);
			
			pst.setString(1,promoCode);
			
			pst.execute();
			
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	public static void updatePromotionInMySQL(String promoCode,String percentageOff,String validTillDate, String originalPromoCode)
	{
		try
		{
			Connection conn = getConnection();
			
			String insertIntoOrderItemQuery = "Update promotion set promo_code=?, percentage_off=?, valid_till_date=? where promo_code=?";
			PreparedStatement pst = conn.prepareStatement(insertIntoOrderItemQuery);
			
			pst.setString(1,promoCode);
			pst.setString(2,percentageOff);
			pst.setString(3,validTillDate);
			pst.setString(4,originalPromoCode);
			
			pst.execute();
			
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void insertPromotionInMySQL(String promoCode,String percentageOff,String validTillDate)
	{
		try
		{
			Connection conn = getConnection();
			String queryString = "insert into promotion(promo_code,percentage_off,valid_till_date) VALUES(?,?,?)";
			PreparedStatement pst = conn.prepareStatement(queryString);
			pst.setString(1,promoCode);
			pst.setString(2,percentageOff);
			pst.setString(3,validTillDate);
			pst.execute();

		}catch(Exception e){
			e.printStackTrace();
		}

	}
	
	public static HashMap<String,Promotion> getPromotionsListFromMySQL()
	{
		HashMap<String,Promotion> promotions = new HashMap<String,Promotion>();

		try{
			Connection conn = getConnection();
			String queryString = "SELECT * FROM promotion";
			PreparedStatement pst = conn.prepareStatement(queryString);
			ResultSet result = pst.executeQuery();

			while(result.next()){
				
				String promo_code = result.getString("promo_code");
				String percentage_off = result.getString("percentage_off");
				String valid_till_date = result.getString("valid_till_date");
			
				Promotion promotion = new Promotion(promo_code,percentage_off,valid_till_date);
				promotions.put(promo_code,promotion);
			}

		}catch(Exception e){
			e.printStackTrace();
		}
		
		return promotions;
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
	
	public static LinkedHashMap<String, Integer> getTop5BookedLocations()
	{
		LinkedHashMap<Integer,Integer> top5BookedLocations = new LinkedHashMap<Integer,Integer>();
		
		try
		{
			Connection conn = getConnection();
			
			Statement s = conn.createStatement ();
			s.executeQuery ("select location_id, count(location_id) as totalBooked from booking_detail group by location_id limit 5");
			ResultSet rs = s.getResultSet();
			
			while (rs.next ())
			{
				String location_id_string = rs.getString("location_id");
				Integer totalBooked = rs.getInt("totalBooked");
				
				String afterCutString = location_id_string.substring(2);
				
				Integer location_id = Integer.parseInt(afterCutString);
				
				top5BookedLocations.put(location_id, totalBooked);
			}
			
			rs.close ();
			s.close ();
			//conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		LinkedHashMap<String,Integer> top5BookedLocationsWithExactLocationName = new LinkedHashMap<String,Integer>();
		
		for(Map.Entry<Integer, Integer> m :top5BookedLocations.entrySet())
		{
			Integer key = m.getKey();
			Integer value = m.getValue();
			
			String fullName = getExactLocationNameFromLocationId(key);
			
			top5BookedLocationsWithExactLocationName.put(fullName, value);
			
		}
		
		return top5BookedLocationsWithExactLocationName;
	}
	
	public static String getFullVehicleNameFromVehicleModel(String vehicleModel)
	{
		String fullVehicleName = "";
		try
		{
			Connection conn = getConnection();
			
			String getFullNameQuery = "select vehicle_model, vehicle_make from vehicles where vehicle_model = ?";
			PreparedStatement pst=  conn.prepareStatement(getFullNameQuery);
			pst.setString(1,vehicleModel);
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
	
	public static LinkedHashMap<String, Integer> getTop5BookedVehicles()
	{
		LinkedHashMap<String,Integer> top5BookedVehicles = new LinkedHashMap<String,Integer>();
		
		try
		{
			Connection conn = getConnection();
			
			Statement s = conn.createStatement ();
			s.executeQuery ("select vehicle_id, count(vehicle_id) as totalBooked from booking_time group by vehicle_id limit 5");
			ResultSet rs = s.getResultSet();
			
			while (rs.next ())
			{
				String vehicle_id = rs.getString("vehicle_id");
				Integer totalBooked = rs.getInt("totalBooked");
				
				top5BookedVehicles.put(vehicle_id, totalBooked);
			}
			
			rs.close ();
			s.close ();
			//conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		LinkedHashMap<String,Integer> top5BookedVehiclesWithFullName = new LinkedHashMap<String,Integer>();
		
		for(Map.Entry<String, Integer> m :top5BookedVehicles.entrySet())
		{
			String key = m.getKey();
			Integer value = m.getValue();
			
			String fullName = getFullVehicleNameFromVehicleId(key);
			
			top5BookedVehiclesWithFullName.put(fullName, value);
			
		}
		
		return top5BookedVehiclesWithFullName;
	}
	
	public static LinkedHashMap<String,Promotion> getPromotionsFromMySQL()
	{
		LinkedHashMap<String,Promotion> promotions = new LinkedHashMap<String,Promotion>();
		Promotion promotion;
		
		try
		{
			Connection conn = getConnection();
			
			Statement s = conn.createStatement ();
			s.executeQuery ("SELECT * FROM promotion");
			ResultSet rs = s.getResultSet();
			
			while (rs.next ())
			{
				String promoCode = rs.getString("promo_code");
				String percentageOff = rs.getString("percentage_off");
				String validTillDate = rs.getString("valid_till_date");
				
				promotion = new Promotion();
					
				promotion.setPromoCode(promoCode);
				promotion.setPercentageOff(percentageOff);
				promotion.setValidTillDate(validTillDate);
					
				promotions.put(promoCode, promotion);
				
			}
			
			/*
			System.out.println("promotions: "+promotions);
			for(Map.Entry<String,Promotion> m :promotions.entrySet())
			{
				Promotion p = m.getValue();
				
				System.out.println("Promotion: " + p.getPromoCode());
			}
			*/
			
			rs.close ();
			s.close ();
			//conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return promotions;
	}
	
	public static LinkedHashMap<String,Vehicle> getVehiclesFromMySQL()
	{
		LinkedHashMap<String,Vehicle> vehicles = new LinkedHashMap<String,Vehicle>();
		Vehicle vehicle;
		
		try
		{
			Connection conn = getConnection();
			
			Statement s = conn.createStatement ();
			s.executeQuery ("SELECT * FROM vehicles order by vehicle_id");
			ResultSet rs = s.getResultSet();
			
			while (rs.next ())
			{
				String vehicleId = rs.getString("vehicle_id");
				String vehicleVin = rs.getString("vehicle_vin");
			    String vehicleModel = rs.getString("vehicle_model");
			    String vehicleMake = rs.getString("vehicle_make");
			    String locationId = rs.getString("location_id");
				String vehicleType = rs.getString("vehicle_type");
				
				vehicle = new Vehicle();
					
				vehicle.setVehicleId(vehicleId);
				vehicle.setVehicleVin(vehicleVin);
				vehicle.setVehicleModel(vehicleModel);
				vehicle.setVehicleMake(vehicleMake);
				vehicle.setLocationId(locationId);
				vehicle.setVehicleType(vehicleType);
					
				vehicles.put(vehicleId, vehicle);
				
			}
			
			/*
			System.out.println("vehicles: "+vehicles);
			for(Map.Entry<String,Vehicle> m :vehicles.entrySet())
			{
				Vehicle p = m.getValue();
				
				System.out.println("Vehicle: " + p.getVehicleId());
			}
			*/
			
			rs.close ();
			s.close ();
			//conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return vehicles;
	}
	
	public static LinkedHashMap<String,VehicleInfo> getVehicleInfoFromMySQL()
	{
		LinkedHashMap<String,VehicleInfo> vehicleInfos = new LinkedHashMap<String,VehicleInfo>();
		VehicleInfo vehicleInfo;
		
		try
		{
			Connection conn = getConnection();
			
			Statement s = conn.createStatement ();
			s.executeQuery ("SELECT * FROM vehicle_info order by vehicle_id");
			ResultSet rs = s.getResultSet();
			
			while (rs.next ())
			{
				String vehicleId = rs.getString("vehicle_id");
				String vehicleMilage = rs.getString("vehicle_milage");
			    String vehiclePassenger = rs.getInt("vehicle_passenger")+"";
			    String vehicleSLuggage = rs.getInt("vehicle_sluggage")+"";
			    String vehicleLLuggage = rs.getInt("vehicle_lluggage")+"";
				String vehicleTransmission = rs.getString("vehicle_transmission");
				String vehicleImage = rs.getString("vehicle_image");
				Double vehiclePrice = rs.getDouble("vehicle_price");
				
				vehicleInfo = new VehicleInfo();
					
				vehicleInfo.setVehicleId(vehicleId);
				vehicleInfo.setVehicleMilage(vehicleMilage);
				vehicleInfo.setVehiclePassenger(vehiclePassenger);
				vehicleInfo.setVehicleSLuggage(vehicleSLuggage);
				vehicleInfo.setVehicleLLuggage(vehicleLLuggage);
				vehicleInfo.setVehicleTransmission(vehicleTransmission);
				vehicleInfo.setVehicleImage(vehicleImage);
				vehicleInfo.setVehiclePrice(vehiclePrice);
					
				vehicleInfos.put(vehicleId, vehicleInfo);
				
			}
			
			/*
			System.out.println("vehicleInfos: "+vehicleInfos);
			for(Map.Entry<String,VehicleInfo> m :vehicleInfos.entrySet())
			{
				VehicleInfo p = m.getValue();
				
				System.out.println("VehicleInfo Of vehicle: " + p.getVehicleId());
			}
			*/
			
			rs.close ();
			s.close ();
			//conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return vehicleInfos;
	}
	
	public static void insertVehiclesFromXMLToMySQL()
	{
		LinkedHashMap<String,Vehicle> vehicles;
		LinkedHashMap<String,VehicleInfo> vehicleInfos;
		
		SAXParserForVehicles sp = new SAXParserForVehicles();
		
		vehicles = sp.getVehiclesHashMap();
		vehicleInfos = sp.getVehicleInfosHashMap();
		
		try{
			
			Connection conn = getConnection();
			
			for(Map.Entry<String,Vehicle> m :vehicles.entrySet())
			{
				String insertVehicles = "INSERT INTO vehicles(vehicle_vin, vehicle_id, vehicle_type, vehicle_make, vehicle_model, location_id) " + "VALUES (?,?,?,?,?,?);";
				PreparedStatement pst = conn.prepareStatement(insertVehicles);
				
				Vehicle s = m.getValue();
				
				pst.setString(1,s.getVehicleVin());
				pst.setString(2,s.getVehicleId());
				pst.setString(3,s.getVehicleType());
				pst.setString(4,s.getVehicleMake());
				pst.setString(5,s.getVehicleModel());
				pst.setString(6,s.getLocationId());
				
				pst.execute();
			}
			
			for(Map.Entry<String,VehicleInfo> m :vehicleInfos.entrySet())
			{
				String insertVehicleInfos = "INSERT INTO vehicle_info(vehicle_id, vehicle_price, vehicle_milage, vehicle_passenger, vehicle_sluggage, vehicle_lluggage, vehicle_transmission, vehicle_image) " + "VALUES (?,?,?,?,?,?,?,?);";
				PreparedStatement pst = conn.prepareStatement(insertVehicleInfos);
				
				VehicleInfo s = m.getValue();
				
				pst.setString(1,s.getVehicleId());
				pst.setString(2,""+s.getVehiclePrice());
				pst.setString(3,s.getVehicleMilage());
				pst.setInt(4,Integer.parseInt(s.getVehiclePassenger()));
				pst.setInt(5,Integer.parseInt(s.getVehicleSLuggage()));
				pst.setInt(6,Integer.parseInt(s.getVehicleLLuggage()));
				pst.setString(7,s.getVehicleTransmission());
				pst.setString(8,s.getVehicleImage());
				
				pst.execute();
			}
				
			//conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void deleteAllVehiclesFromTableMySQL()
	{
		try
		{
			Connection conn = getConnection();
			
			String safeUpdates = "SET SQL_SAFE_UPDATES=0; ;";
			Statement stmt1 = conn.createStatement();
			stmt1.execute(safeUpdates);
			
			String deleteFromVehicles = "delete from vehicles;";
			Statement stmt = conn.createStatement();
			stmt.execute(deleteFromVehicles);
			
			String deleteFromVehicleInfo = "delete from vehicle_info;";
			Statement stmt2 = conn.createStatement();
			stmt2.execute(deleteFromVehicleInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	public static void main(String args[]){
		
		//MySQLDataStoreUtilitiesMohammed.insertVehiclesFromXMLToMySQL();
		//MySQLDataStoreUtilitiesMohammed.getVehiclesFromMySQL();
		//MySQLDataStoreUtilitiesMohammed.getVehicleInfoFromMySQL();
	}
	

}
