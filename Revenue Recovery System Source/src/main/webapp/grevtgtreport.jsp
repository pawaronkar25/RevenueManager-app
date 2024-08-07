<%@ page import="com.rr.beans.RevTgtSaveBean" %>
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
                    <th>District</th>
                    <th>Division</th>
                    <th>Mandal</th>
                    <th>Village</th>
                    <th>Revenue Year</th>
                    <th>Revenue Head</th>
                    <th>Target</th>
                </tr>
                <c:set var="distid" value="${session.distid}"/>
                <c:set var="divid" value="${session.divid}"/>
                <c:set var="mandalid" value="${session.mandalid}"/>
                <c:set var="villageid" value="${session.villageid}"/>
                <jsp:useBean id="veb" class="com.rr.beans.RevTgtSaveBean"/>
                <c:if test="${not empty distid and not empty divid and not empty mandalid and not empty villageid}">
                    <c:out value="${veb.setDistid(Integer.parseInt(distid))}"/>
                    <c:out value="${veb.setDivid(Integer.parseInt(divid))}"/>
                    <c:out value="${veb.setMandalid(Integer.parseInt(mandalid))}"/>
                    <c:out value="${veb.setVillageid(Integer.parseInt(villageid))}"/>
                    <c:out value="${veb.setOut(pageContext.out)}"/>
                    <c:out value="${veb.soloreport()}"/>
                </c:if>
                <tr>
                    <td colspan="15" align="middle" class="pass">
                        <a href="GLogin.jsp" class="a1">Home</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
