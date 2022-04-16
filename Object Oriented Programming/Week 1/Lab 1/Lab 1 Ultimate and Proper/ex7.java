import java.util.*;

public class ex7{
	public static void main(String args[]){

	int a,b;
	float sum = 0,average;
	Scanner input = new Scanner(System.in);
	System.out.print("Please enter the first Number: ");
	a = input.nextInt();
	System.out.print("Please enter the Second Number: ");
	b = input.nextInt();

	sum = a + b;
	average = (a+b) /2;
	
	System.out.println("Sum = " + sum + "\tAverage = " + average);	
	
	}
}