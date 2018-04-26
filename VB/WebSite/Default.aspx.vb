Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class Grid_Editing_BatchUpdate_GridInPopupControl_EditingGridInPopupControl
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
    End Sub
    Protected Sub gridProducts_HtmlRowCreated(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs)
        If e.VisibleIndex <> gridProducts.EditingRowVisibleIndex Then
            Return
        End If
        Dim cell As TableCell = e.Row.Cells(0)
        cell.Controls.Clear()
        cell.Controls.Add(CreateHyperlink("Update", "OnProductUpdate();"))
        cell.Controls.Add(CreateHyperlink("Cancel", "gridProducts.CancelEdit();"))

    End Sub
    Private Function CreateHyperlink(ByVal text As String, ByVal navigateUrl As String) As HyperLink
        Dim link As New HyperLink()
        link.Text = text
        link.NavigateUrl = "javascript:" & navigateUrl
        Return link
    End Function
    Protected Sub grid_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
        'recalc totals
        grid.DataBind()
    End Sub
End Class
