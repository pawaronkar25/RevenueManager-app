<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css" title="currentStyle" media="screen">
    @import "design.css";
</style>
<jsp:include page="sidepanel.html" />
<jsp:useBean id="bean" class="com.rr.beans.MandalSaveBean" />
<jsp:setProperty name="bean" property="*" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mandal Save Result</title>
    <!-- Add any additional head elements if needed -->
</head>
<body>
    <table border="1" width="50%" align="center" class="t1">
        <tr>
            <td>
                <table border="0" width="100%" align="center" class="t1">
                    <tr>
                        <td>
                            <c:if test="${bean.inserted}">
                                <tr>
                                    <td class="pass">Mandal Inserted Successfully</td>
                                </tr>
                            </c:if>
                            <c:if test="${not bean.inserted}">
                                <tr>
                                    <td class="fail">Insertion Failed</td>
                                </tr>
                            </c:if>
                            <tr>
                                <td class="pass"><a href="mandalentry.jsp">Back</a></td>
                            </tr>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
