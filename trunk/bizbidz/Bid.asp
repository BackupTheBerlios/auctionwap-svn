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
if Request.QueryString("bidval") <> "" then
	session("bidval")=Request.QueryString("bidval")
end if
if session("uid")="" then
	Response.Redirect("Login.asp?inv=2")
end if
DIM RSS,rs,sql
SET RSS=Server.CreateObject("ADODB.Recordset")
set rs=Server.CreateObject("ADODB.Recordset")
Dim bidval
dim itid
itid=Cint(Session("Itemid"))
if Request.QueryString("bidval") <> "" then
	bidval=CDbl(Request.QueryString("bidval"))
	Session("bidval")=bidval
else
	bidval=Session("bidval")
end if
sql="Select cbid from items where itemid=" & itid
RSS.Open sql, Con
if RSS(0).Value >= bidval then
	Response.Redirect("Proddesc.asp?inv=1")
else
	dim rstemp
	dim bid
	Set rstemp=Server.CreateObject("ADODB.Recordset")
	rstemp.Open "Select max(bid) from bids",Con
	if rstemp.EOF =false then
		bid=rstemp(0).Value + 1
	else
		bid=1
	end if
	sql="Insert into bids values(" & bid & "," & itid & ",'" & session(uid) & "'," & bidval & ")"
	Con.execute sql
	sql="Update Items set cbid=" & bidval & ", noofbids=noofbids+1 where Itemid=" & itid
	Con.execute sql
End if
set RSS=Nothing
rs.Open "Select * from categories", Con
%>



<body bgcolor="#000066" topmargin="0" leftmargin="0">
<div align="center">
  <center>
  <table border="3" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="103%" id="AutoNumber1">
    <tr>
      <td width="100%">
      <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="780" id="AutoNumber2" height="570">
        <tr>
          <td width="607" bgcolor="#6f57a4" valign="top" height="460">
          <table width="100%" height="665" border="2" align="center" cellpadding="0" cellspacing="0" bordercolor="#473275" id="AutoNumber3" style="BORDER-COLLAPSE: collapse">
                  <tr>
                    <td width="100%" bgcolor="#000099" height="58" colspan="2"><img src="images/home.jpg" width="773" height="177"></td>
            </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td width="100%" height="32" colspan="2"> 
                      <p align="center">&nbsp; <b><font color="#FF00FF" size="2" face="Tahoma"><a href="index.asp"><font color="#003366">Home</font></a><font color="#003366"> 
                        | <a href="About.htm"> About Us</a> | <a href="registration.asp">Registration</a> 
                        | <a href="products.asp">Items List</a> | <a href="Itempost.asp">Post 
                        Item</a> | <a href="myacc.asp">My Account</a> | <a href="forum.htm">Forum</a> 
                        | <a href="help.htm">Help</a> | <a href="feedback.htm">Feedback</a></font></font></b></td>
            </tr>
                  <tr bgcolor="#6666CC"> 
                    <td width="100%" height="28" colspan="2"> 
                      <form name="search" action="products.asp">
                        <p align="center"> <font color="#FFFFFF"> </font><font size="2" color="#473275">&nbsp;&nbsp;<strong> 
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
                          </font></b> </font></p>
                      </FORM></td>
            </tr>
            <tr>
                    <td width="21%" bgcolor="#FFCC00" height="622" valign="top"> 
                      <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="100%" id="AutoNumber6" height="56">
                        <tr>
                  <td width="100%" bgcolor="#000066" bordercolor="#6f57a4" align="middle" height="22"><div align="center"><b><font color="#ffffff" face="Tahoma" size="2"> 
                              B2B Categories</font></b></div></td>
                </tr>
                <tr>
				<% do while not rs.eof %>
                          <td width="100%" height="34"> <b><u><A href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> </a></u></b>&nbsp;</td>
                </tr>
			  <%rs.movenext%>
  			   <%loop%>
              </table>
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
                    <td width="79%" bgcolor="#ffffff" height="622" valign="top"> 
                      <div align="center">       <center>
             <form name="frmregister" action="register.asp" method="get">   
                            <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="100%" id="AutoNumber4" height="401">
                              <tr>
                                <td width="100%" bgcolor="#FFFFFF" height="401" valign="top"> 
                                  <p align="center"><b> <font size="2" face="Tahoma" color="#473275"><br>
                                          &nbsp;</font></b></p>
                                        <p align="center">&nbsp;</p>
                                        <p align="center">&nbsp;</p>
                                        <p align="center">&nbsp;</p>
                                        
                                  <p align="center"><b> <font size="2" face="Tahoma" color="#473275">Thank 
                                    you for your bid! You bid has been accepted. 
                                    </font></b></p>
                                  <p align="center"><b><font size="2" face="Tahoma" color="#473275">The 
                                    details will be mailed to you shortly once 
                                    the auction is closed.</font></b></p>
                                  <p align="center"><b> <font face="Tahoma" size="2" color="#473275"> 
                                    &nbsp;<a style="text-decoration: none" href="index.asp"><font color="#0000FF"><u>Home</u></font></a></font></b></p>
                                  <p align="center">&nbsp; 
                                  <p>
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