package reservationPackage;
import vehiclePackage.*;
import java.util.*;
public class BookingDetail{
  Integer bookingId;
  String customerName;
  Integer customerId;
  String emailId;
  Integer customerAge;
  String customerPhone;
  String locationId;
  String vehicleId;
  String vehicleVin;
  Integer insuranceId;
  String drivingLicense;
  String bookingTime; //This is the time when the customer books the vehicle
  String bookingDate;// This is date when the customer books the vehicle
  Double totalPrice;
  ArrayList<Accessory> accessory;

 public BookingDetail(){}
 public BookingDetail(Integer bookingId,String customerName,Integer customerId,String emailId,Integer customerAge,String locationId,String vehicleId,String vehicleVin,
 Integer insuranceId,String drivingLicense,String bookingTime,String bookingDate,ArrayList<Accessory> accessory){
    this.bookingId = bookingId;
    this.customerName = customerName;
    this.customerId = customerId;
    this.emailId = emailId;
    this.customerAge = customerAge;
    this.locationId = locationId;
    this.vehicleId = vehicleId;
    this.vehicleVin = vehicleVin;
    this.insuranceId = insuranceId;
    this.drivingLicense = drivingLicense;
    this.bookingTime = bookingTime;
    this.bookingDate = bookingDate;
    this.totalPrice = totalPrice;
    this.accessory = accessory;
  }

  public void setBookingId(Integer bookingId){
    this.bookingId = bookingId;
  }

  public Integer getBookingId(){
    return bookingId;
  }

  public void setCustomerName(String customerName){
    this.customerName = customerName;
  }

  public String getCustomerName(){
    return customerName;
  }


  public void setCustomerId(Integer customerId){
    this.customerId = customerId;
  }

  public Integer getCustomerId(){
    return customerId;
  }


  public void setEmailId(String emailId){
    this.emailId = emailId;
  }

  public String getEmailId(){
    return emailId;
  }



  public void setCustomerAge(Integer customerAge){
    this.customerAge = customerAge;
  }

  public Integer getCustomerAge(){
    return customerAge;
  }

  public void setLocationId(String locationId){
    this.locationId = locationId;
  }

  public String getLocationId(){
    return locationId;
  }

  public void setVehicleId(String vehicleId){
    this.vehicleId = vehicleId;
  }

  public String getVehicleId(){
    return vehicleId;
  }

  public void setVehicleVin(String vehicleVin){
    this.vehicleVin = vehicleVin;
  }

  public String getVehicleVin(){
    return vehicleVin;
  }

  public void setInsuranceId(Integer insuranceId){
    this.insuranceId = insuranceId;
  }

  public Integer getInsuranceId(){
    return insuranceId;
  }

  public void setDrivingLicense(String drivingLicense){
    this.drivingLicense = drivingLicense;
  }

  public String getDrivingLicense(){
    return drivingLicense;
  }

  public void setBookingTime(String bookingTime){
    this.bookingTime = bookingTime;
  }

  public String getBookingTime(){
    return bookingTime;
  }

  public void setBookingDate(String bookingDate){
    this.bookingDate = bookingDate;
  }

  public String getBookingDate(){
    return bookingDate;
  }

  public void setTotalPrice(Double totalPrice){
    this.totalPrice = totalPrice;
  }

  public Double getTotalPrice(){
    return totalPrice;
  }


  public void setAccessory(ArrayList<Accessory> accessory){
    this.accessory = accessory;
  }

  public ArrayList<Accessory> getAccessory(){
    return accessory;
  }

  public void setCustomerPhone(String customerPhone){
    this.customerPhone = customerPhone;
  }

  public String getCustomerPhone(){
    return customerPhone;
  }

}
