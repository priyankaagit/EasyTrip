package reservationPackage;

public class Account {
  Integer bookingId;
  String cardName;
  String cardNum;
  String cardType;
  String expirationMonth;
  String expirationYear;
  String cvv;
  String email;
  String address1;
  String address2;
  String city;
  String country;
  String zip;
  String phoneNumber;

public  Account(){}

  public Account(Integer bookingId,String cardName,String cardNum,String cardType,String expirationMonth,String expirationYear,
  String cvv,String address1,String address2,String city,String country,String zip,String phoneNumber){
    this.bookingId = bookingId;
    this.cardName = cardName;
    this.cardNum = cardNum;
    this.cardType = cardType;
    this.expirationMonth = expirationMonth;
    this.expirationYear = expirationYear;
    this.cvv = cvv;
    this.address1 = address1;
    this.address2 = address2;
    this.city = city;
    this.country = country;
    this.zip = zip;
    this.phoneNumber = phoneNumber;

  }

  public Integer getBookingId(){
    return bookingId;
  }
public  String getCardName(){
    return cardName;
  }
public   String getCardNum(){
    return cardNum;
  }
public   String getCardType(){
    return cardType;
  }
public   String getExpirationMonth(){
        return expirationMonth;
      }
public   String getExpirationYear(){
        return expirationYear;
      }
public   String getCvv(){
      return cvv;
     }
public   String getAddress1(){
        return address1;
        }
public   String getAddress2(){
        return address2;
        }

public   String getCity(){
return city;
}
public   String getCountry(){
return country;
}
public   String getZip(){
return zip;
}

  public   String getPhoneNumber(){
          return phoneNumber;
          }
}
