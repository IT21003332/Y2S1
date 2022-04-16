import java.util.*;

public class ex5{
	public static void main(String args[]){
		
		int number,count = 0;
		Scanner input = new Scanner(System.in);

		System.out.print("Please enter the number of Rows: ");
		number = input.nextInt();

		while(count < 5){
			System.out.println("*****");
			count++;
		}
		
		for(int i = 0; i < number ; i++) {
			for(int j=number;j > i; j--) {
				System.out.printf(" "); 
			}
			for(int k = 0;k<i;k++){
				System.out.printf("* ");
			}
			System.out.println();
		}
	}		
}