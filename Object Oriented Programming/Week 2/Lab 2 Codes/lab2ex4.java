import java.io.*;
import java.util.*;


public class lab2ex4 {
    public static void main(String args[]){
        //using console
        Console console = System.console();
        if(console == null)
        {
            System.out.println("No console: not in interactive mode!");
            System.exit(0);
        }
        System.out.println("Please enter the length:");
        int length = Integer.parseInt(console.readLine());

        System.out.println("Please enter the width:");
        int width = Integer.parseInt(console.readLine());
        System.out.println("Please enter the height:");
        int height = Integer.parseInt(console.readLine());

        int volume = 0;
        volume = length * width * height;

        System.out.println("Volume is  : " + volume);

    }
}
