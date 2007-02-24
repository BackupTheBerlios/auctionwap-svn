<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<html>
<head>
<SCRIPT language="JavaScript" src="includes/validations.js"></SCRIPT>
<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
<!--
function runSubmit ()  {
        var org=document.register;
		if (!testEMPTY(org, org.T1))
		{
			validatePrompt(org.T1,"User name should be entered");
			return;
		}
		var str;
		str=org.T1.value;
		if((str.length) < 4 || (str.length) > 20)
		{
			validatePrompt(org.T1,"User ID must be between 4 to 20 chatacters");
			return;
		}
		if (!testEMPTYPWD(org, org.T2)) return;
		if (!testEMPTYCPWD(org, org.T3)) return;
				
		if (!isEmailValid (document.register.T4.value)) 
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
 qryval = request.querystring("categ")
 DIM RSS,rs
 SET RSS=Server.CreateObject("ADODB.Recordset")
 set rs=Server.CreateObject("ADODB.Recordset")
 rs.Open "Select * from categories", Con
%>



<body bgcolor="#473275" topmargin="0" leftmargin="0">

<div align="center">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" width="77%" id="AutoNumber1">
      <tr>
      <td width="89%">
      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="773" id="AutoNumber2" height="570">
        <tr>
              <td width="773" bgcolor="#003366" valign="top" height="460"> 
                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" width="100%" id="AutoNumber3" height="1136">
                  <tr>
                    <td width="100%" bgcolor="#000099" height="72" colspan="2"><img src="images/home.jpg" width="773" height="177"></td>
            </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td width="100%" height="33" colspan="2"> 
                      <p align="center">&nbsp;<font color="#003366"> <font size="2" face="Tahoma"> <b><a href="index.asp">
						<font color="#000099">Home</font></a></b></font></font><font size="2" face="Tahoma"><b><font color="#000099"> 
                        | </font><font color="#003366"> <a href="About.htm"> 
						<font color="#000099">About Us</font></a><font color="#000099"> | </font> <a href="registration.asp">
						<font color="#000099">Registration</font></a><font color="#000099"> 
                        | </font> <a href="products.asp"><font color="#000099">Items List</font></a><font color="#000099"> | </font> <a href="Itempost.asp">
						<font color="#000099">Post 
                        Item</font></a><font color="#000099"> | </font> <a href="myacc.asp">
						<font color="#000099">My Account</font></a><font color="#000099"> | </font> <a href="forum.asp">
						<font color="#000099">Forum</font></a><font color="#000099"> 
                        | </font> <a href="faq.htm"><font color="#000099">Help</font></a><font color="#000099"> | </font> <a href="feedback.htm">
						<font color="#000099">Feedback</font></a><font color="#000099"></a></font><a href="aaa/contact.htm" style="text-decoration: none"><font color="#000099">
						</font> 
                        </a> </font></b> </font></td>
            </tr>
                  <tr bgcolor="#6666CC"> 
                    <td width="100%" height="64" colspan="2"> <font face="Tahoma"><b> 
                      <form name="search" action="products.asp">
                        <P align=left> <font size="2" color="#473275">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                          <font color="#FFFFFF"><strong>Search :</strong> </font> 
                          </font><font color="#473275"> 
                          <input name="T1" size="20">
                          <font color="#FFFFFF"> 
                          <input type="submit" value="Go" name="B1" style="WIDTH: 40px" width="40">
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                          &nbsp;</font><font face="Tahoma" size="2"> 
                          <% if session("uid")= "" then %>
                          <A href="Login.asp"><font color="#FFFFFF"><strong>Login&gt;&gt;</strong></font></a> 
                          <strong><font color="#FFFFFF"> 
                          <%else %>
                          <A href="Logout.asp">Logout</a> 
                          <%end if%>
                          </font></strong></font><strong><font color="#FFFFFF"></b></FONT></font></strong>
</FORM>
                    </td>
            </tr>
            <tr>
                    <td width="21%" bgcolor="#FFCC00" height="862" valign="top"> 
                      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber6" height="66">
                        <tr>
                          <td width="100%" bgcolor="#003366" bordercolor="#6F57A4" align="center" height="27"><b><font color="#ffffff" face="Tahoma" size="2"> 
                            B2B Categories</font></b></td>
                </tr>
                <tr>
				<% do while not rs.eof %>
                          <td width="100%" height="39" bgcolor="#FFCC00"> <b><u><a href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> </a></u></b>&nbsp;</td>
                </tr>
			  <%rs.movenext%>
  			   <%loop%>
                <tr>
                          <td width="100%" height="39" bgcolor="#FFCC00"> 
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
                    <td width="79%" bgcolor="#FFFFFF" height="862" valign="top"> 
                      <div align="center">       <center>
             <form name="register" action="register.asp" method="get">   
                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" width="100%" id="AutoNumber4" height="384">
                  <tr>
                                <td width="100%" bgcolor="#FFFFFF" height="186" valign="top"> 
                                  <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#FFFFFF" width="97%" id="AutoNumber4" height="318">
                                    <tr> 
                            <td width="100%" bgcolor="#FFFFFF" height="318"> <p align="center"><b> 
                                          <font face="Tahoma" color="#000080">Business Registration</font><font face="Tahoma">
							</font> </b></p>
										  <% if (request.QueryString("inv") ="1" ) then%>
                                        <p align="center"><font face="Arial"><b>
                                          <label><font color="#FF0000" size="2">User name already exists. 
										Try another one!</font></label><font size="2">
										</font>
                                          </b></font></p>
										  <% end if %>
                                        <div align="center"> 
                                <center>
                                            <table width="92%" border="0" align="center" cellpadding="0" cellspacing="5" bordercolor="#FFFFFF" id="AutoNumber5" style="BORDER-COLLAPSE: collapse">
                                              <tr> 
                                                <td width="27%" align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b> 
                                                    <font size="2" color="#473275"> 
                                                    User Name: </font>
													<font size="2" color="#FF0000"> 
                                                    *</font></b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <input name="T1" type="text" size="20" >
                                                    <font size="1">(4-20 Characters)</font></font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="27%" align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b> 
                                                    <font size="2" color="#473275">Password: 
                                                    </font>
													<font size="2" color="#FF0000">
													*</font><font size="2" color="#473275"> 
                                                    </font></b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <input name="T2" type="password" size="20" >
                                                    <font size="1">(passwords 
                                                    are case sensitive<b><font color="#666666">)</font></b></font></font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="27%" align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b> 
                                                    <font color="#473275" size="2">Confirm 
                                                    Password: </font> 
													<font color="#FF0000" size="2">
													*</font> </b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <input name="T3" type="password" size="20" >
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="27%" align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b> 
                                                    <font color="#473275" size="2">Email 
                                                    Address:</font><font color="#FF0000" size="2"> 
													*</font><font color="#473275" size="2"> </font> </b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <input type="text" name="T4" size="20">
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="27%" align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b> 
                                                    <font size="2" color="#473275">Confirm 
                                                    Email Address: </font>
													<font size="2" color="#FF0000">
													*</font></b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <input type="text" name="T5" size="20">
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="27%" align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b> 
                                                    <font color="#473275" size="2">First 
                                                    Name: </font> 
													<font color="#FF0000" size="2">
													*</font><font color="#473275" size="2"> </font> </b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <input name="T6" size="20" >
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="27%" align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b> 
                                                    <font color="#473275" size="2">Last 
                                                    Name: </font>
													<font color="#FF0000" size="2">
													*</font><font color="#473275" size="2"> </font></b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <input name="T7" size="20" >
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="27%" align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b> 
                                                    <font size="2" color="#473275">Company 
                                                    Title: </font>
													<font size="2" color="#FF0000">
													*</font></b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <select name="title" id="title" width="200">
                                                      <option selected>Manager</option>
                                                      <option>Director</option>
                                                      <option>Programmer</option>
                                                    </select>
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="27%" align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b> 
                                                    <font size="2" color="#473275">Company 
                                                    Name: </font>
													<font size="2" color="#FF0000">
													*</font></b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <input name="T9" size="20" >
                                                    </font> 
                                                  </div>
													<div align="left"> 
														<font face="Arial, Helvetica, sans-serif"> 
                                                    	<strong><font size="1">
														Please note: </font></strong>
														<font size="1">all 
                                                    checks will be made payable 
                                                    to this company name unless 
                                                    no company</font></font></div>
													<div align="left"> 
														<font size="1" face="Arial, Helvetica, sans-serif">name is specified</font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="27%" align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b> 
                                                    <font color="#473275" size="2">Business 
                                                    Phone: </font> 
													<font color="#FF0000" size="2">
													*</font><font color="#473275" size="2"> </font> </b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <input name="T10" size="20" >
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="27%" align="middle" bgcolor="#CCFFFF"><div align="right"><font face="Arial, Helvetica, sans-serif"><b> 
                                                    <font color="#473275" size="2"> 
                                                    Fax Number:&nbsp; </font></b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <input name="txtfax" id="txtfax2" size="20" >
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="27%" align="middle" bgcolor="#CCFFFF"><div align="right"><font face="Arial, Helvetica, sans-serif"><b> 
                                                    <font color="#473275" size="2"> 
                                                    Other Phone:&nbsp; </font></b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <input name="T12" size="20" >
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="27%" height="24" align="middle" bgcolor="#CCFFFF"> 
                                                  <div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b>
													<font color="#473275" size="2">Address 
                                                    Line 1: </font>
													<font color="#FF0000" size="2">
													*</font></b></font></div></td>
                                                <td width="73%" align="middle" bgcolor="#FFFFCC"> 
                                                  <div align="left"> <font face="Arial, Helvetica, sans-serif"> 
                                                    <input name="txtadd1" size="20" >
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td align="middle" bgcolor="#CCFFFF"><div align="right"><font face="Arial, Helvetica, sans-serif"><b><font color="#473275" size="2"> 
                                                    Address Line 2</font></b></font></div></td>
                                                <td align="middle" bgcolor="#FFFFCC"><div align="left"> 
                                                    <font face="Arial, Helvetica, sans-serif"> 
                                                    <input name="txtadd2" size="20" >
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b>
													<font size="2" color="#ff0000">&nbsp;</font><font color="#473275" size="2">City: </font>
													<font color="#FF0000" size="2">
													*</font></b></font></div></td>
                                                <td align="middle" bgcolor="#FFFFCC"> <p align="left"> 
                                                    <font face="Arial, Helvetica, sans-serif"> 
                                                    <input type="text" name="txtcity" size="20">
                                                    </font></td>
                                              </tr>
                                              <tr> 
                                                <td align="middle" bgcolor="#CCFFFF" height="23"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b>
													<font color="#473275" size="2">
													State: 
                                                    </font>
													<font color="#FF0000" size="2">
													*</font><font color="#473275" size="2"> 
                                                    </font></b></font></div></td>
                                                <td align="middle" height="23" bgcolor="#FFFFCC"><div align="left"> 
                                                    <font face="Arial, Helvetica, sans-serif">&nbsp; 
                                                    <select name="country" width="200">
                                                      <option selected>Malaysia</option>
                                                      <option>Not Malaysia</option>
                                                    </select>
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b>
													<font color="#473275" size="2">Zip 
                                                    code: </font>
													<font color="#FF0000" size="2">
													*</font><font color="#473275" size="2"> </font></b></font></div></td>
                                                <td align="middle" bgcolor="#FFFFCC"><div align="left"> 
                                                    <font face="Arial, Helvetica, sans-serif"> 
                                                    <input name="txtzip" size="20" >
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td align="middle" bgcolor="#CCFFFF"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b>
													<font color="#473275" size="2">What 
                                                    best describes your business: </font>
													<font color="#FF0000" size="2">
													*</font></b></font></div></td>
                                                <td align="middle" bgcolor="#FFFFCC"><div align="left"> 
                                                    <font face="Arial, Helvetica, sans-serif"> 
                                                    <select name="cato" id="cato">
                                                      <%rs.MoveFirst()%>
                                                      <%do while not rs.EOF %>
                                                      <option> <%=rs(1)%></option>
                                                      <%rs.MoveNext()%>
                                                      <%loop%>
                                                    </select>
                                                    </font></div></td>
                                              </tr>
                                              <tr> 
                                                <td align="middle" colspan="2"> 
                                                  <div align="center"> 
                                                    <input type="button" name="Submit" value=" Register" tabindex="30" onClick="runSubmit()">
                                                  </div></td>
                                              </tr>
                                            </table>
                                          </center>
                              </div></td>
                          </tr>
                        </table>
                                </td>
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
</div>
</body>
</html>