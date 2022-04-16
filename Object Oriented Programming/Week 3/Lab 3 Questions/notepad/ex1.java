class Student {
    private String name;
    private int ditNo;
    private String address;

    public Student(String name,int ditNo,String address){
        this.name = name;
        this.ditNo = ditNo;
        this.address = address;
    }

    public void display(){
        System.out.println("Name: " + name+ "\nditNo: " + ditNo + "Address: " + address);
    }
}

class Test{

    private Student st1 = new Student("Upul",456,"Colombo");
    private Student st2 = new Student("Ruvin",458,"Gampaha");

    public Test(){};
    public void display1(){
        st1.display();
        st2.display();
    }
}

public class ex1{
    public static void main(String args[]){

        Test t1 = new Test();
        t1.display1();
    }
}