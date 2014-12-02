<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewTrack2.aspx.cs" Inherits="SK_Layouts.AddNewTrack2" %>
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
            <asp:DataList runat="server" RepeatColumns="2" DataSourceID="SqlDsRunsList" Visible="true" DataKeyField="local_run_name">
                <ItemStyle Wrap="False" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ></ItemStyle>
         <ItemTemplate>

            <%# DataBinder.Eval(Container.DataItem, "local_run_name") %>

         </ItemTemplate>
            </asp:DataList>
        </div>
            <asp:SqlDataSource runat="server" ID="SqlDsRunsList" ConnectionString='<%$ ConnectionStrings:snowkingConnectionString %>' ProviderName='<%$ ConnectionStrings:snowkingConnectionString.ProviderName %>' SelectCommand="select local_run_name from runs;"></asp:SqlDataSource>
    </div>
</asp:Content>