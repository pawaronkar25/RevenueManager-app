<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
</head>
<body>

<jsp:useBean id="veb" class="com.rr.beans.ViewBean"/>
<table width="100%" align="center" border="0" class="t11" background="bg2.jpg">
    <tr>
        <td>Revenue Recovery System</td>
    </tr>
</table>
<hr color="#510051">
<table width="100%" align="center" border="1" class="t6">
    <tr>
        <td>
            <table align="center" class="t6" border="1" width="100%">
                <caption class="cap2">Agriculture Land List</caption>
                <tr class="th1">
                    <th>District</th>
                    <th>Division</th>
                    <th>Mandal</th>
                    <th>Village</th>
                    <th>Survey No</th>
                </tr>
                <c:forEach var="land" items="${landList}">
                    <tr>
                        <td>${land.district}</td>
                        <td>${land.division}</td>
                        <td>${land.mandal}</td>
                        <td>${land.village}</td>
                        <td>${land.surveyNo}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5" align="middle" class="pass">
                        <a href="GLogin.jsp" class="a1">Home</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
