<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css" title="currentStyle" media="screen">
    @import "design.css";
</style>

<jsp:include page="sidepanel.html"/>
<jsp:useBean id="bean" class="com.rr.beans.ResLandSaveBean"/>
<jsp:setProperty name="bean" property="*"/>

<table border="1" width="50%" align="center" class="t1">
    <tr>
        <td>
            <table border="0" width="100%" align="center" class="t1">
                <tr>
                    <td>
                        <c:set var="inserted" value="${bean.insert()}"/>
                        <c:choose>
                            <c:when test="${inserted}">
                                <tr>
                                    <td class="pass">Land Inserted Successfully</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td class="fail">Insertion Failed</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        <tr>
                            <td class="pass"><a href="reslandentry.jsp">Back</a></td>
                        </tr>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
