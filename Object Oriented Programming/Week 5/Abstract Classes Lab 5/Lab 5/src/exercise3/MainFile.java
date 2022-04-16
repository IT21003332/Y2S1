package exercise3;
import java.util.*;
import java.util.InputMismatchException;
//Lab Sheet on Try Catch Blocks

public class MainFile {
	public static void main(String[] args) {
	
	   int maxSubjects;
	   int [] marks = new int[5];
	   int total = 0;
	   double avg;
	   
	   try {
	   // 1. Input a value for maxSubjects
	   //    from keyboard
		   
	// 2. Using a for loop 
	//    input marks 
		   Scanner input = new Scanner(System.in);
		   
		   System.out.println("Please enter the max Subject count: ");
		   maxSubjects = input.nextInt();
		   for(int i = 0;i <maxSubjects;i++) {
			  System.out.println("Please enter marks of Exam " + (i+1) + ": ");
			 marks[i]  = input.nextInt();
			  total = total + marks[i];
		   }
			  // 3. Calculate the avg marks
			  avg = total / marks.length;
			  System.out.println("Average: " + avg);
			  
		   }

		   
	   

	   
	  
	   
	   // 4. Use a try catch block to
	   //    prevent the following 
	   //    run time errors
	   
	   //   (a) Input valid integers to the 
	   //         inputs
	   //   (b) ArithmeticException division
	   //        by zero
	   //   (c) ArrayIndexOutOfBounds
	   //         Exception
	   
	    catch (InputMismatchException e) {
	    	System.out.println(e+ " Please enter an Integer for the Index");
	   }
	   catch(ArithmeticException e) {
		   System.out.println(e + " Number cannot be divisible by Zero");
	   }
	   catch(ArrayIndexOutOfBoundsException e) {
		   System.out.println(e + "Enter a value less than 5 for the index");
	   }
	   catch(Exception e) {
		   System.out.println("Unknown Error has occured!");
	   }
	   finally {
	      System.out.println("This code will be gurrentied to run");
	   }
	 
	   System.out.println("The end");
	
	}
}