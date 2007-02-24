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
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Bizbidz's Registration</title>
</head>
<% 
	if session("Uid")="" then
		Response.Redirect("Login.asp?inv=3")
	end if
	DIM RSS,rs
	SET RSS=Server.CreateObject("ADODB.Recordset")
	set rs=Server.CreateObject("ADODB.Recordset")
	rs.Open "Select * from categories", Con
	RSS.Open "Select * from users where userid='" & session("uid") & "'",Con
%>



<body bgcolor="#473275" topmargin="0" leftmargin="0">

<div align="center">
  <center>
    <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="77%" id="AutoNumber1">
      <tr>
      <td width="99%">
      <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="779" id="AutoNumber2" height="570">
        <tr>
              <td width="779" bgcolor="#003366" valign="top" height="460"> 
                <table border="2" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="99%" id="AutoNumber3" height="623">
                  <tr>
                    <td width="100%" bgcolor="#000099" height="72" colspan="2"><img src="images/home.jpg" width="773" height="177"></td>
            </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td width="100%" height="28" colspan="2"> 
                      <p align="center"><font color="#003366">&nbsp; <b><font size="2" face="Tahoma"><A href="index.asp">Home</a> 
                        | <A href="About.htm"> About Us</a> | <A href="registration.asp">Registration</a> 
                        | <A href="products.asp">Items List</a> | <A href="Itempost.asp">Post 
                        Item</a> | <A href="myacc.asp">My Account</a> | <A href="forum.asp">Forum</a> 
                        | <A href="help.htm">Help</a> | <A href="feedback.htm">Feedback</a></A><A style="TEXT-DECORATION: none" href="aaa/contact.htm" > 
                        </a></font></b></font></p>
              </td>
            </tr>
                  <tr bgcolor="#6666CC"> 
                    <td width="100%" height="1" colspan="2"> <font face="Tahoma"><b> 
                      <form name="search" action="products.asp">
                        <P align=left> <font size="2" color="#473275">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font color="#FFFFFF">&nbsp; 
                          Search : </font></strong></font><font color="#FFFFFF"><strong> 
                          <input name="T1" size="20" >
                          <input type="submit" value="Go" name="B1" style="WIDTH: 40px" width="40">
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                          &nbsp;<font face="Tahoma" size="2"> 
                          <% if session("uid")= "" then %>
                          <A href="Login.asp"><font color="#FFFFFF">Login</font></A>&gt;&gt; 
                          <%else %>
                          <A href="Logout.asp"><font color="#FFFFFF">Logout</font></A> 
                          <%end if%>
                          </font></strong></font></b></font>
