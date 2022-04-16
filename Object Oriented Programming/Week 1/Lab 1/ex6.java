import java.util.*;

public class ex6 {
    public static void main(String args[]){
        int number = 0;
        Scanner input = new Scanner(System.in);

        System.out.printf("Please enter the number of rows :");
        number = input.nextInt();

        input.close();

        for(int i=0;i<number;i++){
            for(int j=number;j>i;j--){
                System.out.printf(" ");
            }
            for(int k=0;k<=i;k++){
                System.out.printf("* ");
            }
            System.out.printf("\t");
            for(int l=0;l<number;l++){
                System.out.printf("*");
            }
            System.out.println();
        }

    }
}
