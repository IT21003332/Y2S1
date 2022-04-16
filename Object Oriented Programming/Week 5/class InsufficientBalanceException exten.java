class InsufficientBalanceException extends Exception{
    InsufficientBalanceException(String message){
        super(message);
    }
}

class Account{

    private int account;
    private double with;
    private double dep;
    private double balance;
    Account(int account){
        balance = 0;
        this.account = account;

        if(with > balance){
            throw new InsufficientBalanceException("Insufficient Funds");
        }
    }
    public double deposit(double dep){
        return balance = balance + dep;
    }
    public double withdraw(double with){
        return balance = balance - withdraw;
    }
    public double getAmount(){
        return balance;
    }

    
}

class BankDemo{
    public static void main(String args[]){

        try{
            Account acc = new Account(123);
            System.out.println("Depositing 10k");
            acc.deposit(10000);

            System.out.println("Withdrawing 12k");
            acc.withdraw(12000);
        }catch(InsufficientBalanceException e){
            System.out.println("Sorry Your account only has Rs. " + acc.getAmount());
            System.out.println(e.getMessage());
        }
            
    }
}