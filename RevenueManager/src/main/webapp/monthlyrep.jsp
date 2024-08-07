<style type="text/css" title="currentStyle" media="screen">
    @import "design.css";
</style>
<jsp:useBean id="bean" class="com.rr.beans.ReportBean" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Revenue Collection Report</title>
    <!-- Add any additional head elements if needed -->
</head>
<body>
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
                    <c:forEach var="entry" items="${bean.allEntries}">
                        <tr>
                            <td>${entry.district}</td>
                            <td>${entry.division}</td>
                            <td>${entry.mandal}</td>
                            <td>${entry.village}</td>
                            <td>${entry.headType}</td>
                            <td>${entry.month}</td>
                            <td>${entry.year}</td>
                            <td>${entry.collectionValue}</td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="8" class="pass"><a href="gsidepanel.html">Back</a></td>
        </tr>
    </table>
</body>
</html>
