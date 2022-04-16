import java.util.*;

class EvenOddNumbers{
	
  private int number;
  
  public EvenOddNumbers(int number){
	this.number = number;
  }
  public boolean findEvenOrOdd(int number){
	
	if(number % 2 == 0){
		return true;
	}
	else {
		return false;
	}
  }
}

public class lab2ex5 {
	public static void main(String args[]){
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("Please enter a number: ");
		int num = scanner.nextInt();
		
		EvenOddNumbers num1 = new EvenOddNumbers(num);
		
		boolean evenOdd = num1.findEvenOrOdd(num);
		
		if(evenOdd == true){
			System.out.println("Number assigned is Even");
		}
		else {
			System.out.println("Number assigned is Odd");
		}
	}
}