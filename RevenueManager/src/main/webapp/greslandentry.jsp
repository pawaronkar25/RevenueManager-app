<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Residential Land Entry</title>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
    <script>
        function reload() {
            document.f1.action = "greslandentry.jsp";
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
</head>

<body>
    <jsp:include page="gsidepanel.html" /><br><br><br>

    <jsp:useBean id="bean1" class="com.rr.beans.DistLoadBean" />
    <jsp:useBean id="bean2" class="com.rr.beans.DivLoadBean" />
    <jsp:useBean id="bean3" class="com.rr.beans.MandalLoadBean" />
    <jsp:useBean id="bean4" class="com.rr.beans.VlgLoadBean" />

    <form name="f1" onsubmit="return check()" action="greslandsave.jsp">
        <br><br><br>
        <table border="1" width="50%" align="center" class="t4">
            <tr>
                <td>
                    <table width="100%" align="center" border="0" class="t4">
                        <caption>Residential Land Entry</caption>
                        <%
                        String distid = (String)session.getAttribute("distid");
                        String divid = (String)session.getAttribute("divid");
                        String mandalid = (String)session.getAttribute("mandalid");
                        String villageid = (String)session.getAttribute("villageid");
                        %>
                        <tr>
                            <td>Land Survey Number</td>
                            <td class="t1"><input type="text" name="surveyno"></td>
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