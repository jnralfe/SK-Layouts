<%@ Page Title="Snow King" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add Track.aspx.cs" Inherits="SK_Layouts.AddNewTrack1" %>

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
    <div id="file-wrapper">
            <h5>Select a file to Upload:</h5>
            <p>
                <asp:FileUpload ID="FileUpload1" runat="server" /><asp:Button ID="cmdUpload" runat="server" Text="Upload" /> &nbsp;
                You can add a new track by uploading a GPX file.  SnowKing will identify all the lifts and runs automatically!</p>
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
                            <asp:Image runat="server" ID="Image1" CssClass="run_icon" ImageUrl='<%# Eval("run_grade","~/Images/Ski_trail_rating_symbol-US-{0}.svg") %>' ToolTip='<%# DataBinder.Eval(Container.DataItem, "grade_description") %>'></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDsRuns" ConnectionString='<%$ ConnectionStrings:snowkingConnectionString %>' ProviderName='<%$ ConnectionStrings:snowkingConnectionString.ProviderName %>' SelectCommand="get_all_runs" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>
    </div>
</asp:Content>
