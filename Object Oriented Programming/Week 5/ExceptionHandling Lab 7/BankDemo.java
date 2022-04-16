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
    }
    public double deposit(double dep){
        return balance = balance + dep;
    }
    public double withdraw(double with){
        return balance = balance - with;
    }
    public double getAmount(){
        return balance;
    }

    
}

class BankDemo{
    public static void main(String args[]){

        try{
            Account acc = new Account(123);
            System.out.println("Depositing " + acc.deposit(10000));
            System.out.println("Withdrawing " + acc.withdraw(12000));
            if(acc.getAmount() < 0){
                throw new InsufficientBalanceException("Insufficient Funds");
            }
        }catch(InsufficientBalanceException e){
            System.out.println(e.getMessage());
        }
            
    }
}