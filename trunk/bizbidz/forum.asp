<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<html>
<head>
<SCRIPT language="JavaScript" src="includes/validations.js"></SCRIPT>
<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
<!--
function runSubmit ()  {
    var org=document.forum;
	if (!testEMPTY(org, org.Topic)) 
	{
		validatePrompt(org.Topic,"Please Enter your topic");
		return false;
	}
	if (!testEMPTY(org, org.Message)) 
	{
		validatePrompt(org.Message,"Please Enter your Message");
		return false;
	}
    org.submit();
    return;
}
//-->
</SCRIPT>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>BizBidz system</title>
</head>

<%
	if session("uid")="" then
		response.redirect("Login.asp?inv=9")
	end if
	if Request.QueryString("Topic") <>"" then
		dim Sql,Dt
		'dt=Format(Date(),"dd/MM/yyyy")
		Sql="Insert into forum values('" & session("uid") & "','" & Date() & "','" & Request.QueryString("Topic") & "','" & Request.QueryString("Message") & "')"
		Con.Execute Sql
	end if
	DIM RSS
	SET RSS=Server.CreateObject("ADODB.Recordset")
	RSS.Open "forum", Con, adOpenDynamic, 2, adCmdTable
	Dim rs
	set rs=Server.CreateObject("ADODB.Recordset")
	rs.Open "Select * from Categories", Con
%>

