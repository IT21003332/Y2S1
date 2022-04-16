class MyException extends Exception{
    MyException(String message){
        super(message);
    }
}

class CustomException{
        public static void main(String args[]){
                
            int x = 5;
            int y = 1000;
            
            try{
                float z = (float)x / (float)y;
                if(z < 0.01){
                    throw new MyException("Number is critically small");
                }
            }catch(MyException e){
                System.out.println("Main souce caught MyException.exe");
                System.out.println(e.getMessage());
            }
            finally{
                System.out.println("Final.exe initialized");
            }
        }
}