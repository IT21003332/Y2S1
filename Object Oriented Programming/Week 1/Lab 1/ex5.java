import java.util.*;

public class ex5{
	public static void main(String args[]){
		
		int number,i=0,j=0;
		Scanner input = new Scanner(System.in);
	
	System.out.print("Please enter the amt of rows figures and columns needed: ");
	number = input.nextInt();

	while(j < number){
		j++;
		while(i < number){
			i++;		
			System.out.print("*");
			
		}
		System.out.println();
		
	}
	input.close();
	}
}

//This method is not working 
	
	 