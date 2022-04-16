package buffer;

public class buffer {
	public static void main(String args[]) {
		
		StringBuffer sb = new StringBuffer("Java StringBuffer Reverse Example");
		System.out.println("Original StringBuffer Content" + sb);
		
		sb.reverse();
		System.out.println("Reversed StringBuffer Content: " + sb);
	}
}
