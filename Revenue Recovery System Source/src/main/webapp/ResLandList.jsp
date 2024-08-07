<%@ page import="java.util.Optional" %>
<%@ page import="java.util.function.Function" %>

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
            if (surveyno.trim() === "") {
                alert('Survey Number Not Entered');
                document.f1.surveyno.focus();
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
                                <c:forEach var="district" items="${districtList}">
                                    <option value="${district.id}">${district.name}</option>
                                </c:forEach>
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
