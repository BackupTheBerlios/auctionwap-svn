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
		Strsql="Select * from catogeries"
	else
		StrSql="Select * from catogeries where catogeryID=" & cint(qryval)
	end if
	rsTemp.Open StrSql, Con
	dim catdesc
	catdesc=ucase(rsTemp.Fields(1))
	'Response.Write catdesc
	'Response.End
	set rsTemp=nothing
	DIm Flag
	DIM RSS,rs
	SET RSS=Server.CreateObject("ADODB.Recordset")
	set rs=Server.CreateObject("ADODB.Recordset")
	if qryval="" then
		flag=1
		'sql="select * from item_seller where starting_bid=#"& date & "#"
		sql="SELECT Itemid,title, Price, DateDiff('h',Date(),DateAdd('d',items.duration,items.SDt)), NoofBids FROM Items where DateDiff('h',Date(),DateAdd('d',items.duration,items.SDt)) > 0" ' WHERE day(starting_bid)=" & day(date) & " and month(starting_bid)=" & month(date) & " and year(starting_bid)=" & year(date) & ""
	else
		flag=2
		sql="select Itemid,title, Price,  DateDiff('h',Date(),DateAdd('d',items.duration,items.SDt)), NoofBids from items where ucase(category)='" &catdesc & "' and DateDiff('h',Date(),DateAdd('d',items.duration,items.SDt)) > 0" ' _seller where item_category='" & qrystr & "'"
	end if
	if Request.QueryString("T1") <> "" then
		flag=3
		sql="select Itemid,title, Price,  DateDiff('h',Date(),DateAdd('d',items.duration,items.SDt)), NoofBids from items where instr(1,ucase(items.category),'" & ucase(Request.QueryString("T1")) & "') or instr(1,ucase(items.title),'" & ucase(Request.QueryString("T1")) & "') "
	end if
	'Response.Write sql
	'response.end
'response.write(sql)
RSS.Open sql, Con, adOpenDynamic, 2, adCmdTable
rs.Open "Select * from catogeries", Con
%>


<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">
<div align="center">
  <center>
  <table border="3" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="37%" id="AutoNumber1">
    <tr>
      <td width="100%">
      <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="780" id="AutoNumber2" height="570">
        <tr>
          <td width="607" bgcolor="#6f57a4" valign="top" height="460">
          <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="128%" id="AutoNumber3" height="568">
            <tr>
              <td width="79%" bgcolor="#ffffff" height="488" valign="top">
              <div align="center">       <center>
             <form name="frmregister" action="forum.asp" method="post">   
                <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="100%" id="AutoNumber4" height="380">
                  <tr>
                    <td width="100%" bgcolor="#FFFFFF" height="182" valign="top">
                    <div align="center">
                      <center>
                      <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#6f57a4" width="99%" id="AutoNumber5" height="185">
                        <tr>
                          <td width="100%" align="middle" bgcolor="#FFFFFF" height="80" colspan="5">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="1%" align="middle" bgcolor="#6f57a4" height="48"><b>
                          <font face="Tahoma" size="2" color="#ffffff">Item ID</font></b></td>
                          <td width="14%" align="middle" bgcolor="#6f57a4" height="48"><b>
                          <font face="Tahoma" size="2" color="#ffffff">Item 
                          Title</font></b></td>
                          <td width="12%" align="middle" bgcolor="#6f57a4" height="48"><b>
                          <font face="Tahoma" size="2" color="#ffffff">Price (RM)</font></b></td>
                          <td width="9%" align="middle" bgcolor="#6f57a4" height="48"><b>
                          <font face="Tahoma" size="2" color="#ffffff">No of 
                          Bids</font></b></td>
                          <td width="82%" align="middle" bgcolor="#6f57a4" height="48"><b>
                          <font face="Tahoma" size="2" color="#ffffff">Time Left</font></b></td>
                        </tr>
                        <% if RSS.EOF=true then%>
							<% if Flag=1 or Flag=2 then%>
							<td width="21%" align="middle" height="19">Sorry No Items in this category at the moment</td>
							<%End if%>
							<%if flag=3 then %>			
							<td width="28%" align="middle" height="19">Search Result 0: No Items Found</td> 
							<%End if%>				
                        <%end if%>
                        <% do while not RSS.eof %>
                        <tr>
                          <td width="1%" align="middle" height="38"><a href="ProdDesc.asp?PRODESC=<%=RSS(0)%>"><%=RSS(0)%></a></td>
                          <td width="14%" align="middle" height="38"><a href="ProdDesc.asp?PRODESC=<%=RSS(0)%>"><%=RSS(1)%>&nbsp;</td>
                          <td width="12%" align="middle" height="38"><%=RSS(2)%>&nbsp;</td>
                          <td width="9%" align="middle" height="38"><%=RSS(4)%>&nbsp;</td>
                          <td width="82%" align="middle" height="38"> <%=int((Cint(RSS(3))/24))%>                               Days <%=(cint(RSS(3))- (24 * int((Cint(RSS(3))/24))))%> Hours</td>
                        </tr>
                        <% 
                        rss.movenext
                        loop %>
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