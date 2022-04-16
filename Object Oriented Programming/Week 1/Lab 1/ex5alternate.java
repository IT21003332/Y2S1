import java.util.*;
public class ex5alternate{
   public static void main(String[] args){
      Scanner my_scan = new Scanner(System.in);
      System.out.println("Enter the number of rows which needs to be printed");
      int my_row = my_scan.nextInt();
      for (int i = 1; i <= my_row; i++){
         for (int j = my_row; j >= i; j--){
            System.out.print(" ");
         }
         for (int j = 1; j <= i; j++){
            System.out.print("* ");
         }
         System.out.println();
      }
   }
}