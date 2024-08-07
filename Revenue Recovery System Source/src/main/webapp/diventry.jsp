<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
    <script>
        function check() {
            var divname = document.f1.divname.value;
            if (divname === "") {
                alert('Division Name Not Entered');
                document.f1.divname.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<jsp:include page="sidepanel.html"/><br><br><br>
<jsp:useBean id="bean" class="com.rr.beans.DistLoadBean"/>
<form name="f1" onsubmit="return check()" action="divsave.jsp">
    <br><br><br>
    <table border="1" width="50%" align="center" class="t4">
        <tr>
            <td>
                <table width="100%" align="center" border="0" class="t4">
                    <caption>Division Entry</caption>
                    <tr>
                        <td><br>District Name</td>
                        <td class="t1"><br>
                            <select name="distid">
                                <c:forEach var="district" items="${bean.load}">
                                    <option value="${district.id}">${district.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td><br>Division Name</td>
                        <td class="t1"><br><input type="text" name="divname"></td>
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
