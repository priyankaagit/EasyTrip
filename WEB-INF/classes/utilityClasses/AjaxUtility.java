package utilityClasses;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.*;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;

import vehiclePackage.*;

public class AjaxUtility {
	
	public static Connection getConnection()
	{
		Connection conn = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bestdealdatabase", "root", "root");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return conn;
	}
	
	public static HashMap<Integer, Location> getLocationsFromMySQL()
	{
		
		HashMap<Integer, Location> locationMap= new HashMap<Integer, Location>();
		
		Location location;
		
		try
		{
			Connection conn = null;
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/easytrip?autoReconnect=true&useSSL=false", "root", "root");
			
			Statement s = conn.createStatement ();
			s.executeQuery ("SELECT * FROM location");
			ResultSet rs = s.getResultSet();
			
			while (rs.next ())
			{
				Integer locationId = rs.getInt("location_id");
				String locationName = rs.getString("location_name");
				String locationPin = rs.getString("location_pin");
				String locationCity = rs.getString("location_city");
				String locationState = rs.getString("location_state");
				String locationCountry = rs.getString("location_country");
				String locationPhone = rs.getString("location_phone");
				String operationHour = rs.getString("location_hours");
				String locationAddress = rs.getString("location_address");
				
				location = new Location();
					
				location.setLocationid(locationId);
				location.setLocationName(locationName);
				location.setLocationPin(locationPin);
				location.setLocationCity(locationCity);
				location.setLocationState(locationState);
				location.setLocationCountry(locationCountry);
				location.setLocationPhone(locationPhone);
				location.setLocationHours(operationHour);
				location.setLocationAddress(locationAddress);
					
				locationMap.put(locationId, location);
				
			}
			
			//System.out.println("locationMap: "+locationMap);
			
			for(Map.Entry<Integer,Location> m :locationMap.entrySet())
			{
				Location p = m.getValue();
				
				System.out.println("Location: " + p.getLocationName());
			}
			
			
			rs.close ();
			s.close ();
			
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return locationMap;
	}
	
	
	public static void main(String args[]){
		
		AjaxUtility.getLocationsFromMySQL();
		
	}
	
}


