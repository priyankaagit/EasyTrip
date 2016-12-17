package db;
import java.io.*;
import java.util.*;
import com.mongodb.*;
import reviewPackage.ReviewVehicle;
import utilityClasses.*;

public class MongoDBDataStoreUtilities {

	static DBCollection vehicleReviews;
	
	public static void getConnection(){
	  MongoClient mongo;
	  mongo = new MongoClient("localhost",27017);
	  DB db = mongo.getDB("EasytripReviews");
	  vehicleReviews = db.getCollection("vehicleReviews");
	}
	
	public static LinkedHashMap<String, Integer> getTop5ReviewedLocations()
	{
		LinkedHashMap<String, Integer> top5ReviewedLocations = new LinkedHashMap<String, Integer>();
		
		getConnection();
		
		AggregationOutput output =
            vehicleReviews.aggregate(
                    new BasicDBObject("$group",
                            new BasicDBObject("_id", "$locationName")
                                    .append("count", new BasicDBObject("$sum", 1)))
                    ,
                    new BasicDBObject("$sort", new BasicDBObject("count", -1)),
					new BasicDBObject("$limit", 5)
            );

		String locationName="";
		int count = 0;
		
		for (DBObject doc : output.results())
		{
			locationName = (String) doc.get("_id");
			count = (Integer) doc.get("count");
			
			top5ReviewedLocations.put(locationName, count);
			
			//System.out.println("locationName: " + locationName);
			//System.out.println("Count: " + count);
		}

		return top5ReviewedLocations;
	}
	
	public static LinkedHashMap<String, Integer> getTop5ReviewedZipCodes()
	{
		LinkedHashMap<String, Integer> top5ReviewedZipCodes = new LinkedHashMap<String, Integer>();
		
		getConnection();
		
		AggregationOutput output =
            vehicleReviews.aggregate(
                    new BasicDBObject("$group",
                            new BasicDBObject("_id", "$locationZip")
                                    .append("count", new BasicDBObject("$sum", 1)))
                    ,
                    new BasicDBObject("$sort", new BasicDBObject("count", -1)),
					new BasicDBObject("$limit", 5)
            );

		String zipCode="";
		int count = 0;
		
		for (DBObject doc : output.results())
		{
			zipCode = (String) doc.get("_id");
			count = (Integer) doc.get("count");
			
			top5ReviewedZipCodes.put(zipCode, count);
			
			//System.out.println("zipCode: " + zipCode);
			//System.out.println("Count: " + count);
		}

		return top5ReviewedZipCodes;
	}

	public static LinkedHashMap<String, Integer> getTop5ReviewedVehicles()
	{
		LinkedHashMap<String, Integer> topFiveReviewedVehicles = new LinkedHashMap<String, Integer>();
		
		getConnection();
		
		AggregationOutput output =
            vehicleReviews.aggregate(
                    new BasicDBObject("$group",
                            new BasicDBObject("_id", "$vehicleModel")
                                    .append("count", new BasicDBObject("$sum", 1)))
                    ,
                    new BasicDBObject("$sort", new BasicDBObject("count", -1)),
					new BasicDBObject("$limit", 5)
            );

		String vehicle="";
		int count = 0;
		
		for (DBObject doc : output.results())
		{
			vehicle = (String) doc.get("_id");
			count = (Integer) doc.get("count");
			
			topFiveReviewedVehicles.put(vehicle, count);
			
			//System.out.println("vehicle: " + vehicle);
			//System.out.println("Count: " + count);
		}
		
		LinkedHashMap<String,Integer> top5ReviewedVehiclesWithFullName = new LinkedHashMap<String,Integer>();
		
		for(Map.Entry<String, Integer> m :topFiveReviewedVehicles.entrySet())
		{
			String key = m.getKey();
			Integer value = m.getValue();
			
			String fullName = MySQLDataStoreUtilitiesMohammed.getFullVehicleNameFromVehicleModel(key);
			
			top5ReviewedVehiclesWithFullName.put(fullName, value);
			
		}

		return top5ReviewedVehiclesWithFullName;
	}
	
