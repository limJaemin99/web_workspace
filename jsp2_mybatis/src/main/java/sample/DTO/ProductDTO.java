package sample.DTO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


//@Data		//hashcode 재정의가 필요할 때 사용
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProductDTO {
	private String pname;
	private int price;
	private Date createAt;
	private String picture;	
	
}
