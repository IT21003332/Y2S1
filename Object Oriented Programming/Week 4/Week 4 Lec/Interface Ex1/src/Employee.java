
public class Employee implements Printable {

	String eName;
	int eId;
	
	public Employee(String eName, int eId) {
		this.eName = eName;
		this.eId = eId;
	}
	public void print() {
		System.out.println("Employee Name: " + this.eName + "\nEID: " + this.eId);
	}
}
