<%@ page import="com.rr.beans.HeadTypeSaveBean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="bean" class="com.rr.beans.HeadTypeSaveBean"/>
<jsp:setProperty name="bean" property="*"/>

<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
</head>
<body>

<jsp:include page="sidepanel.html"/>

<table border="1" width="50%" align="center" class="t1">
    <tr>
        <td>
            <table border="0" width="100%" align="center" class="t1">
                <tr>
                    <td>
                        <c:set var="beanOut" value="${bean.out}" />
                        <c:out value="${bean.setOut(beanOut)}" />
                        <c:if test="${bean.insert()}">
                            <tr>
                                <td class="pass">Revenue Head Type Inserted Successfully</td>
                            </tr>
                        </c:if>
                        <c:if test="${not bean.insert()}">
                            <tr>
                                <td class="fail">Insertion Failed</td>
                            </tr>
                        </c:if>
                        <tr>
                            <td class="pass"><a href="headtypeentry.jsp">Back</a></td>
                        </tr>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
