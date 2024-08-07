<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<style type="text/css" title="currentStyle" media="screen">
    @import "design.css";
</style>
<script>
    function check() {
        var from = document.f1.from.value;
        var to = document.f1.to.value;
        var target = document.f1.target.value;
        if (from === "") {
            alert('Year From Not Entered');
            document.f1.from.focus();
            return false;
        }
        if (to === "") {
            alert('To Year Not Entered');
            document.f1.to.focus();
            return false;
        }
        if (target === "") {
            alert('Revenue Target Not Entered');
            document.f1.target.focus();
            return false;
        }
        if (from.length !== 4) {
            alert('Year From Format is Invalid');
            document.f1.from.value = "";
            document.f1.from.focus();
            return false;
        }
        if (to.length !== 4) {
            alert('Year To Format is Invalid');
            document.f1.to.value = "";
            document.f1.to.focus();
            return false;
        }
        if (from >= to) {
            alert('Invalid Revenue Year');
            document.f1.from.value = "";
            document.f1.to.value = "";
            document.f1.from.focus();
            return false;
        }
        return true;
    }
</script>
<jsp:useBean id="bean5" class="com.rr.beans.HeadTypeLoadBean"/>
<jsp:include page="gsidepanel.html"/><br>
<form name="f1" onsubmit="return check()" action="revtgtsave.jsp">
    <br><br><br>
    <table border="1" width="50%" align="center" class="t4">
        <tr>
            <td>
                <table width="100%" align="center" border="0" class="t4">
                    <caption>Revenue Target Entry</caption>
                    <tr>
                        <td><br>Revenue Year From (YYYY)</td>
                        <td class="t1"><br><input type="text" name="from" size="8"> To<input type="text" name="to" size="8">(YYYY)</td>
                    </tr>
                    <tr>
                        <td>Revenue Head Type</td>
                        <td class="t1">
                            <select name="typeid">
                                <c:forEach var="type" items="${bean5.load()}">
                                    <option value="${type.id}">${type.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Target Value</td>
                        <td><input type="text" name="target"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><br>
                            <center>
                                <input type="hidden" name="distid" value="${sessionScope.distid}">
                                <input type="hidden" name="divid" value="${sessionScope.divid}">
                                <input type="hidden" name="mandalid" value="${sessionScope.mandalid}">
                                <input type="hidden" name="villageid" value="${sessionScope.villageid}">
                                <input type="submit" value="Submit">
                                <input type="reset" value="Reset">
                            </center>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</html>
