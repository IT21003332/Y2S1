import java.util.*;

public class ex7{
	public static void main(String args[]){
		
		int count;
		float avg,sum = 0,num;
		Scanner input = new Scanner(System.in);
		System.out.printf("How many numbers do you wish to add? : ");
		count = input.nextInt();

		for(int i=0;i<count;i++){
			System.out.printf("Please enter number " + (i+1) +":");
			num = input.nextInt();
			
			sum += num;
		}
		
		avg = sum / count;
		System.out.printf("Sum = " + sum + "\nAverage = " + avg);
	}
}