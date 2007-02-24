<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->


<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Bizbidz Products</title>
</head>

 <% 
 dim rsTemp
 SET rsTemp=Server.CreateObject("ADODB.Recordset")
 
 qryval=""
 qryval = request.querystring("categ")
	if qryval="" then
		Strsql="Select * from categories"
	else
		StrSql="Select * from categories where categoryID=" & cint(qryval)
	end if
	rsTemp.Open StrSql, Con
	dim catdesc
	catdesc=ucase(rsTemp.Fields(1))
	set rsTemp=nothing
	DIm Flag
	DIM RSS,rs
	SET RSS=Server.CreateObject("ADODB.Recordset")
	set rs=Server.CreateObject("ADODB.Recordset")
	dim rsCat, Cid
	Set rsCat=Server.CreateObject("ADODB.Recordset")
	rsCat.Open "Select Categoryid from Categories where Name='" & catdesc & "'",Con
	Cid=rsCat.Fields(0)
	flag=2
	sql="select Itemid,title, cbid,  DateDiff('h',Date(),DateAdd('d',items.duration,items.SDt)), NoofBids, Userid from items where categoryId=" & CID & " and DateDiff('h',Date(),DateAdd('d',items.duration,items.SDt)) > 0 order by itemid"
	if qryval="" then
		flag=1
	end if
	if Request.QueryString("T1") <> "" then
		Dim StrSearch
		StrSearch=Request.QueryString("T1")
		if instr(1,Request.QueryString("T1"),"'") then StrSearch=" "
		if instr(1,Request.QueryString("T1"),";") then StrSearch=" "
		if instr(1,Request.QueryString("T1"),",") then StrSearch=" "
		if instr(1,Request.QueryString("T1"),"?") then StrSearch=" "
		if instr(1,Request.QueryString("T1"),"%") then StrSearch=" "
		if instr(1,Request.QueryString("T1"),".") then StrSearch=" "
		if instr(1,Request.QueryString("T1"),"*") then StrSearch=" "
		if instr(1,Request.QueryString("T1"),"&") then StrSearch=" "
		flag=3
		sql="select Itemid,title, cbid,  DateDiff('h',Date(),DateAdd('d',items.duration,items.SDt)), NoofBids, UserId from items where DateDiff('h',Date(),DateAdd('d',items.duration,items.SDt)) > 0 and instr(1,ucase(items.title),'" & ucase(StrSearch) & "') order by itemid"		
	end if
	RSS.Open sql, Con, adOpenDynamic, 2, adCmdTable
	rs.Open "Select * from categories", Con
%>


