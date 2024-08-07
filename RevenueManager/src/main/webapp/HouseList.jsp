<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <table width="100%" align="center" border="1" class="t6">
        <tr>
            <td>
                <table align="center" class="t6" border="1" width="100%">
                    <caption class="cap2">House List</caption>
                    <tr class="th1">
                        <th>District</th>
                        <th>Division</th>
                        <th>Mandal</th>
                        <th>Village</th>
                        <th>Door No</th>
                        <th>Type</th>
                        <th>Water Connection</th>
                    </tr>
                    <jsp:useBean id="veb" class="com.rr.beans.ViewBean" />
                    <jsp:getProperty name="veb" property="out" />
                    <jsp:invoke fragment="viewHouses" />
                    <tr>
                        <td colspan="15" align="middle" class="pass"><a href="GLogin.jsp" class="a1">Home</a></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>

</html>
