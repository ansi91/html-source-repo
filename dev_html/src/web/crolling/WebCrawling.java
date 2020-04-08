package web.crolling;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WebCrawling {

	
	public void methodA() {
		try {
			//크롤링할 URL 입력받기
			URL url = new URL("http://localhost:8000/day4/deptList3.jsp");
			InputStreamReader  isr = new InputStreamReader(url.openStream());//정보를 받아온다 -> 스트림을 연다 
			BufferedReader br = new BufferedReader(isr); //한줄을 읽기 위해서 
			String tags = null;
			StringBuilder sb = new StringBuilder();
			while((tags=br.readLine())!=null) {
				sb.append(tags);
			}
			
			System.out.println(sb.toString());
			br.close();
			
			//크롤링 시작 - 키(타이틀)
			List<String> titleList = new ArrayList<String>();
			String strs[] = sb.toString().split("<th>");
			
			for(int i=0;i<strs.length;i++) {
				System.out.println("strs["+i+"]==>"+strs[i]);
			}
			String strs2[] = null;
			for(int i=0;i<strs.length;i++) {
				strs2 = strs[i].split("</th>");
					titleList.add(strs2[0]); // 썰었을때 th가 하나 밖에 없으니까 계속 0번째 방에 담는다 [초기화]
			}
			for(String title:titleList) {
				System.out.println(title);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public static void main(String[] args) {
		WebCrawling wc = new WebCrawling();
		wc.methodA();

	}

}
