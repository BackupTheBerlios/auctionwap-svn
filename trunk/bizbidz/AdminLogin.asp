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
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Administrator Login</title>
</head>
<% 
DIM rs,SqlStr,rsTemp
set rs=Server.CreateObject("ADODB.Recordset")
Set rsTemp=Server.CreateObject("ADODB.Recordset")
SqlStr="Select * from users where userid='" & Request.QueryString("txtuname") & "' and password='" & Request.QueryString("txtpword") & "'"
rsTemp.Open SqlStr, Con
if rsTemp.EOF = true or ucase(Request.QueryString("txtuname")) <> "ADMIN" then
	Ainv="1"
else
	Session("AdminUid")=rsTemp(0)
	Response.Redirect("IReport.asp")
end if
%>

<body bgcolor="#ffffff" topmargin="0" leftmargin="0">
  <center>&nbsp;
  </center>
  <center>&nbsp;
  </center>
  <center>
  <p>&nbsp;</p>
  <p>&nbsp; </p>
</center>
  <center>
  <form name="login" method="Get" action="Adminlogin.asp">
    <TABLE width="775" border=0 align=center 
            cellPadding=1 cellSpacing=1 style="WIDTH: 748; HEIGHT: 222px">
      <TR> 
        <TD width="772" bgcolor="#FF9933"> <P align=center><FONT color=#ff0000 size=3>
            <% if Ainv="1" then %>
            if User Name Does not exists or password you entered is wrong try 
            again.. 
            <%end if%>
            </FONT></P></TD>
      </TR>
      <TR> 
        <TD width="772" bgcolor="#FF9933"> <DIV align=center> 
            <TABLE cellSpacing=3 width=417 border=0>
              <TR> 
                <TD width=162> <DIV align=right><FONT size=2>Admin Name</FONT></DIV></TD>
                <TD width=242> <INPUT id=txtuname style="WIDTH: 150px" 
                        name=txtuname width="150" size="20"></TD>
              </TR>
              <TR> 
                <TD width=162> <DIV align=right><FONT size=2>Password</FONT></DIV></TD>
                <TD width=242> <INPUT id=txtpword style="WIDTH: 150px" 
                        type=password name=txtpword width="150" size="20"></TD>
              </TR>
              <TR> 
                <TD width=162> <DIV align=right></DIV></TD>
                <TD width=242><INPUT id=button1 style="WIDTH: 65px" onclick=runSubmit() type=button value=Login name=button1 width="65"> 
                  <INPUT style="WIDTH: 65px" type=button value=Cancel name=Submit2 width="65"></TD>
              </TR>
            </TABLE>
          </DIV></TD>
      </TR>
    </TABLE>
  </form>
  &nbsp; 
</center>
  <center>
      </td>
    </tr>
  </table>
  </center>
</body>
</html>