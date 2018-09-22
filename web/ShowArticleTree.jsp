<%--
  Created by IntelliJ IDEA.
  User: oukaorubyou
  Date: 2018/9/21
  Time: 下午9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import =" java.sql.*"%>

<%!
    String str = "";
    private void tree(int id,Connection conn, int level){
        Statement stat = null;
        ResultSet rs = null;
        String preStr = "";
        for(int i=0;i<level;i++){
            preStr +="----";
        }
        try {
            stat = conn.createStatement();
            String sql = "select * from article where pid = "+ id;
            rs = stat.executeQuery(sql);
            while (rs.next()){
                str += "<tr><td>"+rs.getInt("id")+"</td><td>"+
                        preStr+"<a href='ShowArticleDetail.jsp?id="+rs.getInt("id")+"'>"+rs.getString("cont")+"</a>"+"</td></tr>";
                if(rs.getInt("isleaf")!=0){
                    tree(rs.getInt("id"),conn,level+1);
                }

            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }
%>
<%

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BBS_Demo","root","13141516");
    Statement statement = conn.createStatement();
    ResultSet rs = statement.executeQuery("SELECT * from  article where pid = 0");
    while (rs.next()){
        str += "<tr><td>"+rs.getInt("id")+"</td><td>"+
                "<a href='ShowArticleDetail.jsp?id="+rs.getInt("id")+"'>"+rs.getString("title")+"</a>"+"</td></tr>";
        if(rs.getInt("isleaf")!=0){
            tree(rs.getInt("id"),conn,1);
        }
    }
    statement.close();
    conn.close();
%>
<html>
<head>
    <title>ShowArticleTree</title>
</head>
<body>
    <table border="1">
        <%=str%>
    </table>



</body>

<% conn.close();%>
</html>
