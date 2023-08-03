package sample.DTO;


import java.sql.Date;

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

//DTO : JBuy , JProduct
public class JCustomerDTO {
	
	private String customer_ID;
	private String name;
	private String email;
	private int age;
	private Date reg_date;
	private String password;
	
	@Override
	public String toString() {
		return String.format("customer_ID=%s, name=%s, email=%s, age=%s, reg_date=%s, password=%s",
				customer_ID, name, email, age, reg_date, password);
	}

	public JCustomerDTO(String string, String string2, String string3, int int1, Date date) {
		// TODO Auto-generated constructor stub
	}
	
	
	
}
