package com.validation;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import javax.validation.constraints.*;

public class Member {

	
	@NotNull(message="Email Address is compulsory") 
    @Min(value = 7, message = "Email Address must be greater than or equal to 7 Characters")
	@Pattern(regexp = "[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+",message = "Email Address is not a valid format")
	private String custEmail;
    
    
    @NotNull(message="Zip Code is compulsory") 
    @Pattern(regexp="^[0-9]{5}(?:-[0-9]{4})?$+",message = "Zip Code must be valid")
    private String zipcode;
    
	public Member() {
	}

	
	public void validation(String email) {
//		ValidatorFactory vf = ;
//		Validation val=new Validation();
		Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
//		User user = new Member();
//		user.setEmail("user@gmail.com");
		setCustEmail(email);
		Set<ConstraintViolation<Member>> constraintViolations = validator.validateValue(Member.class, custEmail,"");
		for (ConstraintViolation<Member> cv : constraintViolations) {
		      System.out.println(String.format(
		          "Error here! property: [%s], value: [%s], message: [%s]",
		          cv.getPropertyPath(), cv.getInvalidValue(), cv.getMessage()));
		}
	}

	public String getCustEmail() {
		return custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
}