
public class Student {
	
	private String name;
	private int ditno;
	private String address;
	
	
	public Student() {
		name = null;
		ditno = 0;
		address = null;
	}
	public Student(String name, int ditno, String address) {
		this.name = name;
		this.ditno = ditno;
		this.address = address;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public void setDitNo(int ditno) {
		this.ditno = ditno;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public int getDitNo() {
		return ditno;
	}
	public String getAddress() {
		return address;
	}
	public void display() {
		System.out.println("Name : " + name + "\nDepartmentIT No: " + ditno + "\naddress = " +address);
	}
	public String getDetails() {
		String info = "I am Student\n My name is " + name +"\nI am from " + address + "Dit NO: "+ ditno;
		return info;
	}
}
