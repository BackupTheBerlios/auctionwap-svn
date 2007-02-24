<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<html>
<head>
<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
<!--
function runSubmit() 
{
	if(document.login.txtuname.value =="")
	{
		alert("Enter User Name");
		document.login.txtuname.focus();
		return false;
	}
	if(document.login.txtpword.value=="")
	{
		alert("Enter your password");
		document.login.txtpword.focus();
		return false;
	}
	document.login.submit()
    return true;
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
DIM rs,SqlStr,rsTemp
 if Request.QueryString("inv") <> "" then
	session("inv")=Request.QueryString("inv")
end if
set rs=Server.CreateObject("ADODB.Recordset")
Set rsTemp=Server.CreateObject("ADODB.Recordset")
rs.Open "Select * from categories", Con
if Request.QueryString("txtuname") <> "" then
	SqlStr="Select * from users where userid='" & Request.QueryString("txtuname") & "' and password='" & Request.QueryString("txtpword") & "'"
	rsTemp.Open SqlStr, Con
	if rsTemp.EOF = true then
		Response.Redirect("Login.asp?inv=1")
	else
		if UCase(Request.QueryString("txtuname")) = "ADMIN" then
			Session("AdminUid")=rsTemp(0)
			Response.Redirect("IReport.asp")
		end if
		Session("Uid")=rsTemp(0)
		if session("inv")="2" then
			Response.Redirect("bid.asp?bidval=" & session("bidval"))
		end if
		if session("inv")="4" then
			Response.Redirect("ItemPost.asp")
		end if
		if session("inv")="9" then
			Response.Redirect("forum.asp")
		end if
		if session("inv")="3" then
			Response.Redirect"Myacc.asp"
		else	
			Response.Redirect "Index.asp"
		end if
	end if
end if
%>

<body bgcolor="#003366" topmargin="0" leftmargin="0">
<div align="center">
  <center>
    <table width="37%" height="712" border="0" cellpadding="0" cellspacing="0" bordercolor="#ffffff" id="AutoNumber1" style="BORDER-COLLAPSE: collapse">
      <tr>
        <td width="100%" height="706"> 
          <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="773" id="AutoNumber2" height="570">
            <tr>
              <td width="773" bgcolor="#003366" valign="top" height="460"> 
                <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="98%" id="AutoNumber3" height="944">
                  <tr>
                    <td width="100%" bgcolor="#000099" height="83" colspan="2"><img src="images/home.jpg" width="773" height="177"></td>
            </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td width="100%" height="28" colspan="2"> 
                      <p align="center"><font color="#003366">&nbsp; <b><font size="2" face="Tahoma"><a href="index.asp">Home</a> 
                        | <a href="About.htm"> About Us</a> | <a href="registration.asp">Registration</a> 
                        | <a href="products.asp">Items List</a> | <a href="Itempost.asp">Post 
                        Item</a> | <a href="myacc.asp">My Account</a> | <a href="forum.htm">Forum</a> 
                        | <a href="help.htm">Help</a> | <a href="feedback.htm">Feedback</a></font></b></font></td>
            </tr>
                  <tr bgcolor="#6666CC"> 
                    <td width="100%" height="62" colspan="2"> 
                      <p align="center"><font size="2" color="#473275">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FFFFFF">&nbsp;<font face="Tahoma"><b>&nbsp;</b><strong> 
                        Search :</strong><b> </b></font> </font></font><font color="#FFFFFF"> 
                        <input name="T1" size="20">
                        <input type="submit" value="Go" name="B1" style="WIDTH: 40px" width="40">
                        &nbsp;</font><font color="#FFFFFF" size="2" face="Tahoma"> 
                        <% if session("uid")= "" then %>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <A href="Login.asp"><font color="#FFFFFF">Login&gt;&gt;</font></a> 
                        <%else %>
                        <A href="Logout.asp"><font color="#FFFFFF">Logout</font></a> </strong> 
                        <%end if %>
                        </font> 
                      <p align="right">&nbsp;
                      </td>
            </tr>
            <tr>
                    <td width="22%" bgcolor="#FFCC00" height="674" valign="top"> 
                      <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="100%" id="AutoNumber6" height="65">
                        <tr>
                  <td width="100%" bgcolor="#000066" bordercolor="#6f57a4" align="middle" height="26"><b><font color="#ffffff" face="Tahoma" size="2">
              B2B Categories</font></b></td>
                </tr>
                <tr>
				<% do while not rs.eof %>
                          <td width="100%" height="39"> <b><u><A href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> </A></u></b>&nbsp;</td>
                </tr>
			  <%rs.movenext()%>
  			   <%loop%>
              </table>
              </td>
                    <td width="78%" bgcolor="#ffffff" height="674" valign="top"> 
                      <div align="center">       <center>
             <form name="login" method="get" action="Login.asp">
                            <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="100%" id="AutoNumber4" height="655">
                              <tr> 
                                <td width="100%" bgcolor="#ffffff" height="655" valign="top"> 
                                  <div align="right"> 
                                    <p>&nbsp;</p>
                                    <p align="center">
									<font color="#003366" size="2" face="Arial, Helvetica, sans-serif">
									<strong>Login 
                                      now to buy and sell surplus at great values 
                                      on Bizbidz.com</strong></font></p>
                                    <div align="center">
                                      <table width="59%" border="0" cellspacing="3">
                                        <tr> 
                                          <td width="48%" bgcolor="#CCFFFF">
<div align="right"><font color="#003366"><strong><font size="2" face="Arial">Username: 
                                              </font></strong></font></div></td>
                                          <td width="52%" bgcolor="#FFFFEA"> 
                                            <div align="center"> 
                                              <input name="txtuname" id="txtuname" style="WIDTH: 150px" width="150" size="20" 
                             >
                                            </div></td>
                                        </tr>
                                        <tr> 
                                          <td bgcolor="#CCFFFF">
<div align="right"><font color="#003366"><strong><font size="2" face="Arial">Password: 
                                              </font></strong></font></div></td>
                                          <td bgcolor="#FFFFEA"> 
                                            <div align="center"> 
                                              <input name="txtpword" type="password" id="txtpword" 
                              style="WIDTH: 150px" width="150" size="20" 
                             >
                                            </div></td>
                                        </tr>
                                        <tr> 
                                          <td height="26" bgcolor="#CCFFFF"> 
                                            <div align="center"></div></td>
                                          <td bgcolor="#FFFFEA"> 
                                            <div align="center"> 
                                              <input type="button" value="Login" style="WIDTH: 65px" width="65" onClick="runSubmit()" id=button1 name=button1>
                                              <input type="Reset" name="Clear" value="Reset" style="WIDTH: 65px" width="65">
                                            </div></td>
                                        </tr>
                                      </table>
                                    </div>
                                  </div>
                                  <div align="center">
                                    <table width="59%" border="0" cellpadding="3">
                                      <tr> 
                                        <td height="25" bgcolor="#000099"> 
                                          <div align="center"></div></td>
                                      </tr>
                                      <tr> 
                                        <td height="22" bgcolor="#CCFFFF"> 
                                          <div align="center"><font size="2" face="Arial, Helvetica, sans-serif"><strong>New 
                                            User to BizBidz.com?</strong></font></div></td>
                                      </tr>
                                      <tr> 
                                        <td height="22" bgcolor="#CCFFFF"> 
                                          <div align="center">
											<font size="2" face="Tahoma"><strong><a href="registration.asp">Register 
                                            here</a></strong></font></div></td>
                                      </tr>
                                    </table>
                                  </div>
                                  <div align="right">
<blockquote>
<blockquote>
                                    <p align="center"><font color="#ff0000" size="2" face="Arial, Helvetica, sans-serif">
                                    <%if Request.QueryString("inv")="1" then %> <strong>Your 
                                      Username or Password is invalid! Please 
                                      try again..</strong></font> 
                                      <% end if%>
                                    </p><%if Request.QueryString("inv")="2" or Request.QueryString("inv")="3" or Request.QueryString("inv")="4" then%>
                                    <P align=center><FONT color=#ff0000 size="2" face="Arial, Helvetica, sans-serif"><strong>You 
                                      must login to do this operation </strong></FONT></P>
                                      <%end if%>
                                    &nbsp;</blockquote>
                                    </blockquote>
                                  </div></td>
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