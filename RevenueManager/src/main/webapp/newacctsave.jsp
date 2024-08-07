<%@ page import="java.io.IOException" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <style type="text/css" title="currentStyle" media="screen">
        @import "design.css";
    </style>
</head>
<body>

<!-- ... (rest of your code) ... -->

<c:choose>
    <c:when test="${bean.register}">
        <tr>
            <td class="pass">User Created Successfully</td>
        </tr>
    </c:when>
    <c:otherwise>
        <tr>
            <td class="fail">User Creation Failed</td>
        </tr>
    </c:otherwise>
</c:choose>
<tr>
    <td class="pass">
        <a href="index.html">Home</a>
    </td>
</tr>

</table>
</td>
</tr>
</table>

</body>
</html>
