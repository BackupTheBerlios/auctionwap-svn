<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="CatBrowse.aspx.vb" Inherits="WapAuction.CatBrowse" %>
<HEAD>
	<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
	<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/Mobile/Page">
</HEAD>
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm">
	<mobile:Form id="Form1" runat="server">
		<P>Items in category <BR>
<mobile:Label id="Label1" runat="server">Label</mobile:Label><BR>
<mobile:Label id="Label2" runat="server">Label</mobile:Label><BR>
<mobile:Link id="lnkNext" runat="server">Next Page</mobile:Link><BR><BR>
<mobile:Link id="item1" runat="server">Link</mobile:Link><BR>
<mobile:Link id="item2" runat="server">Link</mobile:Link><BR>
<mobile:Link id="item3" runat="server">Link</mobile:Link><BR>
<mobile:Link id="item4" runat="server">Link</mobile:Link><BR>
<mobile:Link id="item5" runat="server">Link</mobile:Link><BR>
<mobile:Label id="Label3" runat="server" Visible="False">0</mobile:Label></P>
	</mobile:Form>
</body>
