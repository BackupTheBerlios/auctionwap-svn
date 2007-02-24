<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<% 
	Session("uid")=""
	Session("inv")=""
	Session("bidval")=""
	Session("itemid")=""
	Response.Redirect("Index.asp")
%>