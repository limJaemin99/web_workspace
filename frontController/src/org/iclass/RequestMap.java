package org.iclass;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode			//필수. vo (불변객체) 로 정의하기 - Map 의 key 객체로 사용하기 위함.
public class RequestMap {
	private String url;		//servlet Path
		//http://localhost:8081/JSP3_maven/member/list.do 에서 /member/list.do 에 해당
	private String method;	//GET,POST
}
