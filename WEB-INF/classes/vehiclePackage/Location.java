package vehiclePackage;

public class Location {
	Integer locationid;
	String locationName;
	String locationPin;
	String locationCity;
	String locationState;
	String locationCountry;
	String locationAddress;
	String locationHours;
	String locationPhone;
	
	public Location()
	{
		
	}

	public Location(Integer locationid, String locationName, String locationPin, String locationCity, String locationState,
			String locationCountry, String locationAddress, String locationHours, String locationPhone) {
		super();
		this.locationid = locationid;
		this.locationName = locationName;
		this.locationPin = locationPin;
		this.locationCity = locationCity;
		this.locationState = locationState;
		this.locationCountry = locationCountry;
		this.locationAddress = locationAddress;
		this.locationHours = locationHours;
		this.locationPhone = locationPhone;
	}

	public Location(String locationName, String locationPin, String locationCity, String locationState,
			String locationCountry, String locationAddress, String locationHours, String locationPhone) {
		super();

		this.locationName = locationName;
		this.locationPin = locationPin;
		this.locationCity = locationCity;
		this.locationState = locationState;
		this.locationCountry = locationCountry;
		this.locationAddress = locationAddress;
		this.locationHours = locationHours;
		this.locationPhone = locationPhone;
	}

	public Integer getLocationid() {
		return locationid;
	}

	public void setLocationid(Integer locationid) {
		this.locationid = locationid;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getLocationPin() {
		return locationPin;
	}

	public void setLocationPin(String locationPin) {
		this.locationPin = locationPin;
	}

	public String getLocationCity() {
		return locationCity;
	}

	public void setLocationCity(String locationCity) {
		this.locationCity = locationCity;
	}

	public String getLocationState() {
		return locationState;
	}

	public void setLocationState(String locationState) {
		this.locationState = locationState;
	}

	public String getLocationCountry() {
		return locationCountry;
	}

	public void setLocationCountry(String locationCountry) {
		this.locationCountry = locationCountry;
	}

	public String getLocationAddress() {
		return locationAddress;
	}

	public void setLocationAddress(String locationAddress) {
		this.locationAddress = locationAddress;
	}

	public String getLocationHours() {
		return locationHours;
	}

	public void setLocationHours(String locationHours) {
		this.locationHours = locationHours;
	}

	public String getLocationPhone() {
		return locationPhone;
	}

	public void setLocationPhone(String locationPhone) {
		this.locationPhone = locationPhone;
	}

}
