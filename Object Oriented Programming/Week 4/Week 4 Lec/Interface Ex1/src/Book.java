
public class Book implements Printable {

	String name;
	int ISBN;
	
	public Book(String name, int ISBN) {
		this.name = name;
		this.ISBN = ISBN;
	}
	public void print() {
		System.out.println("Name of the Book: " + this.name + "\nISBN: " + this.ISBN);
	}
	
}
