import java.io.*;

public class lab2ex4alt {
    public static void main(String args[]) throws IOException{

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        System.out.println("Please enter your name : ");
        String name = reader.readLine();
        int length, width, height,volume;

        System.out.println("Please enter the length");
        length = Integer.parseInt(reader.readLine());
        System.out.println("Please enter the height");
        height = Integer.parseInt(reader.readLine());
        System.out.println("Please enter the width");
        width = Integer.parseInt(reader.readLine());

        volume = length * width * height;

        System.out.println("Your Name : " + name + "\nVolume: "+ volume);
    }
    
}
