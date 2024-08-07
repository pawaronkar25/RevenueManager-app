<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="design.css" title="currentStyle" media="screen">
    <title>Revenue Recovery System</title>
</head>
<body>

<table width="100%" align="center" border="0" class="t11" background="bg2.jpg">
    <tr>
        <td>Revenue Recovery System</td>
    </tr>
</table>
<hr color="#510051">

<jsp:useBean id="bean" class="com.rr.beans.ReportBean"/>
<jsp:setProperty name="bean" property="*"/>
<table width="100%" align="center" border="1" class="t6">
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
                <c:forEach var="item" items="${bean.view()}">
                    <tr>
                        <td>${item.district}</td>
                        <td>${item.division}</td>
                        <td>${item.mandal}</td>
                        <td>${item.village}</td>
                        <td>${item.headType}</td>
                        <td>${item.month}</td>
                        <td>${item.year}</td>
                        <td>${item.collectionValue}</td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="8" class="pass"><a href="ReqReport.jsp">Back</a></td>
    </tr>
</table>

</body>
</html>