</FORM></P>
                      <p></p>
              <p></p>
              <p></p>
              <p></p>
              </td>
            </tr>
            <tr>
                    <td width="21%" bgcolor="#ffcc00" height="622" valign="top"> 
                      <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="100%" id="AutoNumber6" height="66">
                        <tr>
                  <td width="100%" bgcolor="#052674" align="middle" height="27"><b><font color="#ffffff" face="Tahoma" size="2">
              B2B Categories</font></b></td>
                </tr>
                <tr>
				<% do while not rs.eof %>
                          <td width="100%" height="39" bgcolor="#ffcc00"> <b><u><A href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> </a></u></b>&nbsp;</td>
                </tr>
			  <%rs.movenext%>
  			   <%loop%>
              </table>
              </td>
                    <td width="79%" bgcolor="#ffffff" height="622" valign="top"> 
                      <div align="center">       <center>
             <form name="frmregister" action="updateacc.asp" method="get">   
                            <table width="83%" height="384" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#473275" id="AutoNumber4" style="BORDER-COLLAPSE: collapse">
                              <tr>
                                <td width="100%" bgcolor="#FFFFFF" height="186" valign="top"> 
                                  <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="100%" id="AutoNumber4" height="318">
                                    <tr> 
                            <td width="100%" bgcolor="#ffffff" height="318"> <p align="center"><b> 
                                          <font face="Tahoma" color="#000080"> 
                                          </font></b></p>
										  <% if (request.QueryString("inv") ="1" ) then%>
                                        <p align="center"><font face="Arial"><b>
                                          <label><font color="#ff0000" size="2">User name already exists try another one</font></label><font size="2">
										</font>
                                          </b></font></p>
										  <% end if %>
                                        <div align="center"> 
                                <center>
                                            <table border="0" cellpadding="0" cellspacing="5" style="BORDER-COLLAPSE: collapse" bordercolor="#6f57a4" width="100%" id="AutoNumber5">
                                              <tr bgcolor="#000099"> 
                                                <td height="24" colspan="2" align="middle">
												<p align="left"><strong><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"> 
                                                  &nbsp;My Business Account</font></strong></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" align="middle"><div align="right"><font face="Arial, Helvetica, sans-serif"><b> 
                                                    <font size="2" color="#ff0000"> 
                                                    </font><font size="2" color="#473275"> 
                                                    User Name: </font>
													<font size="2" color="#FF0000"> 
                                                    *</font></b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <input name="T1" disabled value=<%=RSS(0)%> size="20">
                                                    <font size="1" face="Arial, Helvetica, sans-serif">(4-20 
                                                    Characters)</font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" align="middle"><div align="right"><font face="Arial, Helvetica, sans-serif"><b> 
                                                    <font size="2" color="#473275">Password:</font><font size="2" color="#FF0000"> 
													*</font><font size="2" color="#473275"> 
                                                    </font></b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <input name="T2" type="password" value=<%=RSS(1)%> size="20">
                                                    <font size="1" face="Arial, Helvetica, sans-serif">(passwords 
                                                    are case sensitive<b><font color="#666666">)</font></b></font></div></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" align="middle"><div align="right"><font face="Arial, Helvetica, sans-serif"><b> 
                                                    <font color="#473275" size="2">Confirm 
                                                    Password: </font>  
                                                    <font color="#FF0000" size="2">
													*</font> </b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <input name="T3" type="password" value=<%=RSS(1)%> size="20">
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" align="middle"><div align="right"><font face="Arial, Helvetica, sans-serif"><b> 
                                                    <font color="#473275" size="2">Email 
                                                    Address: </font>  
                                                    <font color="#FF0000" size="2">
													*</font><font color="#473275" size="2"> </font> </b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <input name="T4" value=<%=RSS(2)%> size="20">
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" align="middle"><div align="right"><font face="Arial, Helvetica, sans-serif"><b> 
                                                    <font size="2" color="#473275">Confirm 
                                                    Email Address: </font> 
                                                    <font size="2" color="#FF0000">
													*</font></b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <input name="T5" value=<%=RSS(2)%> size="20">
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" align="middle"><div align="right"><font face="Arial, Helvetica, sans-serif"><b> 
                                                    <font color="#473275" size="2">First 
                                                    Name: </font>  
                                                    <font color="#FF0000" size="2">
													*</font><font color="#473275" size="2"> </font> </b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <input name="T6" value=<%=RSS(3)%> size="20">
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" align="middle"><div align="right"><font face="Arial, Helvetica, sans-serif"><b><font color="#473275" size="2">Last 
                                                    Name: </font>
													<font color="#FF0000" size="2">
													*</font><font color="#473275" size="2"> </font></b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <input name="T7" value=<%=RSS(4)%> size="20">
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" align="middle"><div align="right">
													<b>
													<font face="Arial, Helvetica, sans-serif" size="2" color="#473275">
													Job</font></b><font face="Arial, Helvetica, sans-serif"><b><font size="2" color="#473275"> 
                                                    Title: </font> 
                                                    <font size="2" color="#FF0000">
													*</font></b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <select name="title" id="title" width="200">
                                                      <option selected>Manager</option>
                                                      <option>Director</option>
                                                      <option>Programmer</option>
                                                    </select>
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" align="middle"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b> 
                                                    <font size="2" color="#473275">Company 
                                                    Name: </font>
													<font size="2" color="#FF0000">
													*</font></b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <input name="T9" value=<%=RSS(7)%> size="20">
                                                  </div>
                                                  <div align="left"> <font face="Arial"><strong> 
                                                    <font size="1">Please note: 
                                                    </font></strong> <font size="1">all 
                                                    checks will be made payable 
                                                    to this company name unless 
                                                    no company name is specified 
                                                    </font> </font> </div></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" align="middle"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b> 
                                                    <font color="#473275" size="2">Business 
                                                    Phone: </font> 
													<font color="#FF0000" size="2">
													*</font><font color="#473275" size="2"> </font> </b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <input name="T10" value=<%=RSS(8)%> size="20">
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" align="middle"><div align="right"><font face="Arial, Helvetica, sans-serif"><b> 
                                                    <font color="#473275" size="2"> 
                                                    Fax Number: </font></b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <input name="txtfax" id="txtfax2" value=<%=RSS(9)%> size="20">
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" align="middle"><div align="right"><font face="Arial, Helvetica, sans-serif"><b> 
                                                    <font color="#473275" size="2"> 
                                                    Other Phone: </font></b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <input name="T12" value=<%=RSS(10)%> size="20">
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td width="32%" height="24" align="middle"> 
                                                  <div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b>
													<font size="2" color="#ff0000">&nbsp;</font><font color="#473275" size="2">Address 
                                                    Line 1: </font>
													<font color="#FF0000" size="2">
													*</font></b></font></div></td>
                                                <td width="65%" align="middle"> 
                                                  <div align="left"> 
                                                    <input name="txtadd1" value=<%=RSS(10)%> size="36">
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td align="middle"><div align="right"><font face="Arial, Helvetica, sans-serif"><b><font color="#473275" size="2"> 
                                                    Address Line 2:&nbsp; </font></b></font></div></td>
                                                <td align="middle"><div align="left"> 
                                                    <input name="txtadd2" value=<%=RSS(11)%> size="36">
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td align="middle"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b>
													<font color="#473275" size="2">City: </font>
													<font color="#FF0000" size="2">
													*</font></b></font></div></td>
                                                <td align="middle"> <p align="left"> 
                                                    <input name="txtcity" value=<%=RSS(12)%> size="36">
                                                  </p></td>
                                              </tr>
                                              <tr> 
                                                <td align="middle"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b><font color="#473275" size="2">Country: 
                                                    </font>
													<font color="#FF0000" size="2">
													*</font><font color="#473275" size="2"> 
                                                    </font></b></font></div></td>
                                                <td align="middle"><div align="left"> 
                                                    <select name="country" width="200">
                                                      <option selected>Malaysia</option>
                                                      <option>Not Malaysia</option>
                                                    </select>
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td align="middle"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b>
													<font size="2" color="#ff0000">&nbsp;</font><font color="#473275" size="2">Zip 
                                                    code: </font>
													<font color="#FF0000" size="2">
													*</font><font color="#473275" size="2"> </font></b></font></div></td>
                                                <td align="middle"><div align="left"> 
                                                    <input name="txtzip" value=<%=RSS(14)%> size="20">
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td align="middle"><div align="right">
													<font face="Arial, Helvetica, sans-serif">
													<b>
													<font color="#473275" size="2">What 
                                                    best describes your business: </font>
													<font color="#FF0000" size="2">
													*</font></b></font></div></td>
                                                <td align="middle"><div align="left"> 
                                                    <select name="cato" id="cato">
                                                      <%rs.MoveFirst()%>
                                                      <%do while not rs.EOF %>
                                                      <option> <%=rs(1)%></option>
                                                      <%rs.MoveNext()%>
                                                      <%loop%>
                                                    </select>
                                                  </div></td>
                                              </tr>
                                              <tr> 
                                                <td align="middle" colspan="2"> 
                                                  <div align="center"> 
                                                    <input type="button" name="Submit" value=" Save" tabindex="30" onClick="runSubmit()">&nbsp;
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
  </center>
</div>
</body>
</html>