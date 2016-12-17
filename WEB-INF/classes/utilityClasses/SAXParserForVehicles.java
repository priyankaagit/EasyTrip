/*********
http://www.saxproject.org/
The following URL from Oracle is the JAVA documentation for the API
https://docs.oracle.com/javase/7/docs/api/org/xml/sax/helpers/DefaultHandler.html
*********/
package utilityClasses;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.util.*;
import java.io.*;

import vehiclePackage.*;

////////////////////////////////////////////////////////////

/**************

SAX parser use callback function  to notify client object of the XML document structure. 
You should extend DefaultHandler and override the method when parsin the XML document

***************/

////////////////////////////////////////////////////////////

public class SAXParserForVehicles extends DefaultHandler {
	
	VehicleDetail vehicleDetail;
	Vehicle vehicle;
	VehicleInfo vehicleInfo;
	
	LinkedHashMap<String,VehicleDetail> vehicleDetails;
	LinkedHashMap<String,Vehicle> vehicles;
	LinkedHashMap<String,VehicleInfo> vehicleInfos;
	
	
	String vehicleDetailsXmlFileName = "C:/apache-tomcat-7.0.34/webapps/easytrip/VehicleCatalog.xml";
    String elementValueRead;
	int v=1;
	
	public SAXParserForVehicles()
	{
		loadDataStore();
	}
	
    private void loadDataStore() {
        
		vehicleDetails = new LinkedHashMap<String,VehicleDetail>();
		vehicles = new LinkedHashMap<String,Vehicle>();
		vehicleInfos = new LinkedHashMap<String,VehicleInfo>();
		
		parseDocument(vehicleDetailsXmlFileName);
    }
	
	public LinkedHashMap<String,VehicleDetail> getVehicleDetailsHashMap()
	{
		return vehicleDetails;
	}
	
	//Call this method to get data from VehicleCatalog xml file related to the MySQL table vehicles.
	//It will give data for all columns of vehicles table in MySQL
	public LinkedHashMap<String,Vehicle> getVehiclesHashMap()
	{
		return vehicles;
	}
	
	//Call this method to get data from VehicleCatalog xml file related to the MySQL table vehicle_info.
	//It will give data for all columns of vehicle_info table in MySQL
	public LinkedHashMap<String,VehicleInfo> getVehicleInfosHashMap()
	{
		return vehicleInfos;
	}
	
	//********************Testing Methods********************
	
	private void printVehicleDetails()
	{
		for(Map.Entry<String,VehicleDetail> m :vehicleDetails.entrySet())
		{
			System.out.println(m.getKey());
			VehicleDetail s = m.getValue();
			System.out.println("\t Vin : "+s.getVin());
			System.out.println("\t Id : "+s.getId());
			System.out.println("\t Type : "+s.getType());
			System.out.println("\t Make : "+s.getMake());
			System.out.println("\t Model : "+s.getModel());
		}	
	}
	
	private void printVehicles()
	{
		for(Map.Entry<String,Vehicle> m :vehicles.entrySet())
		{
			System.out.println(m.getKey());
			Vehicle s = m.getValue();
			System.out.println("\t Vin : "+s.getVehicleVin());
			System.out.println("\t Id : "+s.getVehicleId());
			System.out.println("\t Type : "+s.getVehicleType());
			System.out.println("\t Make : "+s.getVehicleMake());
			System.out.println("\t Model : "+s.getVehicleModel());
			System.out.println("\t Location : "+s.getLocationId());
		}	
	}
	
	private void printVehicleInfos()
	{
		for(Map.Entry<String,VehicleInfo> m :vehicleInfos.entrySet())
		{
			System.out.println(m.getKey());
			VehicleInfo s = m.getValue();
			System.out.println("\t Id : "+s.getVehicleId());
			System.out.println("\t Mileage : "+s.getVehicleMilage());
			System.out.println("\t Passenger : "+s.getVehiclePassenger());
			System.out.println("\t Small Luggage : "+s.getVehicleSLuggage());
			System.out.println("\t Large Luggage : "+s.getVehicleLLuggage());
			System.out.println("\t Transmission : "+s.getVehicleTransmission());
			System.out.println("\t Price : "+s.getVehiclePrice());
			System.out.println("\t Image path : "+s.getVehicleImage());
		}	
	}
	
	//*******************Testing Methods End****************************
	

