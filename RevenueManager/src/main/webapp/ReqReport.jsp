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
            document.f1.action = "ReqReport.jsp";
            document.f1.submit();
        }
    </script>
</head>

<body>
    <jsp:include page="gsidepanel.html"/><br>
    <jsp:useBean id="bean1" class="com.rr.beans.DistLoadBean"/>
    <jsp:useBean id="bean2" class="com.rr.beans.DivLoadBean"/>
    <jsp:useBean id="bean3" class="com.rr.beans.MandalLoadBean"/>
    <jsp:useBean id="bean4" class="com.rr.beans.VlgLoadBean"/>
    <jsp:useBean id="bean5" class="com.rr.beans.HeadTypeLoadBean"/>

    <form name="f1" action="smartreport.jsp">
        <br><br><br>
        <table border="1" width="50%" align="center" class="t4">
            <tr>
                <td>
                    <table width="100%" align="center" border="0" class="t4">
                        <caption>Revenue Collection</caption>
                        <tr>
                            <td><br>District Name</td>
                            <td class="t1"><br><select name="distid" onchange="reload()">
                                    <option value="0">[Select District]</option>
                                    <c:choose>
                                        <c:when test="${empty param.distid and empty param.divid and empty param.mandalid}">
                                            <c:forEach var="district" items="${bean1.districtList}">
                                                <option value="${district.id}">${district.name}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${empty param.divid}">
                                            <c:forEach var="division" items="${bean2.divisionList}">
                                                <option value="${division.id}">${division.name}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="mandal" items="${bean3.mandalList}">
                                                <option value="${mandal.id}">${mandal.name}</option>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Revenue Head Type</td>
                            <td class="t1">
                                <select name="typeid">
                                    <c:forEach var="type" items="${bean5.headTypeList}">
                                        <option value="${type.id}">${type.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><br>
                                <center>
                                    <input type="submit" value="View Report">
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
