class person{
	
	private String name;
	private int age;
	private double sal;
	
	public person() {
		name = null;
		age = 0;
		sal = 0;
	}
	public person(String name,int age,double sal) {
		this.name = name;
		this.age = age;
		this.sal = sal;
	}
	
	public void show() {
		System.out.println("Name: " + name + "\nAge: " + age + "\nSalary: " + sal);
	}	//This is casual
	
	public void show1(person x) {
		System.out.println("Name: " + x.name + "\nAge: " + x.age + "\nSalary: " + x.sal);
	}	//This is a method to show the pass by reference usage
	
	//In this method, we can pass an object as a reference as the argument. WHEN AN OBJECT IS CREATED, its information is stored in 
		//memory and it has a memory address. when you pass the object as an argument. The memory address will be called, but for the
	//variables to be called out. method should call the object's properties inside the method. Eg: "x.name"
	
}

public class MainFile {
	public static void main(String args[]) {
		
		person p1 = new person("Devindu",45,45000.0);
		
		//p1.show();
		person p2 = new person();
		
		p2.show1(p1);
		
	}
}
