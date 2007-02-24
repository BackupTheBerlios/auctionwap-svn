Imports System.Data.OleDb
Public Class CatBrowse
    Inherits System.Web.UI.MobileControls.MobilePage

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label1 As System.Web.UI.MobileControls.Label
    Protected WithEvents item1 As System.Web.UI.MobileControls.Link
    Protected WithEvents item2 As System.Web.UI.MobileControls.Link
    Protected WithEvents item3 As System.Web.UI.MobileControls.Link
    Protected WithEvents item4 As System.Web.UI.MobileControls.Link
    Protected WithEvents item5 As System.Web.UI.MobileControls.Link
    Protected WithEvents Label2 As System.Web.UI.MobileControls.Label
    Protected WithEvents lnkNext As System.Web.UI.MobileControls.Link
    Protected WithEvents Label3 As System.Web.UI.MobileControls.Label
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
        Dim CatID, PageCount, CurrentPage, rCount As Integer
        If Request.QueryString.Get("cp") <> "" Then
            CurrentPage = Integer.Parse(Request.QueryString.Get("cp"))
        Else
            CurrentPage = 0
        End If
        Con.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("Auction.mdb") & ";Persist Security Info=False"
        CatID = Integer.Parse(Request.QueryString.Get("cat"))
        Sql = "Select * from Categories where categoryid=" & CatID
        Con.Open()
        Cmd = New OleDbCommand(Sql, Con)
        Dr = Cmd.ExecuteReader
        Dr.Read()
        Label1.Text = Dr.GetValue(1)
        Con.Close()
        Sql = "Select title,itemid from items where categoryid=" & CatID
        Con.Open()
        Cmd = New OleDbCommand(Sql, Con)
        Dr = Cmd.ExecuteReader
        rCount = 0
        While Dr.Read
            rCount = rCount + 1
        End While
        PageCount = Int(rCount / 5)
        If (rCount Mod 5) > 1 Then
            PageCount = PageCount + 1
        End If
        If Con.State = ConnectionState.Open Then
            Con.Close()
        End If
        Con.Open()
        Dr = Cmd.ExecuteReader
        Dim i As Integer
        For i = 1 To (CurrentPage * 5)
            Dr.Read()
        Next
        If Dr.HasRows Then
            If Dr.Read() Then
                item1.Text = "1." & Dr.GetValue(0)
                item1.NavigateUrl = "WapBid.aspx?itemid=" & Dr.GetValue(1)
                rCount = rCount + 1
            Else
                item1.Visible = False
            End If
            If Dr.Read() Then
                item2.Text = "2." & Dr.GetValue(0)
                item3.NavigateUrl = "WapBid.aspx?itemid=" & Dr.GetValue(1)
                rCount = rCount + 1
            Else
                item2.Visible = False
            End If
            If Dr.Read() Then
                item3.Text = "3." & Dr.GetValue(0)
                item3.NavigateUrl = "WapBid.aspx?itemid=" & Dr.GetValue(1)
                rCount = rCount + 1
            Else
                item3.Visible = False
            End If
            If Dr.Read() Then
                item4.Text = "4." & Dr.GetValue(0)
                item4.NavigateUrl = "WapBid.aspx?itemid=" & Dr.GetValue(1)
                rCount = rCount + 1
            Else
                item4.Visible = False
            End If
            If Dr.Read() Then
                item5.Text = "5." & Dr.GetValue(0)
                item5.NavigateUrl = "WapBid.aspx?itemid=" & Dr.GetValue(1)
                rCount = rCount + 1
            Else
                item5.Visible = False
            End If
        End If
        CurrentPage = CurrentPage + 1
        Label2.Text = "Page " & CurrentPage & " of " & PageCount
        If CurrentPage < PageCount Then
            lnkNext.Visible = True
            lnkNext.NavigateUrl = "CatBrowse.aspx?cp=" & CurrentPage & "&cat=" & CatID
        Else
            lnkNext.Visible = False
        End If
    End Sub

    Private Sub Form1_Activate(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Form1.Activate

    End Sub
End Class
