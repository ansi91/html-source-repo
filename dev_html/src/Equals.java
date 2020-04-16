
public class Equals {

	public static void main(String[] args) {
		
		String s = "안녕";
		String s1 = new String("안녕");
				
		String result = (s==s1 ? "true":"false" );
		String res = (s.equals(s1) ? "true":"false");
		
		System.out.println(result);
		System.out.println(res);
	}

}
