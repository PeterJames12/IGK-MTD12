<%@ page import="com.igor.database.Test" %>
<%@ page import="com.igor.model.entity.Project" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: igor
  Date: 31.01.17
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
    <jsp:useBean id="list" class="com.igor.database.Test" scope="page"/>
</head>
<body>

<%




    Test test = new Test();
    List<Project> projects = test.projectList();

    for (Project project : projects) {
        System.out.println("Name" + project.getName());
    }
%>


</body>
</html>
