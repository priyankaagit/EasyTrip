package vehiclePackage;
public class VehicleInfo{
String vehicleId;
String vehicleMilage;
String vehiclePassenger;
String vehicleSLuggage;
String vehicleLLuggage;
String vehicleTransmission;
String vehicleImage;
double vehiclePrice;

public VehicleInfo(String vehicleId,double vehiclePrice,String vehicleMilage,String vehiclePassenger,String vehicleSLuggage,String vehicleLLuggage,String vehicleTransmission,String vehicleImage){
this.vehicleId = vehicleId;
this.vehiclePrice = vehiclePrice;
this.vehicleMilage = vehicleMilage;
this.vehiclePassenger = vehiclePassenger;
this.vehicleSLuggage = vehicleSLuggage;
this.vehicleLLuggage = vehicleLLuggage;
this.vehicleTransmission = vehicleTransmission;
this.vehicleImage = vehicleImage;

}

public VehicleInfo()
{
	
}

  public void setVehicleId(String vehicleId){
    this.vehicleId = vehicleId;
  }

  public String getVehicleId(){
    return vehicleId;
  }


  public void setVehicleMilage(String vehicleMilage){
    this.vehicleMilage = vehicleMilage;
  }

  public String getVehicleMilage(){
    return vehicleMilage;
  }

  public void setVehiclePassenger(String vehiclePassenger){
    this.vehiclePassenger = vehiclePassenger;
  }

  public String getVehiclePassenger(){
    return vehiclePassenger;
  }
  public void setVehicleSLuggage(String vehicleSLuggage){
    this.vehicleSLuggage = vehicleSLuggage;
  }

  public String getVehicleSLuggage(){
    return vehicleSLuggage;
  }

  public void setVehiclePrice(double vehiclePrice){
    this.vehiclePrice = vehiclePrice;
  }

  public double getVehiclePrice(){
    return vehiclePrice;
  }

  public void setVehicleLLuggage(String vehicleLLuggage){
    this.vehicleLLuggage = vehicleLLuggage;
  }

  public String getVehicleLLuggage(){
    return vehicleLLuggage;
  }

  public void setVehicleTransmission(String vehicleTransmission){
    this.vehicleTransmission = vehicleTransmission;
  }

  public String getVehicleTransmission(){
    return vehicleTransmission;
  }

  public void setVehicleImage(String vehicleImage){
    this.vehicleImage = vehicleImage;
  }

  public String getVehicleImage(){
    return vehicleImage;
  }



}
