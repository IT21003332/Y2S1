import java.util.Scanner;

public class lab2ex3{
    public static void main(String args[]){

        double length,width,height,cuboid;

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter the width: ");
        width = sc.nextDouble();
        System.out.print("Enter the length: ");
        length = sc.nextDouble();
        System.out.print("Enter the height: ");
        height = sc.nextDouble();

        cuboid = length * width * height;

        System.out.println("Volume of the cuboid is = " + cuboid);
        sc.close();

        
    }
}