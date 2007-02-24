<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->


<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>online biding system</title>
</head>

 <% 
DIM RSS
SET RSS=Server.CreateObject("ADODB.Recordset")
RSS.Open "forum", Con, adOpenDynamic, 2, adCmdTable
 RSS.ADDNEW
	RSS(0)	=REQUEST.FORM("T1")
	RSS(1)	=REQUEST.FORM("T2")
	RSS(2)	=REQUEST.FORM("T3")
	RSS(3)	=REQUEST.FORM("T4")
RSS.UPDATE

RSS.CLOSE
SET RSS=NOTHING
SET RSS=Server.CreateObject("ADODB.Recordset")
RSS.Open "forum", Con, adOpenDynamic, 2, adCmdTable

%>

<body bgcolor="#473275" topmargin="0" leftmargin="0">

<div align="center">
  <center>
  <table border="3" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" width="37%" id="AutoNumber1" background="images/home.jpg">
    <tr>
      <td width="100%">
      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="780" id="AutoNumber2" height="570">
        <tr>
          <td width="20%" height="110">&nbsp;</td>
          <td width="80%" height="110">&nbsp;</td>
        </tr>
        <tr>
          <td width="20%" height="460">&nbsp;</td>
          <td width="80%" bgcolor="#6F57A4" valign="top" height="460">
          <table border="2" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" width="99%" id="AutoNumber3" height="387">
            <tr>
              <td width="100%" bgcolor="#FFFFFF" height="16">
              <p align="center"><b><font face="Tahoma" size="2" color="#473275">
              <a style="text-decoration: none" href="index.htm">
              <font color="#473275">Home</font></a> |</font><font face="Tahoma" size="2" color="#6F57A4"><a href="about.htm" style="text-decoration: none"><font color="#473275">About 
              us</font></a></font><font face="Tahoma" size="2" color="#473275">
              | <a style="text-decoration: none" href="registration.asp">
              <font color="#473275">Registration</font></a> |
              <a style="text-decoration: none" href="post_item.htm">
              <font color="#473275">Post Item</font></a> |
              <font color="#473275">
              <a href="my_account.htm" style="text-decoration: none">
              <font color="#473275">My Account</font></a> | 
              <a href="forum.htm" style="text-decoration: none">
              <font color="#473275">Forums</font></a> |&nbsp;Help | Feedback</font></a><a href="aaa/contact.htm" style="text-decoration: none"><font color="#473275">
              </font></a> </font></b></td>
            </tr>
            <tr>
              <td width="100%" bgcolor="#6F57A4" height="19">&nbsp;</td>
            </tr>
            <tr>
              <td width="100%" bgcolor="#FFFFFF" height="350" valign="top">
              &nbsp;<div align="center">
                <center>
             <form name="frmregister" action="forum.asp" method="post">   
                <table border="3" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" width="98%" id="AutoNumber4" height="386">
                  <tr>
                    <td width="100%" bgcolor="#DFDAEB" height="188" valign="top">
                    <p align="center"><b><font face="Tahoma" color="#473275">
                    Forums</font></b></p>
                    <div align="center">
                      <center>
                      <table border="3" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#6F57A4" width="91%" id="AutoNumber5">
                        <tr>
                          <td width="18%" align="center" bgcolor="#6F57A4"><b>
                          <font face="Tahoma" size="2" color="#FFFFFF">Date</font></b></td>
                          <td width="44%" align="center" bgcolor="#6F57A4"><b>
                          <font face="Tahoma" size="2" color="#FFFFFF">Topic</font></b></td>
                          <td width="20%" align="center" bgcolor="#6F57A4"><b>
                          <font face="Tahoma" size="2" color="#FFFFFF">User ID</font></b></td>
                          <td width="18%" align="center" bgcolor="#6F57A4"><b>
                          <font face="Tahoma" size="2" color="#FFFFFF">Views</font></b></td>
                        </tr>
                        <% do while not RSS.eof %>
                        <tr>
                          <td width="18%" align="center"><%=RSS(0)%>&nbsp;</td>
                          <td width="44%" align="center"><%=RSS(1)%>&nbsp;</td>
                          <td width="20%" align="center"><%=RSS(2)%>&nbsp;</td>
                          <td width="18%" align="center"><%=RSS(3)%>&nbsp;</td>
                        </tr>
                        <% RSS.movenext
                        loop
                        RSS.CLOSE
						SET RSS=NOTHING
						 %>
                        <tr>
                          <td width="100%" align="center" colspan="4">
                          &nbsp;&nbsp;&nbsp; </td>
                        </tr>
                      </table>
                      </center>
                    </div>
                    </td>
                  </tr>
                  <tr>
                    <td width="100%" bgcolor="#DFDAEB" height="194" valign="top">
                    <p align="center"><b>
                    <font face="Tahoma" size="2" color="#473275">Post your 
                    massage</font></b></p>
                    <div align="center">
                      <center>
                      
                      <table border="3" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" width="57%" id="AutoNumber6">
                        <tr>
                          <td width="49%" bgcolor="#C7BEDE" valign="middle" align="center">
                          <p align="center"><b>
                          <font face="Tahoma" size="2" color="#473275">User Name</font></b></td>
                          <td width="51%" align="center">
                          <input type="text" name="T1" size="20"></td>
                        </tr>
                        <tr>
                          <td width="49%" bgcolor="#C7BEDE" valign="middle" align="center">
                          <b><font face="Tahoma" size="2" color="#473275">Date</font></b></td>
                          <td width="51%" align="center">
                          <input type="text" name="T2" size="20"></td>
                        </tr>
                        <tr>
                          <td width="49%" bgcolor="#C7BEDE" valign="middle" align="center">
                          <b><font face="Tahoma" size="2" color="#473275">Topic</font></b></td>
                          <td width="51%" align="center">
                          <input type="text" name="T3" size="20"></td>
                        </tr>
                        <tr>
                          <td width="49%" bgcolor="#C7BEDE" valign="top" align="center">
                          <b><font face="Tahoma" size="2" color="#473275">
                          Message</font></b></td>
                          <td width="51%" align="center">
                          <textarea rows="2" name="T4" cols="16"></textarea></td>
                        </tr>
                        <tr>
                          <td width="49%" bgcolor="#C7BEDE" valign="middle" align="center">&nbsp;</td>
                          <td width="51%" align="center">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="100%" bgcolor="#C7BEDE" valign="middle" align="center" colspan="2">
                          <input type="submit" value="Post Message" name="B1"></td>
                        </tr>
                      </table>
                      
                      </center>
                    </div>
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