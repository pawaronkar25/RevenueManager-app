<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
</head>
<body>

<c:if test="${lb.validate()}">
    <c:set var="role" value="${lb.getRole()}" />
    <c:set var="session" scope="session" />

    <c:set target="${session}" property="role" value="${role}" />
    <c:set target="${session}" property="user" value="${param.user}" />
    <c:set target="${session}" property="distid" value="${lb.getDistid()}" />
    <c:set target="${session}" property="divid" value="${lb.getDivid()}" />
    <c:set target="${session}" property="mandalid" value="${lb.getMandalid()}" />
    <c:set target="${session}" property="villageid" value="${lb.getVillageid()}" />

    <c:choose>
        <c:when test="${role.equalsIgnoreCase('A')}">
            <c:redirect url="ALogin.jsp" />
        </c:when>
        <c:otherwise>
            <c:redirect url="GLogin.jsp" />
        </c:otherwise>
    </c:choose>
</c:if>

<c:if test="${not lb.validate()}">
    <jsp:include page="index.html" />
    <table align="center" width="40%" class="fail">
        <tr><td align="middle">Invalid Login</td></tr>
    </table><br>
</c:if>

</body>
</html>
