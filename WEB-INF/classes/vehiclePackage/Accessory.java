package vehiclePackage;
public class Accessory{
Integer accId;
String accName;
String accCompany;
Integer totalNumber;
Integer availableNumber;
double hourPrice;

public Accessory(Integer accId, String accName, String accCompany,Integer totalNumber, Integer availableNumber, double hourPrice) {
  this.accId = accId;
  this.accName = accName;
  this.accCompany = accCompany;
  this.totalNumber = totalNumber;
  this.availableNumber = availableNumber;
  this.hourPrice = hourPrice;

}


public Accessory(String accName,String accCompany,Integer totalNumber,Integer availableNumber,double hourPrice){

this.accName = accName;
this.accCompany = accCompany;
this.totalNumber = totalNumber;
this.availableNumber = availableNumber;
this.hourPrice = hourPrice;

}


  public void setAccId(Integer accId){
    this.accId = accId;
  }

  public Integer getAccId(){
    return accId;
  }


  public void setAccName(String accName){
    this.accName = accName;
  }

  public String getAccName(){
    return accName;
  }

  public void setAccCompany(String accCompany){
    this.accCompany = accCompany;
  }

  public String getAccCompany(){
    return accCompany;
  }

  public void setTotalNumber(Integer totalNumber){
    this.totalNumber = totalNumber;
  }

  public Integer getTotalNumber(){
    return totalNumber;
  }
  public void setAvailableNumber(Integer availableNumber){
    this.availableNumber = availableNumber;
  }



  public void setHourPrice(double hourPrice){
    this.hourPrice = hourPrice;
  }

  public double getHourPrice(){
    return hourPrice;
  }


  	public Integer getAvailableNumber() {
  		return  availableNumber;
  	}




}
