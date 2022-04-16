//Exercise3 alternative from arrays 

import java.util.*;

public class exercise3alt{
    public static void main(String args[]){

        int[] num = {0,0,0};
        Scanner input = new Scanner(System.in);
        
        for(int i=0;i<3;i++){
            System.out.println("Please enter Number " + i + ": ");
            num[i] = input.nextInt();
        }

        Arrays.sort(num);

        System.out.println("Max: "+ num[2] + "\nMin: "+num[0]);

    }
}