<%--
  Created by IntelliJ IDEA.
  User: oukaorubyou
  Date: 2018/9/24
  Time: 下午10:49
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%

    int id = Integer.parseInt(request.getParameter("id"));
    int rootId = Integer.parseInt(request.getParameter("rootid"));


%>
<head>
    <title>回复</title>
</head>
<body>
    <form name="replay" action="replayOK.jsp" method="post" onsubmit="return check()">
        <input type="hidden" name="id" value="<%=id%>">
        <input type="hidden" name="rootid" value="<%=rootId%>">
        <table border="1">
            <tr>
                <td>
                    主题 <input type="text" name="title" size="80" >
                </td>
            </tr>
            <tr>
                <td>
                    <textarea cols = "80" rows="12" name="content">
                    </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="提交">
                </td>
            </tr>

        </table>
    </form>





</body>
</html>
