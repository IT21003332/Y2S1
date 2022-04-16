import java.util.*;

public class ex6{
	public static void main(String args[]){
		
		int number = 0;
		Scanner input = new Scanner(System.in);

		System.out.print("Enter the number of rows: ");
		number = input.nextInt();

		for(int i=0;i<number;i++){
			for(int j=0; j<number; j++){
				System.out.print("*");
			}
				System.out.print("\t");
			for(int j = number;j > i;j--){
				System.out.print(" ");
			}
			for(int k = 0; k <= i ; k++){
				System.out.print("* ");
			}
			System.out.println();
		}
	}
}
		