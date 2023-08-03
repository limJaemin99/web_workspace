package sample.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class JBuyDTO {
	
	private int buy_seq;
	private String customID;
	private String pCode;
	private int quantity;
	private String buy_date;
	
	@Override
	public String toString() {
		return String.format("buy_seq=%s, customID=%s, pCode=%s, quantity=%s, buy_date=%s",
				buy_seq, customID, pCode, quantity, buy_date);
	}
	
}

//필드값이 모두 같으면 equals 로 true 가 되도록 하고싶다.
	//▶ equals 와 hashcode 를 재정의해야 한다. (불변객체)
	//▶ 이것이 VO 입니다. VO 는 테스트 케이스에서 객체를 비교할 때 사용할 수 있다.
	//▶ assertEquals 비교