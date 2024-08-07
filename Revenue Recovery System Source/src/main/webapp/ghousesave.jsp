<%@ page import="com.rr.beans.HouseSaveBean" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
</head>
<body>

<jsp:include page="gsidepanel.html"/>
<jsp:useBean id="bean" class="com.rr.beans.HouseSaveBean"/>
<jsp:setProperty name="bean" property="*"/>

<table border="1" width="50%" align="center" class="t1">
    <tr>
        <td>
            <table border="0" width="100%" align="center" class="t1">
                <c:if test="${bean.inserted}">
                    <tr>
                        <td class="pass">House Inserted Successfully</td>
                    </tr>
                </c:if>
                <c:if test="${not bean.inserted}">
                    <tr>
                        <td class="fail">Insertion Failed</td>
                    </tr>
                </c:if>
                <tr>
                    <td class="pass">
                        <a href="ghouseentry.jsp">Back</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
