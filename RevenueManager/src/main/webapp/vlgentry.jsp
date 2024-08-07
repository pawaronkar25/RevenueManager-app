<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
    <script>
        function reload() {
            document.f1.action = "vlgentry.jsp";
            document.f1.submit();
        }

        function check() {
            var villagename = document.f1.villagename.value;
            if (villagename === "") {
                alert('Village Name Not Entered');
                document.f1.villagename.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<jsp:include page="sidepanel.html"/>
<br><br><br>

<jsp:useBean id="bean1" class="com.rr.beans.DistLoadBean"/>
<jsp:useBean id="bean2" class="com.rr.beans.DivLoadBean"/>
<jsp:useBean id="bean3" class="com.rr.beans.MandalLoadBean"/>

<c:choose>
    <c:when test="${empty param.distid && empty param.divid}">
        <c:set var="bean1" value="${distLoadBean}"/>
        <c:set var="bean2" value="${divLoadBean}"/>
        <c:set var="bean3" value="${mandalLoadBean}"/>
        <c:out value="${bean1.load()}"/>
        <c:out value="${bean2.load(0)}"/>
        <c:out value="${bean3.load(0, 0)}"/>
    </c:when>
    <c:when test="${empty param.divid}">
        <c:set var="bean2" value="${divLoadBean}"/>
        <c:set var="bean3" value="${mandalLoadBean}"/>
        <c:out value="${bean2.load(param.distid)}"/>
        <c:out value="${bean3.load(param.distid, 1)}"/>
    </c:when>
    <c:otherwise>
        <c:set var="bean3" value="${mandalLoadBean}"/>
        <c:out value="${bean3.load(param.distid, param.divid)}"/>
    </c:otherwise>
</c:choose>

<form name="f1" onsubmit="return check()" action="vlgsave.jsp">
    <br><br><br>
    <table border="1" width="50%" align="center" class="t4">
        <tr>
            <td>
                <table width="100%" align="center" border="0" class="t4">
                    <caption>Village Entry</caption>
                    <tr>
                        <td><br>District Name</td>
                        <td class="t1">
                            <br>
                            <select name="distid" onchange="reload()">
                                <option value="-1">[Select District]</option>
                                <c:forEach var="district" items="${bean1.getDistrictList()}">
                                    <option value="${district.id}" 
                                        <c:if test="${district.id == param.distid}">selected</c:if>>
                                        ${district.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Village Name</td>
                        <td class="t1"><input type="text" name="villagename"></td>
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
