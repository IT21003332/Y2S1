import java.util.*;

public class ex3{
	public static void main(String args[]){
		Scanner input = new Scanner(System.in);

		int age;
	
		System.out.println("Please enter the age: ");
		age = input.nextInt();
	
		if(age > 18){
			System.out.println("Adult");
		}
		else {
			System.out.println("Child");
		}
		input.close();
	}
}
			
		