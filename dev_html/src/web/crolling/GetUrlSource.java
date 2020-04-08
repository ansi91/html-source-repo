package web.crolling;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sun.java_cup.internal.runtime.Scanner;

public class GetUrlSource {
	  public static void main(String[] args) {
	    System.out.println("URL을 입력하면 해당 웹페이지의 소스를 출력합니다. ");
	    System.out.print("URL(http://포함)=>");
	   java.util.Scanner scanner = new java.util.Scanner(System.in);
	   
	    String inputUrl = scanner.nextLine();
	    
	    try {
	      URL url = new URL(inputUrl);      
	      InputStreamReader reader = new InputStreamReader(url.openStream());
	      BufferedReader br = new BufferedReader(reader);
	      /*①*/
	      StringBuilder contents = new StringBuilder();
	      /*②*/
	      String inLine ="";
	      while((inLine = br.readLine())!=null){
	        contents.append(inLine);
	      }      
	      br.close();      
	      
	      System.out.println("HTML소스출력");
	      System.out.println(contents);
	    }
	    catch (Exception e) {
	      System.out.println("예외가 발생하였습니다.");
		}
	  }
	}