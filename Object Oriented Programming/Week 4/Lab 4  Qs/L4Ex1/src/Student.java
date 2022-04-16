
public class Student {
	
	protected int studentID;
	protected static int max = 100;
	protected String name;
	protected String degree;
	protected String mobile;
	
	public Student(String name, String degree, String mobile) {
		this.name = name;
		this.degree = degree;
		this.mobile = mobile;
		this.studentID = Student.getNextStudentId(); // we can assign a static incrementor to the id;
	}
	public void print() {
		System.out.println("Name: " + this.name + "\nDegree: " + this.degree + "\nMobile: " + this.mobile);
		System.out.println("StudentID: " + this.studentID);
	}
	
	//getters 
	public String getName() {
		return this.name;
	}
	public String getDegree() {
		return this.degree;
	}
	public String getMobile() {
		return this.mobile;
	}
	
	//setters
	public void setName(String name) {
		this.name = name;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	//public methods 
	public static int getNextStudentId() {
		max++;
		return max;
	}
	
}
 