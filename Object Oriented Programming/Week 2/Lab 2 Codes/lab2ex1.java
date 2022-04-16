public class lab2ex1{
    public static void main(String args[]){

        int yards = 385;
        double kilometers = 0,miles = 26;

        kilometers = (((miles * 1760) + yards)/1760) * 1.608;

        System.out.println("Kilometers:"+ kilometers + " kilometers");
    }
}