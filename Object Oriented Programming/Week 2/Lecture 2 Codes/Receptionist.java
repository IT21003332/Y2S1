public class Receptionist {
    private int staffId;
    private String name;
    private String telephoneNo;

    public Receptionist(){
        this.staffId = 0;
        this.name = "";
        this.telephoneNo = "";
    }
    public Receptionist(int pId,String pName, String pTelephone){
        this.staffId = pId;
        this.name = pName;
        this.telephoneNo = pTelephone;
    }
    public void setinfo(int pID,String pName,String pTelephone){
        this.staffId = pID;
        this.name = pName;
        this.telephoneNo = pTelephone;
    }
    public int getID(){
        return this.staffId;
    }
    public String getName(){
        return this.name;
    }
    public String getTele(){
        return this.telephoneNo;
    }
}
