<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
</head>
<body>

<table width="100%" align="center" border="0" class="t11" background="bg2.jpg">
    <tr>
        <td>Revenue Recovery System</td>
    </tr>
</table>
<hr color="#510051">

<table width="70%" align="center" border="1" class="t6">
    <tr>
        <td>
            <table align="center" class="t6" border="1" width="100%">
                <caption class="cap2">Revenue Target Report</caption>
                <tr class="th1">
                    <th>Revenue Year</th>
                    <th>Revenue Head</th>
                    <th>Target</th>
                </tr>
                <c:set var="veb" value="${com.rr.beans.RevTgtSaveBean}" />
                <c:forEach var="row" items="${veb.report()}">
                    <tr>
                        <td>${row.revenueYear}</td>
                        <td>${row.revenueHead}</td>
                        <td>${row.target}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="15" align="middle" class="pass">
                        <a href="ALogin.jsp" class="a1">Home</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
