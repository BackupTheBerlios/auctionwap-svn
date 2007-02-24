<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<html>
<head>
<SCRIPT language="JavaScript" src="includes/validations.js"></SCRIPT>
<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
<!--
function runSubmit ()  {
        var org=document.frmregister;
		if (!testEMPTY(org, org.T1))
		{
			validatePrompt(org.T1,"User name should be entered");
			return;
		}
		if (!testEMPTYPWD(org, org.T2)) return;
		if (!testEMPTYCPWD(org, org.T3)) return;
				
		if (!isEmailValid (document.frmregister.T4.value)) 
		{
			validatePrompt(org.T4,"Invalid  Email address ");
			return;
		}
		if (!isCEmailValid (org.T5.value)) 
		{
			validatePrompt(org.T5,"Invalid Confirm email address");
			return;
		}
		if (org.T4.value != org.T5.value)
		{
			validatePrompt(org.T5,"E-mail addresses not matched");
			return;
		}
		if (!testEMPTY(org, org.T6)) 
		{
			validatePrompt(org.T6,"Please Enter first name");
			return;
		}
		if (!testEMPTY(org, org.T7)) 
		{
			validatePrompt(org.T7,"Please Enter second name");
			return;
		}
		if (!testEMPTY(org, org.T9)) 
		{
			validatePrompt(org.T9,"Please Enter your company name");
			return;
		}
		if (!testEMPTY(org, org.T10))
		{
			validatePrompt(org.T10,"Please Enter your  Business phone number");
			return;
		}

		if (!testEMPTY(org, org.txtadd1))
		{
			validatePrompt (org.txtadd1, "Please enter your address") ;
			return;
		}
		if (!testEMPTY(org, org.txtcity))
		{
			validatePrompt (org.txtcity, "Please enter your  city") ;
			return;
		}
		if (!testEMPTY(org, org.txtzip))
		{
			validatePrompt (org.txtzip, "Please enter your zipcode") ;
			return;
		}

//		if (!testEMPTY(org, org.T12)) return;
        org.submit();
        return;
}
//-->
</SCRIPT>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Bizbidz's Registration</title>
</head>
<% 
	qryval=""
	DIM RSS,rs,rsTemp
	SET RSS=Server.CreateObject("ADODB.Recordset")
	set rs=Server.CreateObject("ADODB.Recordset")
	Set rsTemp=Server.CreateObject("ADODB.Recordset")
	Dim SqlStr
	SqlStr="Select * from users where Userid='" & Request.QueryString("T1") & "'"
	rsTemp.Open SqlStr,Con
	if rsTemp.EOF =false then
		Response.Redirect("Registration.asp?inv=1")
	end if
	SqlStr="Insert into Users "
	SqlStr=SqlStr & "values('" & Request.QueryString("T1") & "','"
	SqlStr=SqlStr & Request.QueryString("T2") & "','"
	SqlStr=SqlStr & Request.QueryString("T4") & "','"
	SqlStr=SqlStr & Request.QueryString("T6") & "','"
	SqlStr=SqlStr & Request.QueryString("T7") & "','"
	SqlStr=SqlStr & Request.QueryString("title") & "','"
	SqlStr=SqlStr & Request.QueryString("T9") & "','"
	SqlStr=SqlStr & Request.QueryString("T10") & "','"
	SqlStr=SqlStr & Request.QueryString("txtfax") & "','"
	SqlStr=SqlStr & Request.QueryString("T12") & "','"
	SqlStr=SqlStr & Request.QueryString("txtadd1") & "','"
	SqlStr=SqlStr & Request.QueryString("txtadd2") & "','"
	SqlStr=SqlStr & Request.QueryString("txtcity") & "','"
	SqlStr=SqlStr & Request.QueryString("country") & "','"
	SqlStr=SqlStr & Request.QueryString("txtzip") & "','"
	SqlStr=SqlStr & Request.QueryString("cato") & "','"
	SqlStr=SqlStr & date() & "')"
	Con.execute SqlStr
	rs.Open "Select * from categories", Con
