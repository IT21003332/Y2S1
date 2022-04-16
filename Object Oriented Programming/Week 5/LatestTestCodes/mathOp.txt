

class mathOperate{
	public int add(int a, int b){
		return a + b;
	}
	
	public double divide(int a, int b){
		return a / b;
	}

}

class mathOp{
	public static void main(String args[])throws ArithmeticException{
		
		mathOperate obj1 = new mathOperate();
		obj1.add(2,0);
		obj1.divide(2,0);
	}
}
		
		