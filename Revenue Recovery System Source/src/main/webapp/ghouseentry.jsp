<!DOCTYPE html>
<html>

<head>
    <title>House Entry</title>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
    <script>
        function reload() {
            document.f1.action = "ghouseentry.jsp";
            document.f1.submit();
        }

        function check() {
            var houseno;
            houseno = document.f1.houseno.value;
            if (houseno == "") {
                alert('House Number Not Entered');
                document.f1.houseno.focus();
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
    <jsp:include page="gsidepanel.html" /><br><br><br>
    
    <form name="f1" onsubmit="return check()" action="ghousesave.jsp">
        <br><br><br>
        <table border="1" width="50%" align="center" class="t4">
            <tr>
                <td>
                    <table width="100%" align="center" border="0" class="t4">
                        <caption>House Entry</caption>
                        <%
                            String distid = (String) session.getAttribute("distid");
                            String divid = (String) session.getAttribute("divid");
                            String mandalid = (String) session.getAttribute("mandalid");
                            String villageid = (String) session.getAttribute("villageid");
                        %>
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
                                <input type="radio" name="water" value="true" class="rad" checked>Yes
                                <input type="radio" name="water" value="false" class="rad">No
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><br>
                                <center>
                                    <input type="hidden" name="distid" value="<%=distid%>">
                                    <input type="hidden" name="divid" value="<%=divid%>">
                                    <input type="hidden" name="mandalid" value="<%=mandalid%>">
                                    <input type="hidden" name="villageid" value="<%=villageid%>">
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
