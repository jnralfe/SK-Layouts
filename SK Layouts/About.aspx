<%@ Page Title="About" Language="C#" MasterPageFile="~/SlimLine.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SK_Layouts.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Your app description page.</h2>
    </hgroup>

    <article>
        <h3>Ski Run Classifications</h3>
        <p>
            All Ski Run Classification icons in use are Licensed under Public domain via <a href="//commons.wikimedia.org/wiki/">Wikimedia Commons</a>.  Original uploader was <a href="//en.wikipedia.org/wiki/User:Down10" class="extiw" title="en:User:Down10">Down10</a> at <a class="external text" href="http://en.wikipedia.org">en.wikipedia</a> - Transfered from <a class="external text" href="http://en.wikipedia.org">en.wikipedia</a>. 
        </p>        
        <ul>

            <li>"<a href="http://commons.wikimedia.org/wiki/File:Ski_trail_rating_symbol-green_circle.svg#mediaviewer/File:Ski_trail_rating_symbol-green_circle.svg">Ski trail rating symbol-green circle</a>".</li>
            <li>"<a href="http://commons.wikimedia.org/wiki/File:Ski_trail_rating_symbol-blue_square.svg#mediaviewer/File:Ski_trail_rating_symbol-blue_square.svg">Ski trail rating symbol-blue square</a>".</li>
            <li>"<a href="http://commons.wikimedia.org/wiki/File:Ski_trail_rating_symbol-black_diamond.svg#mediaviewer/File:Ski_trail_rating_symbol-black_diamond.svg">Ski trail rating symbol-black diamond</a>".</li>
            <li>"<a href="http://commons.wikimedia.org/wiki/File:Ski_trail_rating_symbol-double_black_diamond.svg#mediaviewer/File:Ski_trail_rating_symbol-double_black_diamond.svg">Ski trail rating symbol-double black diamond</a>".</li>
            <li>"<a href="http://commons.wikimedia.org/wiki/File:Ski_trail_rating_symbol-square_diamond.svg#mediaviewer/File:Ski_trail_rating_symbol-square_diamond.svg">Ski trail rating symbol-square diamond</a>".</li>
            <li>"<a href="http://commons.wikimedia.org/wiki/File:Ski_trail_rating_symbol-terrain_park.svg#mediaviewer/File:Ski_trail_rating_symbol-terrain_park.svg">Ski trail rating symbol-terrain park</a>".</li>

        </ul>
        <p>
            Use this area to provide additional information.
        </p>

        <p>
            Use this area to provide additional information.
        </p>
    </article>

    <aside>
        <h3>random .... </h3>
        <p>
            Use this area to provide additional information.
        </p>

        <ul>
            <li><a runat="server" href="~/">Home</a></li>
            <li><a runat="server" href="~/About">About</a></li>
            <li><a runat="server" href="~/Contact">Contact</a></li>
        </ul>
    </aside>
</asp:Content>
