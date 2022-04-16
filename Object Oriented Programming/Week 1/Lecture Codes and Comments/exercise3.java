//Exercise 3 - Write a program to get 3 integers and print the largest and smallest of the 3 numbers entered 
import java.util.*;

public class exercise3{
    public static void main(String args[]){ // Main object function call 
        
        int a,b,c,max,min; //Declaring variables 
        
        Scanner myScanner = new Scanner(System.in); //Establish an object for the input scanner
        System.out.println("Please enter the first Number: ");
        a = myScanner.nextInt();
        System.out.println("Please enter the Second Number: ");
        b = myScanner.nextInt();
        System.out.println("Please enter the Third Number: ");
        c = myScanner.nextInt();

        if(a > b) {
            max = a;
            min = b;
        }
        else {
            min = a;
            max = b;
        }

        if(c > max){
            max = c;
        }
        else if(c < min){
            min = c;
        }

        System.out.println("Max : " + max +  "\nMin : " + min);
    }
}

