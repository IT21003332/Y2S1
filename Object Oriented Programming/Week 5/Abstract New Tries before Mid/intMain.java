interface printable{
    void print();
}

class Book implements printable{
    private int bookID;
    private String bookName;

    Book(int bookID, String bookName){
        this.bookID = bookID;
        this.bookName = bookName;
    }
    public void print(){
        System.out.println("BOOKID : " + bookID + "\nBookName: " + bookName);
    }
}

class intMain{
    public static void main(String args[]){

        printable sevenHs = new Book(1452,"Seven Husbands of Evelyn Hugo");
        sevenHs.print();
    }
}