<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
    <script>
        function reload() {
            document.f1.action = "newacct.jsp";
            document.f1.submit();
        }

        function check() {
            var user = document.f1.user.value;
            var pass = document.f1.pass.value;
            var cpass = document.f1.cpass.value;

            if (user === "") {
                alert('User Name Not Entered');
                document.f1.user.focus();
                return false;
            }

            if (pass === "") {
                alert('Password Not Entered');
                document.f1.pass.focus();
                return false;
            }

            if (cpass === "") {
                alert('Confirm Password Not Entered');
                document.f1.cpass.focus();
                return false;
            }

            if (pass !== cpass) {
                alert('Passwords Do Not Match');
                document.f1.pass.value = "";
                document.f1.cpass.value = "";
                document.f1.pass.focus();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>

<table width="100%" align="center" border="0" class="t11" background="bg2.jpg">
    <tr>
        <td>Revenue Recovery System</td>
    </tr>
</table>
<hr color=#510051>

<jsp:useBean id="bean1" class="com.rr.beans.DistLoadBean" />
<jsp:useBean id="bean2" class="com.rr.beans.DivLoadBean" />
<jsp:useBean id="bean3" class="com.rr.beans.MandalLoadBean" />
<jsp:useBean id="bean4" class="com.rr.beans.VlgLoadBean" />

<form name="f1" onsubmit="return check()" action="newacctsave.jsp">
    <br><br><br>
    <table border="1" width="50%" align="center" class="t4">
        <tr>
            <td>
                <table width="100%" align="center" border="0" class="t4">
                    <caption>User Registration</caption>
                    <tr>
                        <td><br>District Name</td>
                        <td class="t1">
                            <br>
                            <select name="distid" onchange="reload()">
                                <option value="0">[Select District]</option>
                                <c:forEach var="district" items="${districtList}">
                                    <option value="${district.id}">${district.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td class="t1"><input type="text" name="user"></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td class="t1"><input type="password" name="pass"></td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td class="t1"><input type="password" name="cpass"></td>
                    </tr>

                    <tr>
                        <td colspan="2"><br>
                            <center>
                                <input type="submit" value="Register">
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