<body bgcolor="#052674" topmargin="0" leftmargin="0">
<CENTER>
<TABLE id=AutoNumber1 
style="WIDTH: 791px; BORDER-COLLAPSE: collapse; HEIGHT: 589px" 
borderColor=#ffffff cellSpacing=0 cellPadding=0 border=0>
  <TR>
    <TD width=756 height=384> 
      <TABLE id=AutoNumber2 style="BORDER-COLLAPSE: collapse" 
      borderColor=#111111 height=650 cellSpacing=0 cellPadding=0 width="103%" 
      border=0>        
        <TR>
          <TD vAlign=top width="95%" bgColor=#6f57a4 height=391>
            <TABLE id=AutoNumber3 style="WIDTH: 776px; 
            BORDER-COLLAPSE: collapse; HEIGHT: 493" 
            borderColor=#473275 cellSpacing=0 cellPadding=0 width="776" border=2 
           >
              <TBODY>
              <TR>
                <TD vAlign=top width="100%" bgColor=#FFFFFF colSpan=2 
                  height=25 bordercolor="#FFFFFF">
				<img border="0" src="images/home.jpg" width="780" height="180"></TD></TR>
              <TR>
                <TD vAlign=top width="100%" bgColor=#FFFFFF colSpan=2 
                  height=25 bordercolor="#FFFFFF"><P style="TEXT-INDENT: 1px" align=center><B><FONT 
                  face=Tahoma color=#ff00ff size=2><A href="index.asp">Home</A></FONT><FONT 
                  face=Tahoma size=2> </FONT><FONT 
                  face=Tahoma color=#ff00ff size=2>| <A href="About.htm">About Us</A> | <A 
                  href="registration.asp">Registration</A> | <A 
                  href="products.asp">Items List</A> 
                |</FONT><FONT 
                  face=Tahoma size=2> </FONT><FONT 
                  face=Tahoma color=#ff00ff size=2> <A href="Itempost.asp">Post Item</A> 
                | <A href="myacc.asp">My Account</A> 
                | <A href="forum.htm">Forum</A> | <A href="help.htm">Help</A> | <A href="feedback.htm">Feedback</A></FONT></B></P></TD></TR>
              <TR>
                <TD vAlign=top width="100%" bgColor=#6666CC colSpan=2 
                  height=20><FONT face=Tahoma><B>
                  <FORM name=search action=products.asp>
                  <P align=left><FONT color=#473275 
                  size=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
                  <FONT color=#FFFFFF 
                  size=2>&nbsp; Search </FONT><FONT color=#473275 
                  size=2>: </FONT><FONT color=#473275><INPUT name=T1 size="20" > <INPUT style="WIDTH: 40px" type=submit value=Go name=B1 width="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  &nbsp;</FONT><FONT face=Tahoma size=2><% if session("uid")= "" then %><A href="Login.asp"><font color="#FFFFFF">Login</font></A>
                  <%else %>
                  <A href="Logout.asp"><font color="#FFFFFF">Logout</font></A><font color="#FFFFFF">
                  <%end if%> </font>
                  </FONT></P></B></FONT></FORM></TD></TR>
              <TR>
                <TD vAlign=top width="22%" bgColor=#ffcc00 height=384>
                  <TABLE id=AutoNumber6 style="BORDER-COLLAPSE: collapse" 
                  borderColor=#111111 height=65 cellSpacing=0 cellPadding=0 
                  width="100%" border=0>
                    
                    <TR>
                      <TD borderColor=#6f57a4 align=middle width="100%" 
                      bgColor=#000066 height=26><B><FONT face=Tahoma 
                        color=#ffffff size=2>B2B Categories</FONT></B></TD></TR>
                    <TR>
				<% do while not rs.eof %>
                          <TD width="100%" height=39><B><U><A 
                        href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> </A></U></B>&nbsp;</TD></TR>
			  <%rs.movenext%>
  			   <%loop%>
              </TABLE></TD>
                <TD vAlign=top width="78%" bgColor=#ffffff height=382> 
                <TABLE style="WIDTH: 595px; HEIGHT: 30px" cellSpacing=1 
                  cellPadding=1 width=595 border=1>
                    
                    <TR>
                      <TD height="1" bgcolor="#0000ff"><font color="#FFFFFF">
						UserId</font></TD>
                      <TD height="1" bgcolor="#0000ff"><font color="#FFFFFF">
						Date</font></TD>
                      <TD height="1" bgcolor="#0000ff"><font color="#FFFFFF">
						Topic</font></TD>
                      <TD height="1" bgcolor="#0000ff"><font color="#ffffff">View</font></TD></TR>
                    <%Do while not RSS.EOF %>
                    <TR>                  
                      <TD height="1"><%=Rss.Fields(0)%></TD>
                      <TD height="1"><%=Rss.Fields(1)%></TD>
                      <TD height="1"><%=Rss.Fields(2)%></TD>
                      <TD height="1"><%=Rss.Fields(3)%></TD>
                    </TR>
                    <% RSS.MoveNext %>
                    <% loop %>
                    </TABLE>
                <p>&nbsp;</p>
                <p align="center"><font color="#0000ff"><b>Post Your Message</b></font></p>
                <FORM name="forum" action="forum.asp" method="get">
                <table border="0" cellpadding="2" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="595" id="AutoNumber7" height="140">
                  <tr>
                    <td width="286" align="right" height="22">User Name</td>
                    <td width="306" height="22"><%=Session("uid")%></td>
                  </tr>
                  <tr>
                    <td width="286" align="right" height="22">Topic</td>
                    <td width="306" height="22"> 
                  <INPUT MAXLENGTH="12" SIZE="33" NAME="Topic" ></td>
                  </tr>
                  <tr>
                    <td width="286" align="right" height="31">Message</td>
                    <td width="306" height="31"><TEXTAREA id=TEXTAREA1 style="WIDTH: 271px; HEIGHT: 38px" name=Message rows=1 cols=29></TEXTAREA></td>
                  </tr>
                  <tr>
                    <td width="592" align="right" colspan="2" height="19">
                        <P align=center><INPUT style="WIDTH: 102px; HEIGHT: 24px" type=Button size=48 value=Post name=submit1 onClick="runSubmit()">&nbsp;</P></td>
                  </tr>
                  </table>
                </FORM>
                </TD></TD></TR></TABLE></TD></TR>
        <TR>
          <TD vAlign=top width="95%" bgColor=#473275 height=17>
            <P align=center><B><FONT face=Tahoma color=#c8bfdd size=2>Copyright 
            © 2004. All product names are trademarks of their respective 
            companie</FONT></B></P></TD></TR></TABLE></TD></TR></TBODY></TABLE></CENTER>
</body>
</html>