<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <jsp:include page="sidepanel.html" />
    <jsp:useBean id="bean" class="com.rr.beans.HouseSaveBean" />
    <jsp:setProperty name="bean" property="*" />

    <table border="1" width="50%" align="center" class="t1">
        <tr>
            <td>
                <table border="0" width="100%" align="center" class="t1">
                    <tr>
                        <td>
                            <c:set var="bean" value="${bean}" />
                            <c:if test="${bean.insert()}">
                                <tr>
                                    <td class="pass">House Inserted Successfully</td>
                                </tr>
                            </c:if>
                            <c:if test="${not bean.insert()}">
                                <tr>
                                    <td class="fail">Insertion Failed</td>
                                </tr>
                            </c:if>
                            <tr>
                                <td class="pass"><a href="houseentry.jsp">Back</a></td>
                            </tr>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>

</html>