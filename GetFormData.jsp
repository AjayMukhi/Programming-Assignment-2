<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Info Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/formoid-solid-red.css"/>
        <script type="text/javascript" src="css/jquery.min.js"></script>
 
 
<script LANGUAGE="Javascript" >
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){
				alert(T+" is mandatory");
				return false;
			}
		}
		
		function customerName(F){
			var val= F.value;
			if(val.length >= 4 && val.length <= 50 ){				
				return true;
			}
			else{
				alert("Customer name should be between 4-50 characters long.");
				return false;
			}
		}
		
		
		
		function streetAdd(F){			
			var val= F.value;
			if(val.length >= 4 && val.length <= 50 ){				
				return true;
			}
			else{
				alert("Street Address should be between 4-50 characters long.");
				return false;
			}
		}
		
		function cityName(F){

			var val= F.value;
			if(val.length >= 3 && val.length <= 50 ){				
				return true;
			}
			else{
				alert("City should be between 3-50 characters long.");
				return false;
			}
			
			
		}
		
		
		
		 function ssn(F){
             var patt = new RegExp("\d{3}[\-]\d{2}[\-]\d{4}");
             var  val = F.value;
             if(patt.test(val))
                 return true;
             else
                 alert("Please enter valid Customer Social Security Number");
                 return false;  
             
         }
		 
		 
		 
		 function zipcodeAdd(F){
			 
			 var regexp=new RegExp("^[0-9]{5}(?:-[0-9]{4})?$+");
			 var  val = F.value;
             if(regexp.test(val))
                 return true;
             else
                 alert("Please enter valid US ZipCode");
                 return false;
			 
			 
		 }
		 
		 function emailAdd(F){
			 
			 var reg_exp = new RegExp("[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+");
			 var  val = F.value;
             if(reg_exp.test(val))
                 return true;
             else
                 alert("Please enter valid email address");
                 return false;
                 
             if(val.length >=7 ){				
     				return true;
     	     }else{
     	    	 
     	       alert("Please enter atleast 7 characters");
               return false;
     	     }
			 
		 }
		
		function validate()
		{
						
            if(ChkMandatoryField(editform.txtCustName,'CustomerName')==false) 
            	return false;
            
           
            
            if(ChkMandatoryField(editform.txtStreetAddress,'Street Address')==false) 
            	return false;
            
           
            
            if(ChkMandatoryField(editform.txtCity,'City')==false) 
            	return false;
            
            
            
            
         }



</script>
        
        
</head>

<body class="blurBg-false" style="background-color:#EBEBEB">
<form id="form-elem" class="formoid-solid-red" name="editform" method="post" action="ValidateFormData.jsp" 
style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;
max-width:480px;min-width:150px"   >
   <input type ="hidden" name = "isSubmitted" value = "true"> 
   <div class="title"><h2>Customer Info</h2></div>
   <div class="element-input">
	  <label class="title"></label>
	    <div class="item-cont">
		   <input class="large" placeholder="Customer Name" type="text" id="custname" name="txtCustName" required="" onblur="customerName(this)" required  />
		   <span class="icon-place"></span>
		</div>
	</div>
   <div class="element-input">
	  <label class="title"></label>
	    <div class="item-cont">
	      <input class="large" placeholder="Customer Social Security Number"  type="text" name="txtCustssn" required="" onblur="ssn(this)"
	       />
		  <span class="icon-place"></span>
		</div>
	</div>
   <div class="element-email">
	  <label class="title"></label>
	    <div class="item-cont">
		  <input class="large" placeholder="Customer Email Address" type="text" name="txtEmailAddress" onblur="emailAdd(this)"		  
		  required=""
          data-fv-emailaddress-message="The input is not a valid email address"
		  />
		  <span class="icon-place"></span>
		</div>
	</div>
	
	<div class="element-address">
	  <label class="title"></label>
	    <span class="addr1">
		  <input  placeholder="Street" type="text" id="street" name="txtStreetAddress" onblur="streetAdd(this)" required="" />
		  <span class="icon-place"></span>
		</span>
		<span class="city">
		  <input placeholder="City" type="text" id="city" name="txtCity" onblur="cityName(this)"  required=""   />
		  <span class="icon-place"></span>
		</span>
		<span class="zip">
		  <input  placeholder="Postal / Zip Code" type="text" name="txtZipCode" onblur="zipcodeAdd(this)" required=""/>
		  <span class="icon-place"></span>
		</span>
		<div class="state">
		<select id = "state" name="txtState">
		<option selected="selected" value="" disabled="disabled">--- Select a State ---</option>
		<option value="AL">Alabama (AL)</option>
	    <option value="AK">Alaska (AK)</option>
	    <option value="AZ">Arizona (AZ)</option>
	    <option value="AR">Arkansas (AR)</option>
	    <option value="CA">California (CA)</option>
	    <option value="CO">Colorado (CO)</option>
	    <option value="CT">Connecticut (CT)</option>
	    <option value="DE">Delaware (DE)</option>
	    <option value="DC">District Of Columbia (DC)</option>
	    <option value="FL">Florida (FL)</option>
	    <option value="GA">Georgia (GA)</option>
	    <option value="HI">Hawaii (HI)</option>
	    <option value="ID">Idaho (ID)</option>
	    <option value="IL">Illinois (IL)</option>
	    <option value="IN">Indiana (IN)</option>
	    <option value="IA">Iowa (IA)</option>
	    <option value="KS">Kansas (KS)</option>
	    <option value="KY">Kentucky (KY)</option>
	    <option value="LA">Louisiana (LA)</option>
	    <option value="ME">Maine (ME)</option>
	    <option value="MD">Maryland (MD)</option>
	    <option value="MA">Massachusetts (MA)</option>
	    <option value="MI">Michigan (MI)</option>
	    <option value="MN">Minnesota (MN)</option>
	    <option value="MS">Mississippi (MS)</option>
	    <option value="MO">Missouri (MO)</option>
	    <option value="MT">Montana (MT)</option>
	    <option value="NE">Nebraska (NE)</option>
	    <option value="NV">Nevada (NV)</option>
	    <option value="NH">New Hampshire (NH)</option>
	    <option value="NJ">New Jersey (NJ)</option>
	    <option value="NM">New Mexico (NM)</option>
	    <option value="NY">New York (NY)</option>
	    <option value="NC">North Carolina (NC)</option>
	    <option value="ND">North Dakota (ND)</option>
	    <option value="OH">Ohio (OH)</option>
	    <option value="OK">Oklahoma (OK)</option>
	    <option value="OR">Oregon (OR)</option>
	    <option value="PA">Pennsylvania (PA)</option>
	    <option value="RI">Rhode Island (RI)</option>
	    <option value="SC">South Carolina (SC)</option>
	    <option value="SD">South Dakota (SD)</option>
	    <option value="TN">Tennessee (TN)</option>
	    <option value="TX">Texas (TX)</option>
	    <option value="UT">Utah (UT)</option>
	    <option value="VT">Vermont</option>
	    <option value="VA">Virginia</option>
	    <option value="WA">Washington</option>
	    <option value="WV">West Virginia</option>
	    <option value="WI">Wisconsin</option>
	    <option value="WY">Wyoming</option>
      </select>	    		
	  <span class="icon-place"></span>
	 </div>
  </div>
 
 
   <div class="submit">
	  <input type="submit" name="validate" value="Submit" id="validate" onclick="return validate()" />
   </div>
   
   
</form>
          
  </body>
  
</html>