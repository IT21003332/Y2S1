//This is inheritance 

class shape {
    protected String name;
    public shape(){};
    public shape(String tName){
        name = tName;
    }
    public void print(){
        System.out.println("\nThen name of the Shape is : " + name);
    }
    public int area(){return 0;}
}

class Rectangle expands shape{
    protected int width;
    protected int height;

    public Rectangle(String tName, int w, int h){
        super(tName);
        width = w;
        height = h;
    }
    public int area(){
        return height * width;
    }
}