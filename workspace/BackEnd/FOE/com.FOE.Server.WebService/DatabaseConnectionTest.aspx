﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DatabaseConnectionTest.aspx.cs" Inherits="com.FOE.Server.WebService.DatabaseConnectionTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FOE Database Connection Test</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        The Database Connection is perfect <br />
        <asp:Label ID="lblConnectionString" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
