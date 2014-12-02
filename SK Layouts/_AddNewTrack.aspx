<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_AddNewTrack.aspx.cs" Inherits="SK_Layouts.AddNewTrack" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        html, body, #map-canvas {
            width: 800px;
            height: 600px;
            margin: 0px;
            padding: 0px;
        }
    </style>
            <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script>
    var map;
    function initialize() {
        var mapOptions = {
            zoom: 14, // Zoom in close to see ski relevant info
            center: new google.maps.LatLng(49.4575, -115.08694) // Center on Fernie : 49.4575, -115.08694
        };
        map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
    }

    google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <div id="map-canvas"></div>
        <asp:listbox runat="server"></asp:listbox>    
    </form>
</body>
</html>

