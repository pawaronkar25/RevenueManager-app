<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
    <script>
        function reload() {
            document.frm.action = "distrep.jsp";
            document.frm.submit();
        }
    </script>
</head>
<body>

<jsp:useBean id="bean" class="com.rr.beans.ReportBean"/>
<jsp:useBean id="bean1" class="com.rr.beans.DistLoadBean"/>

<table width="100%" align="center" border="0" class="t11" background="bg2.jpg">
    <tr>
        <td>Revenue Recovery System</td>
    </tr>
</table>
<hr color="#510051">

<form name="frm">
    <table width="100%" align="center" border="1" class="t6">
        <tr>
            <td class="t7">District Name
                <select name="distid" class="t7" onchange="reload()">
                    <option>[Select District]</option>
                    <c:if test="${empty param.distid}">
                        <c:set var="distid" value="" />
                    </c:if>
                    <c:forEach var="district" items="${bean1.districts}">
                        <option value="${district.distId}" ${district.distId eq distid ? 'selected' : ''}>
                            ${district.distName}
                        </option>
                    </c:forEach>
                </select><br>
            </td>
        </tr>
        <tr>
            <td>
                <table align="center" class="t6" border="1" width="100%">
                    <caption class="cap2">Revenue Collection Report</caption>
                    <tr class="th1">
                        <th>District</th>
                        <th>Division</th>
                        <th>Mandal</th>
                        <th>Village</th>
                        <th>Head Type</th>
                        <th>Month</th>
                        <th>Year</th>
                        <th>Collection Value</th>
                    </tr>
                    <c:choose>
                        <c:when test="${empty param.distid}">
                            <c:set var="distId" value="" />
                            <c:set var="divId" value="" />
                            <c:set var="mandalId" value="" />
                            <c:set var="villageId" value="" />
                            <c:set var="headType" value="" />
                            <c:set var="month" value="" />
                            <c:set var="year" value="" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="distId" value="${param.distid}" />
                        </c:otherwise>
                    </c:choose>
                    <c:set var="district" value="${bean1.getDistrict(distId)}" />
                    <c:set var="division" value="${bean1.getDivision(distId, divId)}" />
                    <c:set var="mandal" value="${bean1.getMandal(distId, divId, mandalId)}" />
                    <c:set var="village" value="${bean1.getVillage(distId, divId, mandalId, villageId)}" />

                    <c:forEach var="record" items="${bean.getRecords(distId, divId, mandalId, villageId, headType, month, year)}">
                        <tr>
                            <td>${district.distName}</td>
                            <td>${division.divName}</td>
                            <td>${mandal.mandalName}</td>
                            <td>${village.villageName}</td>
                            <td>${record.headType}</td>
                            <td>${record.month}</td>
                            <td>${record.year}</td>
                            <td>${record.colValue}</td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="8" class="pass"><a href="gsidepanel.html">Back</a></td>
        </tr>
    </table>
</form>
</body>
</html>
