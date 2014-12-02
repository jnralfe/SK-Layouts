<%@ Page Title="Breakdown" Language="C#" MasterPageFile="~/SlimLine.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SK_Layouts._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>The following table gives some information about the ski resorts across the world: </h2>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDsAudit">
        <Columns>
            <asp:BoundField DataField="sector_name" HeaderText="Sector" SortExpression="sector_name"></asp:BoundField>
            <asp:BoundField DataField="numResorts" HeaderText="Number of Resorts" SortExpression="numResorts"></asp:BoundField>
            <asp:BoundField DataField="numCountries" HeaderText="Number of Countries" SortExpression="numCountries"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDsAudit" ConnectionString='<%$ ConnectionStrings:snowkingConnectionString %>' ProviderName='<%$ ConnectionStrings:snowkingConnectionString.ProviderName %>' SelectCommand="audit_by_sectors" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
