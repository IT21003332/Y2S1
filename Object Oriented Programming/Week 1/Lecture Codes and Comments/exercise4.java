//Exercise 4 - write a program to input 10 numbers from keyboard and find how many odd and even numbers are there
import java.util.*;

public class exercise4{
    public static void main(String args[]){ //Beginning the main method of the class 

        int number,odd = 0,even = 0;
        Scanner input = new Scanner(System.in);
        for(int i = 0;i < 10;i++)
        {
            System.out.println("Please enter Number " + (i+1) + ":");
            number = input.nextInt();
            
            if(number % 2 == 0){
                even ++;
            }
            else {
                odd ++;
            }
        }
        System.out.println("Even: " + even + "\n odd: " + odd);
    } //end method 
} //end class 