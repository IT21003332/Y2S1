
public class Dog extends Pet{
	
	private int noOfMasters;
	
	public Dog(String n, String o, int a, int m) {
		super(n, o, a);
		this.noOfMasters = m;
	}
	public Dog(String n, String o) {
		super(n, o);
	}
	public void showDetails() {
		super.showDetails();
		System.out.println("Number of Masters: "+ this.noOfMasters);
	}
}
