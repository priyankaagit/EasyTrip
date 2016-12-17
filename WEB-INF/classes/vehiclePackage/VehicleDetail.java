package vehiclePackage;


public class VehicleDetail {
    
    String vin;
    String id;
    String image;
    String type;
    String make;
    String model;
    String locationId;
    String price;
    String mileage;
    Integer passengers;
    Integer smallLuggage;
    Integer largeLuggage;
    String transmission;

    public VehicleDetail() {
        
    }
    
    public VehicleDetail(String vin, String image, String type, String make, String locationId, String price, String mileage, Integer passengers, Integer smallLuggage, Integer largeLuggage, String transmission) {
        this.vin = vin;
        this.image = image;
        this.type = type;
        this.make = make;
        this.locationId = locationId;
        this.price = price;
        this.mileage = mileage;
        this.passengers = passengers;
        this.smallLuggage = smallLuggage;
        this.largeLuggage = largeLuggage;
        this.transmission = transmission;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getLocationId() {
        return locationId;
    }

    public void setLocationId(String locationId) {
        this.locationId = locationId;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getMileage() {
        return mileage;
    }

    public void setMileage(String mileage) {
        this.mileage = mileage;
    }

    public Integer getPassengers() {
        return passengers;
    }

    public void setPassengers(Integer passengers) {
        this.passengers = passengers;
    }

    public Integer getSmallLuggage() {
        return smallLuggage;
    }

    public void setSmallLuggage(Integer smallLuggage) {
        this.smallLuggage = smallLuggage;
    }

    public Integer getLargeLuggage() {
        return largeLuggage;
    }

    public void setLargeLuggage(Integer largeLuggage) {
        this.largeLuggage = largeLuggage;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }
        
}
