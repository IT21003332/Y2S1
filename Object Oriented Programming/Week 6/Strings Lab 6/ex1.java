public class ex1{
    public static void main(String args[]){

        String literal = "Hello Literal";
        char arr[] = {'a','r','r','a','y'};
        String s = new String("Hello Object ");
        System.out.println(s.concat(literal));

        s.replace('H','y');
        System.out.println(s.concat(literal));  //Here the replace doesnt work because Strings are immutable
                            // The only method to change the String is to use StringBuffer or StringBuilder

        //length() returns the length of the String 
        //concat() can be used to concatenate two Strings together 
     
        System.out.println(s.toUpperCase());
        //toUpperCase() turns the entire String to uppercase 
        //charAt() returns the value of the passed index

        //lastIndexOf returns the value of the last index of the String

        //substring() gives the values of the indexes of a given range in a String(passes two arguments to assign starting and ending indices)
        //  endsWith()	Checks whether a string ends with the specified character(s) THIS RETURNS A BOOLEAN TYPE 
        //trim()	Removes whitespace from both ends of a string
        char newArray[] = s.toCharArray();
        System.out.println(newArray);

        StringBuffer buffer = new StringBuffer("Hello My Name is Billy Baloon Head");
        System.out.println("ByPassed Content concatenated to " + buffer);
        

    }
}