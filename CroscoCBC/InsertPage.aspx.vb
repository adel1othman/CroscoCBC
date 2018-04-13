Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Public Class InsertPage
    Inherits System.Web.UI.Page


    Dim constr As String = System.Configuration.ConfigurationManager.ConnectionStrings("CROSCO_CBC_DataBazeConnectionString").ConnectionString
    Dim Ime, Prezime As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Not Request.QueryString("nm") Is Nothing) Then
            Ime = Request.QueryString("nm").ToString()
        Else
            MsgBox("nema")
        End If
        'If Not Me.IsPostBack Then
        'Ime = Request.QueryString("nm").ToString()
        Prezime = Request.QueryString("sr").ToString()
        'Ime = Request.QueryString("nm").ToString()
        Dim comstrin As String
        'comstrin = "Insert into CROSCO_CBC values ('" & Ime.ToString() & "','" & Prezime.ToString() & "')"
        comstrin = "Insert into CROSCO_CBC (IME,Prezime) VALUES ('" & Ime.ToString() & "','" & Prezime.ToString() & "')"
        MsgBox(comstrin)
        Dim con As New SqlConnection(constr)
        Dim cmd As New SqlCommand
        con.Open()
        cmd = con.CreateCommand()
        cmd.CommandType = CommandType.Text
        cmd.CommandText = comstrin
        cmd.ExecuteNonQuery()

        con.Close()
        'End If
    End Sub


End Class

Public Class CBC
    Public Property Ime() As String
        Get
            Return _Ime
        End Get
        Set(value As String)
            _Ime = value
        End Set
    End Property
    Private _Ime As String
    Public Property Prezime() As String
        Get
            Return _Prezime
        End Get
        Set(value As String)
            _Prezime = value
        End Set
    End Property
    Private _Prezime As String
End Class



