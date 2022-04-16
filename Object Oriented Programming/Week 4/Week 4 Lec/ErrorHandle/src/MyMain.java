
import java.io.BufferedReader;
import java.io.IOException;
import java.io.IOError;
import java.io.InputStreamReader;

public class MyMain {
	public static void main(String args[]) throws IOException {
		
		String name = "Devindu Samarasinghe";
		
		Integer.parseInt(name); //In this case you can clearly see these are 
								//letters that need to be converted. therefore there will be
						// a runtime error
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		br.readLine();
		br.close();
	}
}
