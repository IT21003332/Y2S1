import java.util.*;
public class ex5alt {
    public static void main(String args[]){

        int number = 0;
        Scanner input = new Scanner(System.in);

        System.out.println("Please enter the Number: ");
        number = input.nextInt();

        input.close();
        for(int count = 0;count < number;count++){
            
            for(int j = 0;j<number;j++){
                System.out.print("*");
            }
            System.out.println();
        }
        System.out.println();
        for(int i =0;i<number;i++){
            for(int j=number;j>i;j--){
                System.out.print(" ");
            }
            for(int k = 0;k<i;k++){
                System.out.print("* ");
            }
            System.out.println();
        }

    }
}