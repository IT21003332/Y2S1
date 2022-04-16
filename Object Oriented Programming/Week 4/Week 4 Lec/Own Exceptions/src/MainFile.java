
public class MainFile {
	public static void main(String args[]) {
		
		try {	
			String id = "it21003332";	//intentionally creating an error to see how this works!
			if(!id.startsWith("IT")) {
				throw new InvalidStudentIdException("java.lang.Invalid Student ID"); //This throw is not throws 
			}
		}catch(InvalidStudentIdException e) {
			System.out.println(e);
		}
	}
}
