package common;

import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class JsonKMP {

	public ArrayList<String> kmpList = new ArrayList();

	public void parsing(String json) {
		String jsonData = json;

		Gson gson = new Gson();
		JsonObject jsonObject = gson.fromJson(jsonData, JsonObject.class);
		JsonObject responseBody = jsonObject.getAsJsonObject("response").getAsJsonObject("body");
		JsonElement itemsElement = responseBody.getAsJsonObject("items").get("item");

		if (itemsElement.isJsonArray()) {
			JsonArray items = itemsElement.getAsJsonArray();
			for (int i = 0; i < items.size(); i++) {
				JsonObject item = items.get(i).getAsJsonObject();
				String addr1 = item.get("addr1").getAsString();
				System.out.println("Address (addr1): " + addr1);

				kmpList.add(addr1);
			}
		} else if (itemsElement.isJsonObject()) {
			JsonObject item = itemsElement.getAsJsonObject();
			String addr1 = item.get("addr1").getAsString();
			// System.out.println("Address (addr1): " + addr1);
		}
		
		
	}// parsing end
	
	public String parsing(String json, String pattern) {
		 String jsonData = json; // Your JSON data

	        Gson gson = new Gson();
	        JsonObject jsonObject = gson.fromJson(jsonData, JsonObject.class);
	        JsonObject responseBody = jsonObject.getAsJsonObject("response").getAsJsonObject("body");
	        JsonElement itemsElement = responseBody.getAsJsonObject("items").get("item");

	        JsonObject result = new JsonObject();
	        JsonObject response = new JsonObject();
	        JsonObject body = new JsonObject();
	        JsonObject items = new JsonObject();
	        JsonArray filteredItems = new JsonArray();

	        if (itemsElement.isJsonArray()) {
	            JsonArray itemArray = itemsElement.getAsJsonArray();
	            for (int i = 0; i < itemArray.size(); i++) {
	                JsonObject item = itemArray.get(i).getAsJsonObject();
	                String addr1 = item.get("addr1").getAsString();
	                String title = item.get("title").getAsString();
	                if (KMP(addr1,pattern) || KMP(title, pattern)) {
	                    filteredItems.add(item);
	                }
	            }
	        } else if (itemsElement.isJsonObject()) {
	            JsonObject item = itemsElement.getAsJsonObject();
	            String addr1 = item.get("addr1").getAsString();
	            if (addr1.startsWith("Seoul")) {
	                filteredItems.add(item);
	            }
	        }

	        items.add("item", filteredItems);
	        body.add("items", items);
	        response.add("body", body);
	        result.add("response", response);

	        String filteredJsonData = gson.toJson(result);
	        System.out.println("Filtered JSON data:\n" + filteredJsonData);
	        
	        return filteredJsonData;
	}// parsing end
	

	public boolean KMP(String s, String pattern) {
		int[] pi = getPi(pattern);
		int n = (int) s.length();
		int m = (int) pattern.length();
		int j = 0;
		// 문자열 길이 만큼 반복
		for (int i = 0; i < n; i++) {
			// 맞는 와중에 틀린경우
				while (j > 0 && s.charAt(i) != pattern.charAt(j))
					j = pi[j - 1];

				if (s.charAt(i) == pattern.charAt(j)) {
					if (j == m - 1) { // 다 맞춘 경우

						j = pi[j]; // s에서 여러개의 p 가 있는 경우 의미가 있음
						return true;
					} else { // s의 i 와 패턴 p가 일치하지만 아직 끝까지 다 맞는건 아닌 상태
						j++;// j는 패턴 문자열 길이-1까지 증가한다
					}
				} // if end
			} // for end
		return false;
	}

	int[] getPi(String pattern) {
    	int pSize  = (int) pattern.length(), j = 0; // 먼저 패턴 문자열 길이 조사
		int[] pi = new int[pSize]; // 접두 접미 겹치는 범위를 표기하는
		// pi 배열 선언 후 0으로 초기화
		for (int i = 0; i < pSize; i++) {
			pi[i] = 0;
		}

		//글자가 한개일때는 비교의미 없으니 1부터 시작
		//패턴 문자열 p의 부분 문자열에 따른 pi 갱신
		for (int i = 1; i < pSize; i++) {
			//AB pi=0 ABA j=0 p[2]=A p[0] =A  while 불만족 if 만족 pi[2] =1
			//ABAA i=3 j=1 while 만족 j=0 p[3] == p[0] == A  j=1 p[3]=1 

			// 접두 접미 부분이 맞는 부분이 있던 와중에 틀린 부분이 생긴 경우
		  //while문을 벗어나려면 j==0또는 두 비교값이 같을 경우

			while (j > 0 && pattern.charAt(i) != pattern.charAt(j)){
				j = pi[j - 1];
			}

			if (pattern.charAt(i) == pattern.charAt(j)) {
				pi[i] = ++j;
			}

		}
		return pi;
	}


}
