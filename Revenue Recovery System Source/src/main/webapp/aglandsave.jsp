<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
</head>
<body>

<jsp:include page="sidepanel.html"/>
<jsp:useBean id="bean" class="com.rr.beans.AgLandSaveBean"/>
<jsp:setProperty name="bean" property="*"/>
<table border="1" width="50%" align="center" class="t1">
    <tr>
        <td>
            <table border="0" width="100%" align="center" class="t1">
                <tr>
                    <td>
                        <c:if test="${bean.insert}">
                            <tr>
                                <td class="pass">Land Inserted Successfully</td>
                            </tr>
                        </c:if>
                        <c:if test="${!bean.insert}">
                            <tr>
                                <td class="fail">Insertion Failed</td>
                            </tr>
                        </c:if>
                        <tr>
                            <td class="pass">
                                <a href="aglandentry.jsp">Back</a>
                            </td>
                        </tr>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