    private void parseDocument(String xmlFileName) {
		
        SAXParserFactory factory = SAXParserFactory.newInstance();
        try {
            SAXParser parser = factory.newSAXParser();
			File f = new File(xmlFileName);
			parser.parse(f, this);
            //parser.parse(xmlFileName, this);
        } catch (ParserConfigurationException e) {
            System.out.println("ParserConfig error");
        } catch (SAXException e) {
            System.out.println("SAXException : xml not well formed");
        } catch (IOException e) {
            System.out.println("IO error");
        }
    }
	
////////////////////////////////////////////////////////////

/*************

There are a number of methods to override in SAX handler  when parsing your XML document :

    Group 1. startDocument() and endDocument() :  Methods that are called at the start and end of an XML document. 
    Group 2. startElement() and endElement() :  Methods that are called  at the start and end of a document element.  
    Group 3. characters() : Method that is called with the text content in between the start and end tags of an XML document element.

There are few other methods that you could use for notification for different purposes, check the API at the following URL:

https://docs.oracle.com/javase/7/docs/api/org/xml/sax/helpers/DefaultHandler.html

***************/

////////////////////////////////////////////////////////////



    @Override
    public void startElement(String str1, String str2, String elementName, Attributes attributes) throws SAXException {

        if (elementName.equalsIgnoreCase("vehicle")) {
			
            vehicleDetail = new VehicleDetail();
			vehicle = new Vehicle();
			vehicleInfo = new VehicleInfo();
			
			vehicleDetail.setVin(attributes.getValue("vin"));
            vehicleDetail.setId(attributes.getValue("id"));
			
			vehicle.setVehicleVin(attributes.getValue("vin"));
            vehicle.setVehicleId(attributes.getValue("id"));
			
            vehicleInfo.setVehicleId(attributes.getValue("id"));
			
        }
		
    }

    @Override
    public void endElement(String str1, String str2, String element) throws SAXException {
 
		 
        if (element.equals("vehicle")) {
			vehicleDetails.put("V"+v, vehicleDetail);
			
			vehicles.put("V"+v, vehicle);
			vehicleInfos.put("V"+v, vehicleInfo);
			
			v++;
			
	    return;
        }
        if (element.equalsIgnoreCase("image")) {
            vehicleDetail.setImage(elementValueRead);
			
			
			vehicleInfo.setVehicleImage(elementValueRead);
	
	    return;
        }
        if (element.equalsIgnoreCase("type")) {
            vehicleDetail.setType(elementValueRead);
			
			vehicle.setVehicleType(elementValueRead);
	
	    return;
        }
		if (element.equalsIgnoreCase("make")) {
            vehicleDetail.setMake(elementValueRead);
			
			vehicle.setVehicleMake(elementValueRead);
		
	    return;
        }
		if (element.equalsIgnoreCase("model")) {
            vehicleDetail.setModel(elementValueRead);
			
			vehicle.setVehicleModel(elementValueRead);
	
	    return;
        }
		if(element.equalsIgnoreCase("locationId")){
            vehicleDetail.setLocationId(elementValueRead);
			
			vehicle.setLocationId(elementValueRead);
		
	    return;
        }
        if(element.equalsIgnoreCase("price")){
           vehicleDetail.setPrice(elementValueRead);
		
		   vehicleInfo.setVehiclePrice(Double.parseDouble(elementValueRead));
		  
	    return;
        }
		if(element.equalsIgnoreCase("mileage")){
            vehicleDetail.setMileage(elementValueRead);
		
			vehicleInfo.setVehicleMilage(elementValueRead);
			
	    return;
        }
		if(element.equalsIgnoreCase("passengers")){
            vehicleDetail.setPassengers(Integer.parseInt(elementValueRead));
		
			vehicleInfo.setVehiclePassenger(elementValueRead);
			
	    return;
        }
		if(element.equalsIgnoreCase("smallLuggage")){
            vehicleDetail.setSmallLuggage(Integer.parseInt(elementValueRead));
		
			vehicleInfo.setVehicleSLuggage(elementValueRead);
			
	    return;
        }
		if(element.equalsIgnoreCase("largeLuggage")){
            vehicleDetail.setLargeLuggage(Integer.parseInt(elementValueRead));
	
			vehicleInfo.setVehicleLLuggage(elementValueRead);
			
	    return;
        }
		if(element.equalsIgnoreCase("transmission")){
            vehicleDetail.setTransmission(elementValueRead);
	
			vehicleInfo.setVehicleTransmission(elementValueRead);
			
	    return;
        }
		
}	
		
    @Override
    public void characters(char[] content, int begin, int end) throws SAXException {
        elementValueRead = new String(content, begin, end);
		//System.out.println(elementValueRead);
    }
	
	
	public static void main(String[] args) {
		 SAXParserForVehicles sp = new SAXParserForVehicles();
         
		 //sp.printVehicleDetails();
		 //sp.printVehicles();
		 //sp.printVehicleInfos();
		 
    }
	
	
}
