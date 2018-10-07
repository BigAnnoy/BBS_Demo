<%--
  Created by IntelliJ IDEA.
  User: oukaorubyou
  Date: 2018/9/24
  Time: 下午11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    int rootId = Integer.parseInt(request.getParameter("rootid"));
    String title = request.getParameter("title");
    String cont = request.getParameter("content");

    cont.replaceAll("\n","<br>");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BBS_Demo","root","13141516");

    conn.setAutoCommit(false);
    String sql = "insert into article values (null,?,?,?,?,now(),0)";
    PreparedStatement preparedStatement = conn.prepareStatement(sql);
    Statement statement = conn.createStatement();
    preparedStatement.setInt(1,id);
    preparedStatement.setInt(2,rootId);
    preparedStatement.setString(3,title);
    preparedStatement.setString(4,cont);
    preparedStatement.executeUpdate();
    statement.executeUpdate("update article set isleaf = 1 where id = "+id);

    conn.commit();
    conn.setAutoCommit(true);

    statement.close();
    preparedStatement.close();
    conn.close();

    response.sendRedirect("ShowArticleTree.jsp");

%>

<html>
<head>
    <title>replayOK</title>
</head>
<body>
<font color="red" size="7">
    OK!
</font>
</body>
</html>
