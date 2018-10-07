<%--
  Created by IntelliJ IDEA.
  User: oukaorubyou
  Date: 2018/9/22
  Time: 下午9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%
    String strId = request.getParameter("id");
    int id = Integer.parseInt(strId);
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BBS_Demo","root","13141516");
    Statement statement = conn.createStatement();
    ResultSet rs = statement.executeQuery("SELECT * from  article where id= "+id);

%>
<head>
    <title>Detail</title>
</head>
<body>
<%
    if (rs.next()){
%>
    <table border="1">
        <tr>
            <td>ID</td>
            <td><%=rs.getInt("id")%></td>
        </tr>
        <tr>
            <td>Title</td>
            <td><%=rs.getString("title")%></td>
        </tr>
        <tr>
            <td>Content</td>
            <td><%=rs.getString("cont")%></td>
        </tr>



    </table>

<%}%>

<a href="replay.jsp?id=<%=rs.getInt("id")%>&rootid=<%=rs.getInt("rootid")%>" >回复
</a>

<%
    rs.close();
    statement.close();
    conn.close();
%>
</body>
</html>