	public static LinkedHashMap<String, Double> getTop5LikedVehicles()
	{
		LinkedHashMap<String, Double> topFiveLikedVehicles = new LinkedHashMap<String, Double>();
		
		getConnection();
		
		AggregationOutput output =
			vehicleReviews.aggregate(
					new BasicDBObject("$group",
							new BasicDBObject("_id", "$vehicleModel")
									.append("avgRating", new BasicDBObject("$avg", "$reviewRating")))
					,
					new BasicDBObject("$sort", new BasicDBObject("avgRating", -1)),
					new BasicDBObject("$limit", 5)
			);

		String vehicleName="";
		double avg = 0;
		
		for (DBObject doc : output.results())
		{
			vehicleName = (String) doc.get("_id");
			avg = (Double) doc.get("avgRating");
			
			if(avg>4)
			{
				topFiveLikedVehicles.put(vehicleName, avg);
				//System.out.println("vehicleName: " + vehicleName);
				//System.out.println("avg: " + avg);
			}
			
		}
		
		
		LinkedHashMap<String,Double> top5LikedVehiclesWithFullName = new LinkedHashMap<String,Double>();
		
		for(Map.Entry<String, Double> m :topFiveLikedVehicles.entrySet())
		{
			String key = m.getKey();
			Double value = m.getValue();
			
			String fullName = MySQLDataStoreUtilitiesMohammed.getFullVehicleNameFromVehicleModel(key);
			
			top5LikedVehiclesWithFullName.put(fullName, value);
			
		}

		return top5LikedVehiclesWithFullName;
	}

	public static void insertVehicleReview(ReviewVehicle review){

	  String vehicleType = review.getVehicleType();
	  String vehicleMake = review.getVehicleMake();
	  String vehicleModel = review.getVehicleModel() ;
	  String vehicleId = review.getVehicleID();
	  String locationName = review.getLocationName();
	  String locationZip = review.getLocationZip();
	  String locationCity = review.getLocationCity();
	  String locationState = review.getLocationState();
	  String locationCountry = review.getLocationCountry();
	  String userEmailId = review.getUserEmailId();
	  String userAge = review.getUserAge() ;
	  String userGender = review.getUserGender();
	  String userOccupation = review.getUserOccupation();
	  Integer reviewRating = review.getReviewRating();
	  String reviewText = review.getReviewText();

	  try{
		getConnection();
		BasicDBObject doc = new BasicDBObject("title","vehicleReviews");
		doc.append("vehicleType",vehicleType);
		doc.append("vehicleMake",vehicleMake);
		doc.append("vehicleModel",vehicleModel);
		doc.append("vehicleId",vehicleId);
		doc.append("locationName",locationName);
		doc.append("locationZip",locationZip);
		doc.append("locationCity",locationCity);
		doc.append("locationState",locationState);
		doc.append("locationCountry",locationCountry);
		doc.append("locationState",locationState);
		doc.append("locationCountry",locationCountry);
		doc.append("userEmailId",userEmailId);
		doc.append("userAge",userAge);
		doc.append("userGender",userGender);
		doc.append("userOccupation",userOccupation);
		doc.append("reviewRating",reviewRating);
		doc.append("reviewText",reviewText);
		vehicleReviews.insert(doc);

	  }
	  catch (Exception e){
		e.printStackTrace();
	  }

	}

	public static ArrayList<ReviewVehicle> searchVehicleReview(String vehicleId) {
			getConnection();
			ArrayList<ReviewVehicle> listReview = new ArrayList<ReviewVehicle>();
			//String str = vehicleID;
			try{
				BasicDBObject query = new BasicDBObject();
				query.put("vehicleId",vehicleId);
				DBCursor cursor = vehicleReviews.find(query);
				while (cursor.hasNext())
				{
					BasicDBObject obj= (BasicDBObject) cursor.next();

					ReviewVehicle review = new ReviewVehicle();

					review.setVehicleType(obj.getString("vehicleType"));
					review.setVehicleMake(obj.getString("vehicleMake"));
					review.setVehicleModel(obj.getString("vehicleModel"));
					review.setVehicleID(obj.getString("vehicleId"));
					review.setLocationName(obj.getString("locationName"));
					review.setLocationZip(obj.getString("locationZip"));
					review.setLocationCity(obj.getString("locationCity"));
					review.setLocationState(obj.getString("locationState"));
					review.setLocationCountry(obj.getString("locationCountry"));
					review.setUserEmailId(obj.getString("userEmailId"));
					review.setUserAge(obj.getString("userAge"));
					review.setUserGender(obj.getString("userGender"));
					review.setUserOccupation(obj.getString("userOccupation"));
					review.setReviewRating(obj.getInt("reviewRating"));
					review.setReviewText(obj.getString("reviewText"));

					listReview.add(review);
				}

			} catch(MongoException e){}
			return listReview;

		}

	
	/*
	public static void main(String args[]){
	String vehicleId = "";
	ArrayList<ReviewVehicle> listReview = new ArrayList<ReviewVehicle>();
	listReview = MongoDBDataStoreUtilities.searchVehicleReview(vehicleId);
	if(listReview.isEmpty())
	System.out.println("I am empty");
	for(ReviewVehicle reviewVehicle:listReview ){
	  System.out.println(reviewVehicle.getVehicleType());
	}
	}
	*/
}
