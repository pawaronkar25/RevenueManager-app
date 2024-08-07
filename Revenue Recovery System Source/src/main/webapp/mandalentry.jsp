<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
    <script>
        function reload() {
            document.f1.action = "mandalentry.jsp";
            document.f1.submit();
        }

        function check() {
            var mandalname = document.f1.mandalname.value;
            if (mandalname === "") {
                alert('Mandal Name Not Entered');
                document.f1.mandalname.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <jsp:include page="sidepanel.html" /><br><br><br>
    <c:choose>
        <c:when test="${empty param.distid}">
            <jsp:useBean id="bean1" class="com.rr.beans.DistLoadBean" />
            <jsp:useBean id="bean2" class="com.rr.beans.DivLoadBean" />
            <form name="f1" onsubmit="return check()" action="mandalsave.jsp">
                <br><br><br>
                <table border="1" width="50%" align="center" class="t4">
                    <tr>
                        <td>
                            <table width="100%" align="center" border="0" class="t4">
                                <caption>Mandal Entry</caption>
                                <tr>
                                    <td><br>District Name</td>
                                    <td class="t1">
                                        <br>
                                        <select name="distid" onchange="reload()">
                                            <option value="0">[Select District]</option>
                                            <c:forEach var="district" items="${bean1.districts}">
                                                <option value="${district.id}">${district.name}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Mandal Name</td>
                                    <td class="t1"><input type="text" name="mandalname"></td>
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
        </c:when>
    </c:choose>
</body>
</html>
