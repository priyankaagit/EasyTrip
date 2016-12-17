/*
*   This file is a Pojo. It has bookingTime detail for the table booking_time
*
*/

package reservationPackage;
import vehiclePackage.*;
import java.util.*;
public class BookingPlace{
  Integer bookingId;
  String pickUpLocation;
  String returnLocation;
 public BookingPlace(){}
 public BookingPlace(Integer bookingId,String pickUpLocation,String returnLocation){
    this.bookingId = bookingId;
    this.pickUpLocation = pickUpLocation;
    this.returnLocation = returnLocation;
  }

  public void setBookingId(Integer bookingId){
    this.bookingId = bookingId;
  }

  public Integer getBookingId(){
    return bookingId;
  }

  public String getPickUpLocation(){ return pickUpLocation;}
  public String getReturnLocation() { return returnLocation;}
  public void setPickUpLocation(String pickUpLocation){  this.pickUpLocation = pickUpLocation;}
  public void setReturnLocation(String returnLocation){this.returnLocation = returnLocation;}
  }
