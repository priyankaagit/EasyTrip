
package utilityClasses;


public class Promotion {
    
    String promoCode;
    String percentageOff;
    String validTillDate;

    public Promotion(String promoCode, String percentageOff, String validTillDate) {
        this.promoCode = promoCode;
        this.percentageOff = percentageOff;
        this.validTillDate = validTillDate;
    }

    public Promotion() {
    }

    public String getPromoCode() {
        return promoCode;
    }

    public void setPromoCode(String promoCode) {
        this.promoCode = promoCode;
    }

    public String getPercentageOff() {
        return percentageOff;
    }

    public void setPercentageOff(String percentageOff) {
        this.percentageOff = percentageOff;
    }

    public String getValidTillDate() {
        return validTillDate;
    }

    public void setValidTillDate(String validTillDate) {
        this.validTillDate = validTillDate;
    }
    
    
    
}
