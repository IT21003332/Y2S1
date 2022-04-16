
public class PartTimeStudent extends Student{
	
	private double workingHours;
	

	public PartTimeStudent(String name,String address,int StudentId,double workingHours) {
		super(name,address,StudentId);
		this.workingHours = workingHours;
	}
	public void showDetails() {
		super.showDetails();
		System.out.println("Working Hours = " + this.workingHours);
	}
}
