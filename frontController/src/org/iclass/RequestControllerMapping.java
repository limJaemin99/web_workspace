package org.iclass;

import java.util.HashMap;
import java.util.Map;

import org.iclass.controller.Controller;
import org.iclass.controller.LoginController;
import org.iclass.controller.LoginProcessController;
import org.iclass.controller.MemberJoinController;
import org.iclass.controller.MemberListController;
import org.iclass.controller.MemberSaveController;
import org.iclass.controller.MemberUpdateController;
import org.iclass.controller.QnAController;
import org.iclass.controller.ShopIndexController;
import org.iclass.controller.ShopSaleController;

public class RequestControllerMapping {
//처리해야 할 RequestKeyValue와 처리할 Controller 구현체 클래스 지정하기(매핑)
	//Map<Key,Value> : Key를 이용해서 Value를 가져오기
	private static final Map<RequestMap,Controller> mapping = new HashMap<>();
	
	//매핑 설정
	public static void init() {
		//RequestMap 은 key-value Map 에서 key 담당, xxxController는 value 입니다.
		mapping.put(new RequestMap("/","GET"),new ShopIndexController());
		mapping.put(new RequestMap("/index","GET"),new ShopIndexController());
		mapping.put(new RequestMap("/member/list","GET"),new MemberListController());
		mapping.put(new RequestMap("/member/join","GET"),new MemberJoinController());
		mapping.put(new RequestMap("/member/update","GET"),new MemberUpdateController());
		mapping.put(new RequestMap("/shop/sale","GET"),new ShopSaleController());
		mapping.put(new RequestMap("/member/save","POST"),new MemberSaveController());
		mapping.put(new RequestMap("/login","GET"),new LoginController());
		mapping.put(new RequestMap("/login","POST"),new LoginProcessController());
		mapping.put(new RequestMap("/shop/qna","GET"), new QnAController());
	}
	
	public static Controller getController(RequestMap key) {
		return mapping.get(key);
	}
	
}
