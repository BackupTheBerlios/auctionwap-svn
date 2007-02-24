<% 
dim Con
SET Con = Server.CreateObject("ADODB.Connection")
Con.CursorLocation=2
Con.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("Auction.mdb") & ";Persist Security Info=False"
%>