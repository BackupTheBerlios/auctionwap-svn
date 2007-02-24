<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<html>
<head>
<SCRIPT language="JavaScript" src="includes/validations.js"></SCRIPT>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Bizbidz's Registration</title>
</head>
 <% 
	qryval=""
	qryval = request.querystring("categ")
	DIM RSS,rs,rsTemp
	SET RSS=Server.CreateObject("ADODB.Recordset")
	set rs=Server.CreateObject("ADODB.Recordset")
	Set rsTemp=Server.CreateObject("ADODB.Recordset")
	
	Dim SqlStr
	RSS.Open "Select * from users where userid='" & session("uid") & "'", Con, 2, 2

	RSS(1)="'" & Request.QueryString("T2") & "'"
	RSS(2)="'" & Request.QueryString("T4") & "'"
	RSS(3)="'" & Request.QueryString("T6") & "'"
	RSS(4)="'" & Request.QueryString("T7") & "'"
	RSS(5)="'" & Request.QueryString("title") & "'"
	RSS(6)="'" & Request.QueryString("T9") & "'"
	RSS(7)="'" & Request.QueryString("T10") & "'"
	RSS(8)="'" & Request.QueryString("txtfax") & "'"
	RSS(9)="'" & Request.QueryString("T12") & "'"
	RSS(10)="'" & Request.QueryString("txtadd1") & "'"
	RSS(11)="'" & Request.QueryString("txtadd2") & "'"
	RSS(12)="'" & Request.QueryString("txtcity") & "'"
	RSS(13)="'" & Request.QueryString("txtzip") & "'"
	RSS(14)="'" & Request.QueryString("country") & "'"
	RSS(15)="'" & Request.QueryString("cato") & "'"
	
	'Response.Write SqlStr
	'Response.End
	RSS.Update
	'Con.execute SqlStr
'response.write(sql)

rs.Open "Select * from catogeries", Con
%>



<body bgcolor="#003366" topmargin="0" leftmargin="0">
<table width="102%" height="742" border="3" cellpadding="0" cellspacing="0" bordercolor="#ffffff" id="AutoNumber1" style="BORDER-COLLAPSE: collapse">
      <tr>
        <td width="100%" height="742"> 
          <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="775" id="AutoNumber2" height="570">
            <tr>
          <td width="775" bgcolor="#6f57a4" valign="top" height="460">
          <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="94%" id="AutoNumber3" height="934">
              <tr>
                <td width="100%" bgcolor="#000099" height="60" colspan="2"><img src="images/home.jpg" width="773" height="177"></td>
            </tr>
                  
              <tr bgcolor="#FFFFFF"> 
                <td width="100%" height="28" colspan="2"> 
                  <p align="center">&nbsp; <b><font color="#ff00ff" size="2" face="Tahoma"><A href="index.asp"><font color="#003366">Home</font></a><font color="#003366"> 
                    | <A href="About.htm"> About Us</a> | <A href="registration.asp">Registration</a> 
                    | <A href="products.asp">Items List</a> | <A href="Itempost.asp">Post 
                    Item</a> | <A href="myacc.asp">My Account</a> | <A href="forum.htm">Forum</a> 
                    | <A href="help.htm">Help</a> | <A href="feedback.htm">Feedbac</a></font><A href="feedback.htm"><font color="#00ff00">k</font></a></font></b></p></td>
            </tr>
                  
              <tr bgcolor="#6666CC"> 
                <td width="100%" height="51" colspan="2"> 
                  <div align="center"><font size="2" color="#473275">&nbsp;&nbsp;<strong> 
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
                    </font></b></font></div></td>
            </tr>
            <tr>
                    <td width="21%" bgcolor="#ffcc00" height="639" valign="top"> 
                      <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="100%" id="AutoNumber6" height="64">
                        <tr>
                  <td width="100%" bgcolor="#000066" bordercolor="#6f57a4" align="middle" height="25"><b><font color="#ffffff" face="Tahoma" size="2">
              B2B Categories</font></b></td>
                </tr>
                <tr>
				<% do while not rs.eof %>
                          <td width="100%" height="39"> <b><u><A href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> </a></u></b>&nbsp;</td>
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
                    <td width="79%" bgcolor="#ffffff" height="639" valign="top"> 
                      <div align="center">       <center>
             <form name="frmregister" action="forum.htm" method="post">   
                            <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="100%" id="AutoNumber4" height="598">
                              <tr>
                                <td width="100%" bgcolor="#dfdaeb" height="598" valign="top"> 
                                  <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="100%" id="AutoNumber4" height="640">
                                    <tr> 
                                      <td width="100%" bgcolor="#ffffff" height="640" valign="top"> 
                                        <p align="center"><b> <font size="2" face="Tahoma" color="#473275"><br>
                                          &nbsp;</font></b></p>
                                        <p align="center"><b> <font size="2" face="Tahoma" color="#473275"><br>
                                      <font face="Arial, Helvetica, sans-serif">&nbsp;Your 
                                      Account information has been successfully&nbsp;updated.</font></font></b></p>
                                        <p align="center"><b> <font face="Tahoma" size="2" color="#473275"> 
                                        <A href="index.asp"> 
                                          <font color="#0000ff">Home</font></a></font></b></p>
                                        <p align="center">&nbsp; </p></td>
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