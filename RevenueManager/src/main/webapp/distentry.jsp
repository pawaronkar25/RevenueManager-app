<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>District Entry</title>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
    <script>
        function check() {
            var distname = document.f1.distname.value;
            if (distname === "") {
                alert('District Name Not Entered');
                document.f1.distname.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <jsp:include page="sidepanel.html"/><br><br><br>
    <form name="f1" onsubmit="return check()" action="distsave.jsp">
        <br><br><br>
        <table border="1" width="50%" align="center" class="t4">
            <tr>
                <td>
                    <table width="100%" align="center" border="0" class="t4">
                        <caption>District Entry</caption>
                        <tr>
                            <td><br>District Name</td>
                            <td class="t1"><br><input type="text" name="distname"></td>
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
