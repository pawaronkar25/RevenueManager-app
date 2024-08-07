<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>House Entry</title>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
    <script>
        function reload() {
            document.f1.action = "houseentry.jsp";
            document.f1.submit();
        }

        function check() {
            var houseno = document.f1.houseno.value;
            if (houseno === "") {
                alert('House Number Not Entered');
                document.f1.houseno.focus();
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
    <jsp:include page="sidepanel.html" /><br><br><br>

    <jsp:useBean id="bean1" class="com.rr.beans.DistLoadBean" />
    <jsp:useBean id="bean2" class="com.rr.beans.DivLoadBean" />
    <jsp:useBean id="bean3" class="com.rr.beans.MandalLoadBean" />
    <jsp:useBean id="bean4" class="com.rr.beans.VlgLoadBean" />

    <form name="f1" onsubmit="return check()" action="housesave.jsp">
        <br><br><br>
        <table border="1" width="50%" align="center" class="t4">
            <tr>
                <td>
                    <table width="100%" align="center" border="0" class="t4">
                        <caption>House Entry</caption>
                        <tr>
                            <td><br>District Name</td>
                            <td class="t1">
                                <br>
                                <select name="distid" onchange="reload()">
                                    <option value="0">[Select District]</option>
                                    <c:if test="${empty param.distid and empty param.divid and empty param.mandalid}">
                                        <c:forEach var="district" items="${districtList}">
                                            <option value="${district.id}">${district.name}</option>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty param.distid and empty param.divid}">
                                        <c:forEach var="district" items="${districtList}">
                                            <option value="${district.id}" ${district.id eq param.distid ? 'selected' : ''}>${district.name}</option>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty param.divid}">
                                        <c:forEach var="district" items="${districtList}">
                                            <option value="${district.id}" ${district.id eq param.distid ? 'selected' : ''}>${district.name}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Door Number</td>
                            <td class="t1"><input type="text" name="houseno"></td>
                        </tr>
                        <tr>
                            <td>Area Type</td>
                            <td class="t1">
                                <input type="radio" name="type" value="R" class="rad">Residential
                                <input type="radio" name="type" value="C" class="rad">Commercial
                            </td>
                        </tr>
                        <tr>
                            <td>Water Connection</td>
                            <td class="t1">
                                <input type="radio" name="water" value="true" class="rad" selected>Yes
                                <input type="radio" name="water" value="false" class="rad">No
                            </td>
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
