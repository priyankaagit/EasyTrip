package searchPackage;

import java.util.Date;
public class Search{
  String pickUpLocation;
  String returnLocation;
  String pickUpDate;
  String returnDate;
  String pickUpTime;
  String returnTime;
  Integer customerAge;
  String vehicleType;
public Search(){}
public Search(String pickUpLocation,String returnLocation,String pickUpDate,String returnDate,String pickUpTime,String returnTime,Integer customerAge,String vehicleType)
{
    this.pickUpLocation = pickUpLocation;
    this.returnLocation = returnLocation;
    this.pickUpDate = pickUpDate;
    this.returnDate = returnDate;
    this.pickUpTime = pickUpTime;
    this.returnTime = returnTime;
    this.customerAge = customerAge;
    this.vehicleType = vehicleType;

}

public String getPickUpLocation(){ return pickUpLocation;}
public String getReturnLocation() { return returnLocation;}
public String getPickUpDate(){return pickUpDate;}
public String getReturnDate(){return returnDate;}
public String getPickUpTime(){return pickUpTime;}
public String getReturnTime(){return returnTime;}
public Integer getCustomerAge(){return customerAge;}
public String getVehicleType(){return vehicleType;}
public void setPickUpLocation(String pickUpLocation){  this.pickUpLocation = pickUpLocation;}
public void setReturnLocation(String returnLocation){this.returnLocation = returnLocation;}
public void setPickUpDate(String pickUpDate){this.pickUpDate = pickUpDate;}
public void setReturnDate(String returnDate){this.returnDate = returnDate;}
public void setPickUpTime(String pickUpTime){this.pickUpTime = pickUpTime;}
public void setReturnTime(String returnTime){this.returnTime = returnTime;}
public void setCustomerAge(Integer customerAge){this.customerAge = customerAge;}
public void setVehicleType(String vehicleType){this.vehicleType = vehicleType;}


}
