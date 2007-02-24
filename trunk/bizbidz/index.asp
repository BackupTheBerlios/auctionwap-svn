<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>BizBidz system</title>
</head>
<%
	Dim rs, path
	set rs=Server.CreateObject("ADODB.Recordset")
	rs.Open "Select * from Categories", Con
	path=Server.MapPath("Uploads")
%>
<body bgcolor="#003366" topmargin="0" leftmargin="0">
<div align="center">
  <center>
    <table width="772" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" id="AutoNumber1" style="border-collapse: collapse">
      <tr>
        <td width="100%" align="center" bgcolor="#000066"> 
          <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" id="AutoNumber3" width="98%">
            <tr bgcolor="#003366"> 
              <td height="68" colspan="2" align="center"> <img src="images/home.jpg" width="773" height="177"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="32" colspan="2" align="center"> 
                <div align="center"><b><font color="#FF00FF" size="2" face="Tahoma"><a href="index.asp"><font color="#003366">Home</font></a><font color="#003366"> 
                  | <a href="About.htm"> About Us</a> | <a href="registration.asp">Registration</a> 
                  | <a href="products.asp">Items List</a> | <a href="Itempost.asp">Post 
                  Item</a> | <a href="myacc.asp">My Account</a> | <a href="forum.asp">Forum</a> 
                  | <a href="help.htm">Help</a> | <a href="feedback.htm">Feedback</a></font></font></b> 
                </div>
                </td>
            </tr>
            <tr bgcolor="#6666CC"> 
              <td colspan="2" align="center"> 
                <form name="search" action="products.asp">
                  <p align="left"> <font size="2" color="#473275">&nbsp;&nbsp;<strong> 
                    &nbsp;<font color="#FFFFFF" face="Tahoma">Welcome Back <%=Session("uid")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Search :</font></strong><b><font face="Tahoma">
					</font></b> </font><font color="#473275"> 
                    <input name="T1" size="20">
                    <input type="submit" value="Go" name="B1" style="WIDTH: 40px" width="40">
                    &nbsp;</font><font face="Tahoma" size="2"> 
                    <% if session("uid")= "" then %>
                    &nbsp;&nbsp;&nbsp;<strong><font color="#FFFFFF">&nbsp; 
                    <A href="Login.asp"><font color="#FFFFFF">Login&gt;&gt;</font></a></font></strong><b><font color="#FFFFFF">
                    <%else %>
                    <A href="Logout.asp"><font color="#FFFFFF">Logout</font></a> 
                    <%end if %>
                    </font></b> </font></p>
              </FORM>
                <p align="right"><b><font color="#FFFFFF"  > 
                  <script src="dt.js"></script>
                  </font></b></p></td>
            </tr>
            <tr> 
              <td width="21%" height="622" align="center" valign="top" bgcolor="#FFCC00"> 
                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber6" height="66">
                  <tr> 
                    <td width="100%" bgcolor="#000066" bordercolor="#6F57A4" align="center" height="29"><div align="center"><b><font color="#ffffff" face="Tahoma" size="2"> 
                        B2B Categories</font></b></div></td>
                  </tr>
                  <tr> 
                    <% do while not rs.eof %>
                    <td width="100%" height="37" bgcolor="#FFCC00"> <b><u><a href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> 
                      </a></u></b>&nbsp;</td>
                  </tr>
                  <%rs.movenext%>
                  <%loop%>
                </table>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
              </td>
              <td width="568" height="622" valign="top" bordercolor="#FFFF00" bgcolor="#FFFFFF"> 
              <%
					Dim rsImg
					Dim CurrentPage,rCount,PageCount
					if Request.QueryString("cp") <> "" then
						CurrentPage=Cint(Request.QueryString("cp"))
					end if
					rCount=0
					set rsImg=Server.CreateObject("ADODB.Recordset")
					rsImg.Open "Select itemid, Title, piclocation from items where featuredeals=1 and finished=false", Con
					while not rsImg.EOF
						rCount=rCount + 1
						rsImg.MoveNext
					Wend
					rsImg.MoveFirst
					PageCount=int(rCount/9)
					if(rCount mod 9) > 1 then
						PageCount=PageCount + 1
					end if
					if Request.QueryString("Nav") = "pre" then
						CurrentPage=CurrentPage -2
					end if
					rsImg.Move CurrentPage * 9
              %>
                <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber7" height="572">
                  <tr>
                    <td width="100%" height="26" colspan="3"><i><b>
                    <font color="#0000FF">Featured Deals</font></b></i></td>
                  </tr>
                  <tr>
                    <td width="33%" height="178">
					<p align="center"><% if rsImg.EOF <> true then %>
                    <a href="ProdDesc.asp?PRODESC=<%=rsImg.fields(0)%>"> <%=rsImg.fields(1)%> 
                    <img name="image1" src="<% =path & "\" & rsImg.Fields(2)%>"
                    width="199" height="170" alt="" ><%end if %></a></td>
                    <td width="33%" height="178">
                    <p align="center">
                    <% rsImg.MoveNext %>
                    <% if rsImg.EOF <> true then %>                   
					<a href="ProdDesc.asp?PRODESC=<%=rsImg.fields(0)%>"> <%=rsImg.fields(1)%> 
                    <img name="image2" src="<% =path & "\" & rsImg.Fields(2)%>" width="199" height="170" alt="">
                    <%end if %></a>
                    </td>                    
                    <td width="34%" height="178">
                    <p align="center">
                    <% rsImg.MoveNext %>
                    <% if rsImg.EOF <> true then %>
                    <a href="ProdDesc.asp?PRODESC=<%=rsImg.fields(0)%>"> <%=rsImg.fields(1)%>
                    <img name="image3" src="<% =path & "\" & rsImg.Fields(2)%>" width="199" height="170" alt="">
                    <%end if %></a>
                    </td>
                  </tr>
                  <tr>
                    <td width="33%" height="165">
                    <p align="center">
                    <% rsImg.MoveNext %>
                    <% if rsImg.EOF <> true then %>
                    <a href="ProdDesc.asp?PRODESC=<%=rsImg.fields(0)%>"> <%=rsImg.fields(1)%>
                    <img name="image4" src="<% =path & "\" & rsImg.Fields(2)%>" width="199" height="170" alt="">
                    <%end if %></a>
                    </td>                    
                    <td width="33%" height="165">
                    <p align="center">
                    <% rsImg.MoveNext %>
                    <% if rsImg.EOF <> true then %>
                    <a href="ProdDesc.asp?PRODESC=<%=rsImg.fields(0)%>"> <%=rsImg.fields(1)%>
                    <img name="image5" src="<% =path & "\" & rsImg.Fields(2)%>" width="199" height="170" alt="">
                    <%end if %></a>
                    </td>
                    <td width="34%" height="165">
                    <p align="center">
                    <% rsImg.MoveNext %>
                    <% if rsImg.EOF <> true then %>	                    
                    <a href="ProdDesc.asp?PRODESC=<%=rsImg.fields(0)%>"> <%=rsImg.fields(1)%>
                    <img name="image6" src="<% =path & "\" & rsImg.Fields(2)%>" width="199" height="170" alt="">
                    <%end if %></a>
                    </td>
                  </tr>
                  <tr>
                    <td width="33%" height="193">
                    <p align="center">
                    <% rsImg.MoveNext %>
                    <% if rsImg.EOF <> true then %>	                    
                    <a href="ProdDesc.asp?PRODESC=<%=rsImg.fields(0)%>"> <%=rsImg.fields(1)%>
                    <img name="image7" src="<% =path & "\" & rsImg.Fields(2)%>" width="200" height="170" alt="">
                    <%end if %></a>
                    </td>
                    <td width="33%" height="193">
					<p align="center">
					<% rsImg.MoveNext %>
                    <% if rsImg.EOF <> true then %>	
                    <a href="ProdDesc.asp?PRODESC=<%=rsImg.fields(0)%>"> <%=rsImg.fields(1)%>
                    <img name="image8" src="<% =path & "\" & rsImg.Fields(2)%>" width="200" height="170" alt="">
                    <%end if %></a>
                    </td>
                    <td width="34%" height="193">
                    <p align="center">
                    <% rsImg.MoveNext %>
                    <% if rsImg.EOF <> true then %>	                    
                    <a href="ProdDesc.asp?PRODESC=<%=rsImg.fields(0)%>"> <%=rsImg.fields(1)%>
                    <img name="image9" src="<% =path & "\" & rsImg.Fields(2)%>" width="200" height="170" alt="">
                    <%end if %></a>
                    </td>
                  </tr>
                </table>
                <% CurrentPage=CurrentPage + 1 %>               
              <p align="right">Page <%=CurrentPage%> of <%=PageCount%> Pages <br>
				<%if CurrentPage > 1  then %>
				<% Response.Write ("<A href=Index.asp?cp=" & CurrentPage & "&Nav=pre> Previous </a>") %>
				<% end if %> 
				<%if CurrentPage < PageCount then %>
				<% Response.Write ("<A href=Index.asp?cp=" & CurrentPage & "&Nav=Next> Next </a>") %>
				<% end if %> 
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