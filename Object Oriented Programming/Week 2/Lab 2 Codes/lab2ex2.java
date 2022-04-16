import java.util.*;

public class lab2ex2{
    public static void main(String args[]){

        Scanner sc = new Scanner(System.in);

        String firstName,sID,district;

        System.out.println("Please enter your First Name: ");
        firstName = sc.next();
        System.out.println("Please enter your ID: ");
        sID = sc.next();
        System.out.println("Please enter your district: "); 
        district = sc.next();
        System.out.print("SID: " + sID+ "\n" + "Name: " + firstName + "\n" + "District: " + district);

        sc.close();
        
    }
}