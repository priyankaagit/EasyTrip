package registerPackage;
public class Customer{
  Integer customerId;
  String firstName;
  String lastName;
  String emailId;
  String password;
  String phone;
  String licenseNo;
  String customerType;
 public Customer(){

 }
  public Customer(String firstName,String lastName,String emailId,String password,String phone,String licenseNo,String customerType){
    this.firstName = firstName;
    this.lastName = lastName;
    this.emailId = emailId;
    this.password = password;
    this.phone = phone;
    this.licenseNo = licenseNo;
    this.customerType = customerType;
  }


  public Customer(Integer customerId, String firstName, String lastName, String emailId, String password, String phone,
    String licenseNo,String customerType) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.emailId = emailId;
  this.password = password;
  this.phone = phone;
  this.licenseNo = licenseNo;
  this.customerId = customerId;
  this.customerType = customerType;

}

public Customer(Integer customerId, String firstName, String lastName, String emailId, String password, String phone,
    String licenseNo) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.emailId = emailId;
  this.password = password;
  this.phone = phone;
  this.licenseNo = licenseNo;
  this.customerId = customerId;
}

public int getCustomerId() {
		return customerId;
	}

	public void setCustomerid(Integer customerId) {
		this.customerId = customerId;
	}

  public void setFirstName(String firstName){
    this.firstName = firstName;
  }

  public String getFirstName(){
    return firstName;
  }

  public void setLastName(String lastName){
    this.lastName = lastName;
  }

  public String getLastName(){
    return lastName;
  }

  public void setEmailId(String emailId){
    this.emailId = emailId;
  }

  public String getEmailId(){
    return emailId;
  }
  public void setPassword(String password){
    this.password = password;
  }

  public String getPassword(){
    return password;
  }

  public void setLicenseNo(String licenseNo){
    this.licenseNo = licenseNo;
  }

  public String getLicenseNo(){
    return licenseNo;
  }

  public void setPhone(String phone){
    this.phone = phone;
  }

  public String getPhone(){
    return phone;
  }

  public void setCustomerType(String customerType){
    this.customerType = customerType;
  }

  public String getCustomerType(){
    return customerType;
  }

}
