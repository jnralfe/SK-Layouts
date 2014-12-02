<%@ Page Title="" Language="C#" MasterPageFile="~/SlimLine.Master" AutoEventWireup="true" CodeBehind="Resorts.aspx.cs" Inherits="SK_Layouts.Resorts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<asp:DropDownList ID="ddlSectors" runat="server" AutoPostBack="true" DataSourceID="DropDownDataSource"
    DataTextField="sector_name" DataValueField="sector_name" AppendDataBoundItems="true">
    <asp:ListItem Text="All Countries" Value="" />
</asp:DropDownList>
<asp:SqlDataSource ID="DropDownDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:snowkingConnectionString %>" ProviderName='<%$ ConnectionStrings:snowkingConnectionString.ProviderName %>'
    SelectCommand="SELECT DISTINCT sector_name FROM Sectors"></asp:SqlDataSource>    
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="resort_id" DataSourceID="SqlDsResorts">
        <Columns>
            <asp:BoundField DataField="country_name" HeaderText="Country" SortExpression="country_name"></asp:BoundField>
            <asp:BoundField DataField="region_name" HeaderText="Region" SortExpression="region_name"></asp:BoundField>
            <asp:BoundField DataField="state_name" HeaderText="State" SortExpression="state_name"></asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="resort_id"
                DataNavigateUrlFormatString="~/ResortView.aspx?ID={0}"
                DataTextField="resort_name"
                HeaderText="Resort"
                SortExpression="resort_name" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDsResorts" 
        ConnectionString='<%$ ConnectionStrings:snowkingConnectionString %>' 
        ProviderName='<%$ ConnectionStrings:snowkingConnectionString.ProviderName %>' 
        SelectCommand="get_all_resorts" SelectCommandType="StoredProcedure"
        FilterExpression="sector_name = '{0}'">
    <FilterParameters>
        <asp:ControlParameter Name="sector_name" ControlID="ddlSectors" PropertyName="SelectedValue" />
    </FilterParameters>
    </asp:SqlDataSource>
</asp:Content>
