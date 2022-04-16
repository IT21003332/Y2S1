//find the perimeter from two inputs 
import java.util.*;
public class exercise2note{
    public static void main(String args[]){

        int length,width,perimeter,area;
        String name;

        Scanner input = new Scanner(System.in);
        System.out.println("Please enter your Name:");
        name = input.nextLine();

        System.out.println("Please enter the length: ");
        length = input.nextInt();

        System.out.println("Please enter the width: ");
        width = input.nextInt();

        perimeter = 2*(length + width);
        area = length* width;

        System.out.println("Your Name: " + name + "\n Area: " + area + "\nPerimeter: " + perimeter);
    }
}