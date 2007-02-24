Imports System.Data.OleDb
Public Class Category
    Inherits System.Web.UI.MobileControls.MobilePage

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents cat1 As System.Web.UI.MobileControls.Link
    Protected WithEvents cat2 As System.Web.UI.MobileControls.Link
    Protected WithEvents cat3 As System.Web.UI.MobileControls.Link
    Protected WithEvents cat4 As System.Web.UI.MobileControls.Link
    Protected WithEvents cat5 As System.Web.UI.MobileControls.Link
    Protected WithEvents Form1 As System.Web.UI.MobileControls.Form

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        Dim Sql As String
        Dim Con As New OleDb.OleDbConnection
        Dim Cmd As OleDb.OleDbCommand
        Dim Dr As OleDb.OleDbDataReader

        Sql = "Select Name from Categories"
        Con.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("Auction.mdb") & ";Persist Security Info=False"
        Con.Open()
        Cmd = New OleDbCommand(Sql, Con)
        Dr = Cmd.ExecuteReader
        Dr.Read()
        cat1.Text = "1." & Dr.GetValue(0)
        cat1.NavigateUrl = "CatBrowse.aspx?cat=1"
        Dr.Read()
        cat2.Text = "2." & Dr.GetValue(0)
        cat2.NavigateUrl = "CatBrowse.aspx?cat=2"
        Dr.Read()
        cat3.Text = "3." & Dr.GetValue(0)
        cat3.NavigateUrl = "CatBrowse.aspx?cat=3"
        Dr.Read()
        cat4.Text = "4." & Dr.GetValue(0)
        cat4.NavigateUrl = "CatBrowse.aspx?cat=4"
        Dr.Read()
        cat5.Text = "5." & Dr.GetValue(0)
        cat5.NavigateUrl = "CatBrowse.aspx?cat=5"
        Con.Close()
    End Sub

    Private Sub Form1_Activate(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Form1.Activate

    End Sub
End Class