<body bgcolor="#003366" topmargin="0" leftmargin="0">
<div align="center">
  <table border="3" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="78%" id="AutoNumber1">
    <tr>
      <td width="100%">
      <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="773" id="AutoNumber2" height="570">
        <tr>
              <td width="773" bgcolor="#003366" valign="top" height="460"> 
                <div align="center">
                <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#003366" width="99%" id="AutoNumber3" height="619">
                  <tr bgcolor="#003366"> 
                    <td width="100%" height="1" colspan="2">
					<p align="center"><IMG height=177 src="images/home.jpg" width=773></p></td>
            </tr>
                  <tr bgcolor="#ffffff"> 
                    <td width="100%" height="30" colspan="2"> 
                      <p align="center"><b><font color="#ff00ff" size="2" face="Tahoma"><A href="index.asp"><font color="#003366">Home</font></a><font color="#003366"> 
                        | <A href="About.htm"> About Us</a> | <A href="registration.asp">Registration</a> 
                        | <A href="products.asp">Items List</a> | <A href="Itempost.asp">Post 
                        Item</a> | <A href="myacc.asp">My Account</a> | <A href="forum.asp">Forum</a> 
                        | <A href="help.htm">Help</a> | <A href="feedback.htm">Feedback</a></font></font></b></p></td>
            </tr>
                  <tr bgcolor="#6666cc"> 
                    <td width="100%" height="47" colspan="2"> <font face="Tahoma"><b> 
                      <form name="search" action="products.asp">
                        <P align=center> <font size="2" color="#473275">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font> 
						<font size="2" color="#ffffff">Search : </font> <font color="#ffffff"> 
                          <strong>
                          <input name="T1" size="20" >
                          <input type="submit" value="Go" name="B1" style="WIDTH: 40px" width="40">
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                          &nbsp;</strong></font><strong><font color="#ffffff" size="2" face="Tahoma"> 
                          <% if session("uid")= "" then %>
                          <A href="Login.asp"><font color="#ffffff">Login&gt;&gt;</font></A> 
                          <%else %>
                          <A href="Logout.asp"><font color="#ffffff">Logou</font></A></font></strong><font face="Tahoma" size="2"><A href="Logout.asp"><font color="#ffffff">t</font></A><font color="#ffffff"> 
                          <%end if%>
                          </font>
                          </font></b></font></P></FORM>
              </td>
            </tr>
            <tr>
              <td width="21%" bgcolor="#ffcc00" height="350" valign="top">
              <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="100%" id="AutoNumber6" height="55">
                        <tr> 
                          <td width="100%" bgcolor="#000066" bordercolor="#6f57a4" align="middle" height="26"><b><font color="#ffffff" face="Tahoma" size="2"> 
                            B2B Categories</font></b></td>
                        </tr>
                        <tr> 
                          <% do while not rs.eof %>
                          <td width="100%" height="28" bgcolor="#ffcc00"> <b><u><A href="products.asp?categ=<%=rs(0)%>">
							<p align="left"><%=rs(1)%> 
                            </A></u></b></P></td>
                        </tr>
                        <%rs.movenext%>
                        <%loop%>
                      </table>
              </td>
              <td width="79%" bgcolor="#ffffff" height="350" valign="top">
              <div align="center">       <center>
             <form name="frmregister" action="forum.asp" method="post">   
                <b><% if RSS.EOF=true and flag=2 then %>
										<font color="#ff3300" face="Arial" size="2">Sorry! No 
                                          items in this category at the moment</font> <% End if %> </b><p>
				<b>
										<% if RSS.EOF=true and flag=3 then %><font color="#ff3300" face="Arial" size="2">Search 
                                          Result 0: No Items Found</font></b></p><% end if %>
                  <P><%if flag=1 then %><STRONG><FONT face=Arial color=#ff3300 size=2>No Item Title 
                  Specified</FONT></STRONG> <% end if%></P> 
                                      <table border="0" cellpadding="0" style="BORDER-COLLAPSE: collapse" bordercolor="#6f57a4" width="100%" id="table1">
                                        <tr bgcolor="#99ffff"> 
                                          <td width="14%" align="middle"><b> <font face="Tahoma" size="2" color="#003366">Item 
                                            ID</font></b></td>
                                          <td width="26%" align="middle"><b> <font face="Tahoma" size="2" color="#003366">Item 
                                            Title</font></b></td>
                                          <td width="17%" align="middle"><b>City</b></td>
                                          <td width="5%" align="middle"><b> <font face="Tahoma" size="2" color="#003366">Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
                                            (RM)</font></b></td>
                                          <td width="10%" align="middle"><b> <font face="Tahoma" size="2" color="#003366">No 
                                            of Bids</font></b></td>
                                          <td width="23%" align="middle"><b> <font face="Tahoma" size="2" color="#003366">Time 
                                            Left</font></b></td>
                                        </tr>
                                        </table>
                                        <table border="0" cellpadding="0" style="BORDER-COLLAPSE: collapse" bordercolor="#6f57a4" width="100%" id="AutoNumber5">                                        
                                        <% do while not RSS.eof %>
                                        <%
											dim rsUser
											Set rsUser=Server.CreateObject("ADODB.Recordset")								
											rsUser.Open "Select * from Users where Userid='" & RSS.Fields(5) & "'" ,Con
											dim city
											city=rsUser.Fields(12)
											rsUser.Close
                                        %>
                                        <tr> 
                                          <td width="14%" align="middle"><A href="ProdDesc.asp?PRODESC=<%=RSS(0)%>"><%=RSS(0)%>&nbsp;</a></td>
                                          <td width="25%" align="middle"><A href="ProdDesc.asp?PRODESC=<%=RSS(0)%>"><%=RSS(1)%>&nbsp;</a></td>
                                          <td width="17%" align="middle" colspan="2"><%=city %>&nbsp;</td>
                                          <td width="12%" align="middle"><%=RSS(2)%>&nbsp;</td>
                                          <td width="10%" align="middle"><%=RSS(4)%>&nbsp;</td>
                                          <td width="23%" align="middle"> <%=int((Cint(RSS(3))/24))%> 
                                                                    Days <%=(cint(RSS(3))- (24 * int((Cint(RSS(3))/24))))%> 
                                            Hours</td>
                                        </tr>
                                        <% 
                        rss.movenext
                        loop %>
                                      </table>
                      </center>
                    </div>
                    </td>
                  </tr>
                  </table></FORM>
            <CENTER>
            <p></p>
                </CENTER>
              </div>
              </td>
            </tr>
          </table>
      <DIV></DIV></td></tr></table></TD></TR></TABLE>
              	</div>

</body>

</html>