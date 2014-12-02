<%@ Page Title="SnowKing" Language="C#" MasterPageFile="~/SlimLine.Master" AutoEventWireup="true" CodeBehind="ResortView.aspx.cs" Inherits="SK_Layouts.ResortView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        var map;
        function initialize() {
            var mapOptions = {
                zoom: 14, // Zoom in close to see ski relevant info
                center: new google.maps.LatLng(49.4575, -115.1) // Center on Fernie : 49.4575, -115.08694
            };
            map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);
        }

        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="resort-summary">
        <asp:ListView ID="listResortSummary" runat="server" DataSourceID="SqlDsResortSummary">
            <ItemTemplate>
                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "resort_name") %>'> Data</asp:Label>
                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "latitude") %>'></asp:Label>
                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "longitude") %>'></asp:Label>
            </ItemTemplate>
        </asp:ListView>
        <asp:ListView ID="listRunSummary" runat="server" DataSourceID="SqlDsRunsSummary">
            <ItemTemplate>
                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "numRuns") %>'></asp:Label>
                <asp:Image runat="server" ID="Image1" CssClass="run_icon" ImageUrl='<%# Eval("code","~/Images/Ski_trail_rating_symbol-{0}.svg") %>' ToolTip='<%# DataBinder.Eval(Container.DataItem, "description") %>'></asp:Image>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <div id="map-wrapper">
        <div id="map-canvas"></div>
            <div id="run-catalogue">
            <asp:GridView ID="grdRuns" runat="server" DataSourceID="SqlDsRuns" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="run_id" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="run_id" Visible="False"></asp:BoundField>
                    <asp:BoundField DataField="local_run_id" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="local_run_id"></asp:BoundField>
                    <asp:BoundField DataField="local_run_name" HeaderText="Name" ReadOnly="True" InsertVisible="False" SortExpression="local_run_name"></asp:BoundField>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="TextBox1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image runat="server" ID="Image1" CssClass="run_icon" ImageUrl='<%# Eval("code","~/Images/Ski_trail_rating_symbol-{0}.svg") %>' ToolTip='<%# DataBinder.Eval(Container.DataItem, "description") %>'></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDsRuns" 
                ConnectionString='<%$ ConnectionStrings:snowkingConnectionString %>' 
                ProviderName='<%$ ConnectionStrings:snowkingConnectionString.ProviderName %>' 
                SelectCommand="get_runs" SelectCommandType="StoredProcedure">
              <SelectParameters>
                  <asp:QueryStringParameter Name="_ResortId" QueryStringField="ID" Type="Int32"/>
              </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="SqlDsRunsSummary" 
                ConnectionString='<%$ ConnectionStrings:snowkingConnectionString %>' 
                ProviderName='<%$ ConnectionStrings:snowkingConnectionString.ProviderName %>' 
                SelectCommand="get_runs_summary" SelectCommandType="StoredProcedure">
              <SelectParameters>
                  <asp:QueryStringParameter Name="_ResortId" QueryStringField="ID" Type="Int32"/>
              </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="SqlDsResortSummary" 
                ConnectionString='<%$ ConnectionStrings:snowkingConnectionString %>' 
                ProviderName='<%$ ConnectionStrings:snowkingConnectionString.ProviderName %>' 
                SelectCommand="get_resort_summary" SelectCommandType="StoredProcedure">
              <SelectParameters>
                  <asp:QueryStringParameter Name="_ResortId" QueryStringField="ID" Type="Int32"/>
              </SelectParameters>
            </asp:SqlDataSource>
            </div>
    </div>
</asp:Content>