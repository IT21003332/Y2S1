import java.util.*;

public class ex4 {
	public static void main(String args[]){
		
		int date;
		String day;

		Scanner input = new Scanner(System.in);
		
		System.out.println("Please enter the Date: ");
		date = input.nextInt();

		switch(date){

			case 1: day = "Monday";
				break;
			case 2: day = "Tuesday";
				break;
			case 3: day = "Wednesday";
				break;
			case 4: day = "Thursday";
				break;
			case 5: day = "Friday";
				break;
			case 6: day = "Saturday";
				break;
			case 7 : day = "Sunday";
				break;
			default : day = "Invalid Input";
		}

			if(date > 0 && date < 8){
				System.out.println("Date: " + date);
				System.out.println("Day of the week: " + day);
				System.out.println("Good Bye!");
			}
			else {
				System.out.println("Invalid Range given.");
			}
	}
}
