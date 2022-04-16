import java.io.*;

public class BufferReader{
	public static void main(String args[])throws IOException{
		
		BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
		String text = ""; 
		System.out.println("Please enter an integer value: ");
		text = input.readLine(); 
		int num = Integer.parseInt(text);
		System.out.println("You inserted " + num);
	}
}