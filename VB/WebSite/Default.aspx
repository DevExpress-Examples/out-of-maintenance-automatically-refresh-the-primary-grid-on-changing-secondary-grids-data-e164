<%-- BeginRegion Page setup --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Grid_Editing_BatchUpdate_GridInPopupControl_EditingGridInPopupControl" %>

<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v7.3" Namespace="DevExpress.Web.ASPxEditors"  TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v7.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v7.3" Namespace="DevExpress.Web.ASPxPager" TagPrefix="dxwp" %>
<%@ Register Assembly="DevExpress.Web.v7.3" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
	<title>Automatically refresh the primary grid on changing secondary grid's data</title>
<script language="javascript" type="text/javascript">
function OnProductUpdate() {    
	gridProducts.UpdateEdit();
	//re-render grid with new product names and prices
	grid.PerformCallback();
}
</script>

</head>
<body>
	<form id="form1" runat="server">

	<dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="mainSource" KeyFieldName="Id" Width="300px" OnCustomCallback="grid_CustomCallback" >
		<%-- BeginRegion Grid Columns --%>
		<Columns>
			<dxwgv:GridViewCommandColumn VisibleIndex="0">
				<NewButton Visible="True" />
				<EditButton Visible="True"/>
				<DeleteButton Visible="True"/>
			</dxwgv:GridViewCommandColumn>
			<dxwgv:GridViewDataColumn FieldName="Id" VisibleIndex="1">
				<EditFormSettings Visible="false" />
			</dxwgv:GridViewDataColumn>
			 <dxwgv:GridViewDataComboBoxColumn FieldName="ProductId" Caption="Product" VisibleIndex="1">
				 <PropertiesComboBox DataSourceID="productSource" TextField="Name" ValueField="Id" DropDownHeight="150px">
				 </PropertiesComboBox>
			 </dxwgv:GridViewDataComboBoxColumn>
			<dxwgv:GridViewDataColumn FieldName="Quantity" VisibleIndex="3">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataTextColumn FieldName="Price" VisibleIndex="4">
				<PropertiesTextEdit DisplayFormatString="c"></PropertiesTextEdit>
				<EditFormSettings Visible="false" />
			</dxwgv:GridViewDataTextColumn>
			<dxwgv:GridViewDataTextColumn FieldName="Total" VisibleIndex="5">
				<EditFormSettings Visible="false" />
				<PropertiesTextEdit DisplayFormatString="c"></PropertiesTextEdit>
			</dxwgv:GridViewDataTextColumn>
		</Columns>
		<%-- EndRegion --%>
		<Settings ShowFooter="true"/>
		 <TotalSummary>
			 <dxwgv:ASPxSummaryItem FieldName="Id" SummaryType="Count" />
			 <dxwgv:ASPxSummaryItem FieldName="Total" SummaryType="Sum" DisplayFormat="c" />
		 </TotalSummary>
		<SettingsEditing EditFormColumnCount="2" />
		<Styles>
			<Cell Wrap="False" />
		</Styles>
	</dxwgv:ASPxGridView>
	<dxpc:ASPxPopupControl HeaderText="Products" EncodeHtml="False" id="popup" runat="server" EnableViewState="False" ShowOnPageLoad="true"  AllowDragging="true"
		PopupElementID="grid" PopupHorizontalAlign="OutsideRight" PopupHorizontalOffset="10" EnableClientSideAPI="true">
		<Controls>
			<dxwgv:ASPxGridView ID="gridProducts" ClientInstanceName="gridProducts" runat="server" DataSourceID="productSource" KeyFieldName="Id" Width="300px"  OnHtmlRowCreated="gridProducts_HtmlRowCreated" >
				<%-- BeginRegion Grid Columns --%>
				<Columns>
					<dxwgv:GridViewCommandColumn VisibleIndex="0">
						<NewButton Visible="True" />
						<EditButton Visible="True"/>
					</dxwgv:GridViewCommandColumn>
					<dxwgv:GridViewDataColumn FieldName="Name" VisibleIndex="0">
					</dxwgv:GridViewDataColumn>
					<dxwgv:GridViewDataTextColumn FieldName="Price" VisibleIndex="1">
						<PropertiesTextEdit DisplayFormatString="c"></PropertiesTextEdit>
					</dxwgv:GridViewDataTextColumn>
				</Columns>
				<%-- EndRegion --%>
				<SettingsEditing Mode="Inline" />
				<SettingsBehavior AllowDragDrop="false" />
				<Styles>
					<Cell Wrap="False" />
				</Styles>
			</dxwgv:ASPxGridView>
		</Controls>
	</dxpc:ASPxPopupControl>
	<br/>
	On changing a product name and price the main grid will be automatically refreshed with the updated information.
		<asp:ObjectDataSource ID="mainSource" runat="server"
			SelectMethod="GetItems" TypeName="OrderItemsProvider" UpdateMethod="ItemUpdate" InsertMethod="ItemInsert" DeleteMethod="ItemDelete" ></asp:ObjectDataSource>
		<asp:ObjectDataSource ID="productSource" runat="server"
			SelectMethod="GetProducts" TypeName="OrderItemsProvider" UpdateMethod="ProductUpdate" InsertMethod="ProductInsert" ></asp:ObjectDataSource>
	</form>
</body>
</html>
