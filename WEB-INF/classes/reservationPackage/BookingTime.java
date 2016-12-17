/*
*   This file is a Pojo. It has bookingTime detail for the table booking_time
*
*/

package reservationPackage;
import db.*;
import vehiclePackage.*;
import java.util.*;
public class BookingTime{
  Integer bookingId;
  String vehicleVin;
  String vehicleId;
  String vehicleType;
  java.sql.Timestamp startTime;
  java.sql.Timestamp endTime;
  Integer dayDiff;

 public BookingTime(){}
 public BookingTime(Integer bookingId,String vehicleVin,String vehicleId,String vehicleType,java.sql.Timestamp startTime,java.sql.Timestamp endTime,Integer dayDiff){
    this.bookingId = bookingId;
    this.vehicleId = vehicleId;
    this.vehicleVin = vehicleVin;
    this.vehicleType = vehicleType;
    this.startTime = startTime;
    this.endTime = endTime;
    this.dayDiff = dayDiff;
  }

  public void setBookingId(Integer bookingId){
    this.bookingId = bookingId;
  }

  public Integer getBookingId(){
    return bookingId;
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

  public void setVehicleType(String vehicleType){
    this.vehicleType = vehicleType;
  }

  public String getVehicleType(){
    return vehicleType;
  }

  public void setStartTime(java.sql.Timestamp startTime){
    this.startTime = startTime;
  }

  public java.sql.Timestamp getStartTime(){
    return startTime;
  }

  public void setEndTime(java.sql.Timestamp endTime){
    this.endTime = endTime;
  }

  public java.sql.Timestamp getEndTime(){
    return endTime;
  }

  public  Integer getDayDiff(){ return this.dayDiff;}

  }
