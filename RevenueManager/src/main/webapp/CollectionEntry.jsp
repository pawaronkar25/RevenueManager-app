<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
    <script>
        function reload() {
            document.f1.action = "CollectionEntry.jsp";
            document.f1.submit();
        }

        function check() {
            var headname = document.f1.headname.value;
            if (headname === "") {
                alert('Head Name Not Entered');
                document.f1.headname.focus();
                return false;
            }
            return true;
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

<form name="f1" onsubmit="return check()" action="revcolsave.jsp">
    <br><br><br>
    <table border="1" width="50%" align="center" class="t4">
        <tr>
            <td>
                <table width="100%" align="center" border="0" class="t4">
                    <caption>Revenue Collection Entry</caption>
                    <tr>
                        <td>Revenue Head Type</td>
                        <td class="t1">
                            <select name="typeid">
                                <c:forEach var="type" items="${bean5.types}">
                                    <option value="${type.typeId}">${type.typeName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Month of Collection</td>
                        <td class="t1">
                            <select name="mon">
                                <c:forEach var="month" items="${bean5.months}">
                                    <option value="${month.index}">${month.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Year Of Collection</td>
                        <td><input type="text" name="year" size="10"></td>
                    </tr>
                    <tr>
                        <td>Collection Value</td>
                        <td><input type="text" name="colvalue"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><br>
                            <center>
                                <input type="hidden" name="distid" value="${distid}">
                                <input type="hidden" name="divid" value="${divid}">
                                <input type="hidden" name="mandalid" value="${mandalid}">
                                <input type="hidden" name="villageid" value="${villageid}">
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
