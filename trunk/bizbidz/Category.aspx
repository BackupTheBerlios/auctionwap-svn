<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Category.aspx.vb" Inherits="WapAuction.Category" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>
<HEAD>
	<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
	<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
	<meta content="http://schemas.microsoft.com/Mobile/Page" name="vs_targetSchema">
</HEAD>
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm">
	<mobile:form id="Form1" title="BizBidz Categories" runat="server">
		<P>Select Category</P>
		<P>
			<mobile:Link id="cat1" runat="server" Alignment="Left">Link</mobile:Link>
			<BR>
			<mobile:Link id="cat2" runat="server" Alignment="Left">Link</mobile:Link>
			<BR>
			<mobile:Link id="cat3" runat="server" Wrapping="Wrap" Alignment="Left">Link</mobile:Link>
			<BR>
			<mobile:Link id="cat4" runat="server" Wrapping="Wrap" Alignment="Left">Link</mobile:Link>
			<BR>
			<mobile:Link id="cat5" runat="server" Wrapping="Wrap" Alignment="Left">Link</mobile:Link>
			<BR>
		</P>
	</mobile:form>
</body>
