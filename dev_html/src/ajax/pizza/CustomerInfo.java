package ajax.pizza;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CustomerInfo {

	public static void main(String[] args) {
		List<Map<String,Object>> mlist = new ArrayList<>();
    	Map<String,Object> rmap = new HashMap<>();
    	rmap.put("mem_name", "홍길동");
    	rmap.put("address","인천시 부평구 부평동");
    	rmap.put("tel", "010-1234-5678");
    	mlist.add(rmap);
    	rmap = new HashMap<String, Object>();
    	rmap.put("mem_name", "김유신");
    	rmap.put("address","서울시 영등포구 당산동");
    	rmap.put("tel", "010-2134-2134");
    	mlist.add(rmap);
    	rmap = new HashMap<String, Object>();
    	rmap.put("mem_name", "김갑환");
    	rmap.put("address","서울시 금천구 가산동");
    	rmap.put("tel", "010-7777-7777");
    	mlist.add(rmap);
    	Gson g = new GsonBuilder().setPrettyPrinting().create();
    	String imsi =  g.toJson(mlist);
    	System.out.println(imsi);
	}

}
