package utilityClasses;

import java.util.ArrayList;
import java.util.List;
import java.util.LinkedHashMap;
import java.io.*;
import java.util.*;

public class DealMatches implements java.io.Serializable {
	
	LinkedHashMap<String, Promotion> selectedPromotions;
	
	LinkedHashMap<String, Promotion> allPromotions;
	
	ArrayList<String> tweets = new ArrayList<String>();
	
	public ArrayList<String> getTweets()
	{
		return tweets;
	}
	
	public LinkedHashMap<String, Promotion> getselectedPromotionsFromTweets()
	{
		selectedPromotions = new LinkedHashMap<String, Promotion>();
		
		allPromotions = MySQLDataStoreUtilitiesMohammed.getPromotionsFromMySQL();
		
		tweets = new ArrayList<String>();
		
		String line=null;
		
		try
		{
			for(Map.Entry<String, Promotion> entry: allPromotions.entrySet())
			{
				Promotion promotion = entry.getValue();
				
				if(selectedPromotions.size()<10 && !selectedPromotions.containsKey(entry.getKey()))
				{
					BufferedReader reader = new BufferedReader(new FileReader(new File("C:\\apache-tomcat-7.0.34\\webapps\\easytrip\\DealMatches.txt")));
					
					line = reader.readLine();
					
					if(line==null)
					{
						
					}
					
					else
					{
						do{
							if(line.contains(promotion.getPercentageOff()) && !tweets.contains(line))
							{
								tweets.add(line);
								selectedPromotions.put(entry.getKey(), entry.getValue());
								//System.out.println("Tweet: " + line);
								//System.out.println("Promotion: " + entry.getKey());
								break;
							}
							
						}while ((line=reader.readLine()) != null);
					}
				
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return selectedPromotions;
		
	}
	
	public static void main(String args[]){
		
		DealMatches dm = new DealMatches();
		
		dm.getselectedPromotionsFromTweets();
		
		
	}

}
