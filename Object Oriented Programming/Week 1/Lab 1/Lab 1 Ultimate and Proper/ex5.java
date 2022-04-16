public class ex5{
	public static void main(String args[]){
		int num = 0;
		int number = 5;
		while(num < 5){
			System.out.println("*****");
			num++;
		}
		
		for(int i = 0;i < 5;i++){
			for(int j= number;j > i;j--){
				System.out.print(" ");
			}
			for(int k = 0; k < i;k++) {
				System.out.print("* ");
			}
			System.out.println();
		}
	}
}
