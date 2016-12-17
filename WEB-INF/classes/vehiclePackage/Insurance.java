package vehiclePackage;
public class Insurance{
Integer insuranceNumber;
String insuranceName;
String insuranceType;
double costCovered;
String insuranceCompany;
double insurancePrice;

public Insurance(){}
public Insurance(String insuranceName,String insuranceType,double costCovered,String insuranceCompany,double insurancePrice){

this.insuranceName = insuranceName;
this.insuranceType = insuranceType;
this.costCovered = costCovered;
this.insuranceCompany = insuranceCompany;
this.insurancePrice = insurancePrice;

}

public Insurance(Integer insuranceNumber,String insuranceName,String insuranceType,double costCovered,String insuranceCompany,double insurancePrice){
this.insuranceNumber = insuranceNumber;
this.insuranceName = insuranceName;
this.insuranceType = insuranceType;
this.costCovered = costCovered;
this.insuranceCompany = insuranceCompany;
this.insurancePrice = insurancePrice;

}


  public void setInsuranceNumber(Integer insuranceNumber){
    this.insuranceNumber = insuranceNumber;
  }

  public Integer getInsuranceNumber(){
    return insuranceNumber;
  }


  public void setInsuranceName(String insuranceName){
    this.insuranceName = insuranceName;
  }

  public String getInsuranceName(){
    return insuranceName;
  }

  public void setInsuranceType(String insuranceType){
    this.insuranceType = insuranceType;
  }

  public String getInsuranceType(){
    return insuranceType;
  }

  public void setCostCovered(Integer costCovered){
    this.costCovered = costCovered;
  }

  public double getCostCovered(){
    return costCovered;
  }
  public void setInsuranceCompany(String insuranceCompany){
    this.insuranceCompany = insuranceCompany;
  }



  public String getInsuranceCompany(){
    return insuranceCompany;
  }

  public void setInsurancePrice(double insurancePrice){
    this.insurancePrice= insurancePrice;
  }
  public double getInsurancePrice(){
    return insurancePrice;
  }





}
