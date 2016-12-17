package reviewPackage;
public class ReviewVehicle{

String vehicleType;
String vehicleMake;
String vehicleModel;
String vehicleId;
String locationName;
String locationZip;
String locationCity;
String locationState;
String locationCountry;
String userEmailId;
String userAge;
String userGender;
String userOccupation;
Integer reviewRating;
String reviewText;

public ReviewVehicle(){

}

public ReviewVehicle(  String vehicleType,String vehicleMake,String vehicleModel,String vehicleId,String locationName,String locationZip,String locationCity,String locationState,
                       String locationCountry,String userEmailId,String userAge,String userGender,String userOccupation,Integer reviewRating,String reviewText){
                  this.vehicleType= vehicleType;
                  this.vehicleMake = vehicleMake;
                  this.vehicleModel = vehicleModel;
                  this.vehicleId = vehicleId;
                  this.locationName = locationName;
                  this.locationZip = locationZip;
                  this.locationCity = locationCity;
                  this.locationState = locationState;
                  this.locationCountry = locationCountry;
                  this.userEmailId = userEmailId;
                  this.userAge = userAge;
                  this.userGender = userGender;
                  this.userOccupation = userOccupation;
                  this.reviewRating = reviewRating;
                  this.reviewText = reviewText;
                }




public void setVehicleType(String vehicleType){
  this.vehicleType = vehicleType;

}

public String getVehicleType(){
  return vehicleType;
}

public void setVehicleMake(String vehicleMake){
  this.vehicleMake = vehicleMake;

}

public String getVehicleMake(){
  return vehicleMake;
}

public void setVehicleModel(String vehicleModel){
  this.vehicleModel = vehicleModel;

}

public String getVehicleModel(){
  return vehicleModel;
}
public void setVehicleID(String vehicleId){
  this.vehicleId = vehicleId;

}

public String getVehicleID(){
  return vehicleId;
}
public void setLocationName(String locationName){
  this.locationName = locationName;

}

public String getLocationName(){
  return locationName;
}
public void setLocationZip(String locationZip){
  this.locationZip = locationZip;

}

public String getLocationZip(){
  return locationZip;
}
public void setLocationCity(String locationCity){
  this.locationCity = locationCity;

}

public String getLocationCity(){
  return locationCity;
}
public void setLocationState(String locationState){
  this.locationState = locationState;

}

public String getLocationState(){
  return locationState;
}
public void setLocationCountry(String locationCountry){
  this.locationCountry = locationCountry;

}

public String getLocationCountry(){
  return locationCountry;
}
public void setUserEmailId(String userEmailId){
  this.userEmailId = userEmailId;

}

public String getUserEmailId(){
  return userEmailId;
}
public void setUserAge(String userAge){
  this.userAge = userAge;

}

public String getUserAge(){
  return userAge;
}

public void setUserGender(String userGender){
  this.userGender = userGender;

}

public String getUserGender(){
  return userGender;
}

public void setUserOccupation(String userOccupation){
  this.userOccupation = userOccupation;

}

public String getUserOccupation(){
  return userOccupation;
}

public void setReviewRating(Integer reviewRating){
  this.reviewRating = reviewRating;

}

public Integer getReviewRating(){
  return reviewRating;
}

public void setReviewText(String reviewText){
  this.reviewText = reviewText;

}

public String getReviewText(){
  return reviewText;
}

}