%>
<body bgcolor="#003366" topmargin="0" leftmargin="0">
<table width="37%" height="742" border="3" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" id="AutoNumber1" style="border-collapse: collapse">
      <tr>
        
    <td width="100%" height="742" bgcolor="#003366"> 
      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="776" id="AutoNumber2" height="570">
            <tr>
          <td width="776" bgcolor="#6F57A4" valign="top" height="460">
          <table border="2" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" width="94%" id="AutoNumber3" height="950">
              <tr>
                <td width="100%" bgcolor="#000099" height="60" colspan="2"><img src="images/home.jpg" width="773" height="177"></td>
            </tr>
                  
              <tr bgcolor="#FFFFFF"> 
                <td width="100%" height="28" colspan="2"> 
                  <p align="center">&nbsp; <b><font color="#FF00FF" size="2" face="Tahoma"><a href="index.asp"><font color="#003366">Home</font></a><font color="#003366"> 
                    | <a href="About.htm"> About Us</a> | <a href="registration.asp">Registration</a> 
                    | <a href="products.asp">Items List</a> | <a href="Itempost.asp">Post 
                    Item</a> | <a href="myacc.asp">My Account</a> | <a href="forum.htm">Forum</a> 
                    | <a href="help.htm">Help</a> | <a href="feedback.htm">Feedback</a></font></font></b></td>
            </tr>
                  
              <tr bgcolor="#6666CC"> 
                <td width="100%" height="47" colspan="2">
				<p align="center"><font size="2" color="#473275">&nbsp;&nbsp;<strong> 
                  &nbsp;<font color="#FFFFFF" face="Tahoma">Search :</font></strong><b><font face="Tahoma"> 
                  </font></b> </font><font color="#473275"> 
                  <input name="T1" size="20">
                  <input type="submit" value="Go" name="B1" style="WIDTH: 40px" width="40">
                  &nbsp;</font><font face="Tahoma" size="2"> 
                  <% if session("uid")= "" then %>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>&nbsp;&nbsp;&nbsp;&nbsp;</b><strong><font color="#FFFFFF">&nbsp; 
                  <A href="Login.asp"><font color="#FFFFFF">Login&gt;&gt;</font></a></font></strong><b><font color="#FFFFFF"> 
                  <%else %>
                  <A href="Logout.asp"><font color="#FFFFFF">Logout</font></a> 
                  <%end if %>
                  </font></b></font></td>
            </tr>
            <tr>
                    <td width="21%" bgcolor="#FFCC00" height="694" valign="top"> 
                      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber6" height="64">
                        <tr>
                  <td width="100%" bgcolor="#000066" bordercolor="#6F57A4" align="center" height="25"><b><font color="#ffffff" face="Tahoma" size="2">
              B2B Categories</font></b></td>
                </tr>
                <tr>
				<% do while not rs.eof %>
                          <td width="100%" height="39"> <b><u><a href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> </a></u></b>&nbsp;</td>
                </tr>
			  <%rs.movenext%>
  			   <%loop%>
                <tr>
                          <td width="100%" height="39"> 
                      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="table1" height="56">
                        <tr> 
                          <td width="100%" bgcolor="#000066" bordercolor="#6F57A4" align="center" height="29"> 
                            <div align="center"><b><font face="Tahoma" size="2" color="#FFFFFF">Get 
                              Started</font></b></div></td>
                        </tr>
                        <tr> 
                          <% do while not rs.eof %>
                          <td width="100%" height="37" bgcolor="#FFCC00"> <b><u><a href="products.asp?categ=<%=rs(0)%>"> 
                            </a></u></b>&nbsp;</td>
                        </tr>
                        <%rs.movenext%>
                        <%loop%>
                      </table></td>
                </tr>
			  </table>
              </td>
                    <td width="79%" bgcolor="#FFFFFF" height="694" valign="top"> 
                      <div align="center">       <center>
             <form name="frmregister" action="forum.htm" method="post">   
                            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" width="100%" id="AutoNumber4" height="598">
                              <tr>
                                <td width="100%" bgcolor="#DFDAEB" height="598" valign="top"> 
                                  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" width="100%" id="AutoNumber4" height="640">
                                    <tr> 
                                      <td width="100%" bgcolor="#FFFFFF" height="640" valign="top"> 
                                        <p align="center"><b> <font size="2" face="Tahoma" color="#473275"><br>
                                          &nbsp;</font></b></p>
                                        <p align="center"><b> <font size="2" face="Tahoma" color="#473275"><br>
                                      <font face="Arial, Helvetica, sans-serif">Thank 
                                      you for registering with us. You can login 
                                      now with you user name and password.</font></font></b></p> 
                                    <p align="center"><b> <font face="Tahoma" size="2" color="#473275"> 
                                      <a style="text-decoration: none" href="index.asp"> 
                                      <font color="#0000FF"><u>Home</u></font></a></font></b></p> 
                                    <p align="center">&nbsp; </td>
                                    </tr>
                                  </table> </td>
                  </tr>
                  </table>
                </form>
                </center>
              </div>
              </td>
            </tr>
          </table>
          </td>
        </tr>
      </table>
      
    </td>
    </tr>
  </table>
  </body>
</html>