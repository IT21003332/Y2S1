import java.util.*;
import java.io.*;

class AgeException extends Exception{
    AgeException(String message){
        super(message);
    }
}

class ageEx{
    public static void main(String args[])throws IOException{

        try{
            BufferedReader input = new BufferedReader(new InputStreamReader(System.in));

            System.out.println("Hello Advantis, Please enter your Age: ");
            int age = Integer.parseInt(input.readLine());

            if(age > 60){
                throw new AgeException("Age is over the threshold");
            }
        }catch(AgeException e){
            System.out.println("Exception Thrown");
            System.out.println(e.getMessage());
        }
    }
}