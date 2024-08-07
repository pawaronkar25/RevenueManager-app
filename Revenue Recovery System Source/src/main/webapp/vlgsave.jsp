<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bean" class="com.rr.beans.VlgSaveBean"/>

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
                        <c:set var="divId" value="${param.divid}" />
                        <c:set var="distId" value="${param.distid}" />
                        <c:set var="mandalId" value="${param.mandalid}" />
                        <c:set var="villageName" value="${param.villagename}" />

                        <c:set var="beanDistId" value="${bean.distid}" />
                        <c:set var="beanDivId" value="${bean.divid}" />
                        <c:set var="beanMandalId" value="${bean.mandalid}" />
                        <c:set var="beanVillageName" value="${bean.villagename}" />

                        <c:if test="${beanDistId == distId && beanDivId == divId && beanMandalId == mandalId && beanVillageName == villageName}">
                            <tr>
                                <td class="pass">Village Inserted Successfully</td>
                            </tr>
                        </c:if>

                        <c:if test="${beanDistId != distId || beanDivId != divId || beanMandalId != mandalId || beanVillageName != villageName}">
                            <tr>
                                <td class="fail">Insertion Failed</td>
                            </tr>
                        </c:if>

                        <tr>
                            <td class="pass"><a href="vlgentry.jsp">Back</a></td>
                        </tr>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
