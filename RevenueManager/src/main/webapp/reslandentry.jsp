<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
    <script>
        function reload() {
            document.f1.action = "reslandentry.jsp";
            document.f1.submit();
        }

        function check() {
            var surveyno = document.f1.surveyno.value;
            if (surveyno === "") {
                alert('Survey Number Not Entered');
                document.f1.surveyno.focus();
                return false;
            }
            return true;
        }
    </script>
    <jsp:include page="sidepanel.html"/>
</head>
<body>

<jsp:useBean id="bean1" class="com.rr.beans.DistLoadBean"/>
<jsp:useBean id="bean2" class="com.rr.beans.DivLoadBean"/>
<jsp:useBean id="bean3" class="com.rr.beans.MandalLoadBean"/>
<jsp:useBean id="bean4" class="com.rr.beans.VlgLoadBean"/>

<form name="f1" onsubmit="return check()" action="reslandsave.jsp">
    <br><br><br>
    <table border="1" width="50%" align="center" class="t4">
        <tr>
            <td>
                <table width="100%" align="center" border="0" class="t4">
                    <caption>Residential Land Entry</caption>
                    <tr>
                        <td><br>District Name</td>
                        <td class="t1"><br><select name="distid" onchange="reload()">
                                <option value="0">[Select District]</option>
                                <c:choose>
                                    <c:when test="${empty param.distid && empty param.divid && empty param.mandalid}">
                                        <c:set var="bean1" value="${distLoadBean}"/>
                                        <c:set var="bean2" value="${divLoadBean}"/>
                                        <c:set var="bean3" value="${mandalLoadBean}"/>
                                        <c:set var="bean4" value="${vlgLoadBean}"/>
                                        <c:out value="${bean1.load()}"/>
                                        <c:out value="${bean2.load(0)}"/>
                                        <c:out value="${bean3.load(0, 0)}"/>
                                        <c:out value="${bean4.load(0, 0, 0)}"/>
                                    </c:when>
                                    <c:when test="${empty param.divid}">
                                        <c:set var="bean2" value="${divLoadBean}"/>
                                        <c:set var="bean3" value="${mandalLoadBean}"/>
                                        <c:out value="${bean2.load(param.distid)}"/>
                                        <c:out value="${bean3.load(param.distid, 1)}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="bean4" value="${vlgLoadBean}"/>
                                        <c:out value="${bean4.load(param.distid, param.divid, param.mandalid)}"/>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Land Survey Number</td>
                        <td class="t1"><input type="text" name="surveyno"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><br>
                            <center>
                                <input type="submit" value="Insert">
                                <input type="reset" value="Reset">
                            </center>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
