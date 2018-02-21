<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProcessData</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/formoid-solid-red.css"/>
        <script type="text/javascript" src="css/jquery.min.js"></script>


</head>

<body class="blurBg-false" style="background-color:#EBEBEB">
<form class="formoid-solid-red" name="register" 
      style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:480px;min-width:150px" >
 <input type="hidden" name="pagename" value="register"/>
   <div class="title"><h2>Customer Info</h2></div> 
   <div class="element-input"> 
<% String custname =request.getAttribute("custname").toString(); %><br>
<% String custssn =request.getAttribute("custssn").toString();  %><br>
<% String custemail =request.getAttribute("custEmail").toString();  %><br>
<% String zipcode = request.getAttribute("zipcode").toString(); %>
<% String street = request.getAttribute("street").toString(); %>
<% String city = request.getAttribute("city").toString(); %>
<% String state = request.getAttribute("state").toString(); %>

<b>Customer Name: &nbsp;&nbsp;</b><%=custname%><br>
<b>Customer SSN: &nbsp;&nbsp;&nbsp;&nbsp;</b><%=custssn%><br>
<b>CustomerEmail: &nbsp;&nbsp;&nbsp;</b><%=custemail%><br>

<b>Street: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> 
           <%=street%><br>

<b>ZipCode: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;</b>
            <%=zipcode%><br>

<b>City: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
         <%=city%><br>

<b>State: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
          <%=state%><br>

<b>Latitude: &nbsp;&nbsp;</b><%=request.getAttribute("latitude") %> ,  
<b>Longitude: &nbsp;</b><%=request.getAttribute("longitude") %>
<br>
<br>
<br>
<br>
<div class="element-input"><h3>Thank you !</h3>

<br>
<br>


</div>
</div>

</form>
</body>


</html>