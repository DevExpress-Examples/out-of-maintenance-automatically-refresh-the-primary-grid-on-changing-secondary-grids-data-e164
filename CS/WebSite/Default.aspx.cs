using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Grid_Editing_BatchUpdate_GridInPopupControl_EditingGridInPopupControl : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void gridProducts_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e) {
        if(e.VisibleIndex != gridProducts.EditingRowVisibleIndex) return;
        TableCell cell = e.Row.Cells[0];
        cell.Controls.Clear();
        cell.Controls.Add(CreateHyperlink("Update", "OnProductUpdate();"));
        cell.Controls.Add(CreateHyperlink("Cancel", "gridProducts.CancelEdit();"));

    }
    HyperLink CreateHyperlink(string text, string navigateUrl) {
        HyperLink link = new HyperLink();
        link.Text = text;
        link.NavigateUrl = "javascript:" + navigateUrl;
        return link;
    }
    protected void grid_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e) {
        //recalc totals
        grid.DataBind();
    }
}
