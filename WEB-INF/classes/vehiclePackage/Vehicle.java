package vehiclePackage;

public class Vehicle{
  String vehicleId;
  String vehicleVin;
  String vehicleModel;
  String vehicleMake;
  String locationId;
  String vehicleType;

 public Vehicle(String vehicleId,String vehicleVin,String vehicleModel,String vehicleMake,String locationId,String vehicleType){
    this.vehicleId = vehicleId;
    this.vehicleVin = vehicleVin;
    this.vehicleModel = vehicleModel;
    this.vehicleMake = vehicleMake;
    this.locationId = locationId;
    this.vehicleType = vehicleType;


  }
  
  public Vehicle()
  {
	  
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

  public void setVehicleModel(String vehicleModel){
    this.vehicleModel = vehicleModel;
  }

  public String getVehicleModel(){
    return vehicleModel;
  }
  public void setVehicleMake(String vehicleMake){
    this.vehicleMake = vehicleMake;
  }

  public String getVehicleMake(){
    return vehicleMake;
  }



  public void setVehicleType(String vehicleType){
    this.vehicleType = vehicleType;
  }

  public String getVehicleType(){
    return vehicleType;
  }
  
  public String getLocationId() {
        return locationId;
    }

    public void setLocationId(String locationId) {
        this.locationId = locationId;
    }


}
