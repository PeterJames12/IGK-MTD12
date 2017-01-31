<%@ page import="java.util.LinkedList" %>
<%@ page import="com.igor.model.service.ProjectService" %>
<%@ page import="com.igor.model.service.DeveloperService" %>
<%@ page import="com.igor.model.entity.Project" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: igor
  Date: 06.01.17
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="/pages/errorPage/ooops.jsp"%>

<jsp:useBean id="projects" class="com.igor.model.service.ProjectService" scope="page"/>
<jsp:useBean id="manager" class="com.igor.model.service.ProjectManagerService" scope="page"/>
<jsp:useBean id="developers" class="com.igor.model.service.DeveloperService" scope="page"/>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>



<sec:authorize access="!isAuthenticated()">

    <%@include file="../../META-INF/jspf/loginer.jspf"%>

</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <sec:authentication var="admin" property="principal.username"/>
    <html>
<head>
    <title>IGC-MTD12</title>

    <meta charset="utf-8">

    <title>IGC-MTD12</title>
    <link rel="shortcut icon" href="http://etmakub.com/wp-content/themes/etmakub/img/favicon/etma-54x54.png"
          type="image/x-icon">


    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="<c:url value="sign" />" rel="stylesheet">
    <link href="<c:url value="../css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/pages/css/test.css"/>" rel="stylesheet">

    <%@include file="../../META-INF/jspf/links.jspf"%>
</head>
<body id="main_top">

<%

    request.setCharacterEncoding("utf-8");
    String createProject = request.getParameter("createProject");
    String name = request.getParameter("projectName");
    String projectList = request.getParameter("projectList");
    String addDeveloper = request.getParameter("addDeveloper");
    String devName = request.getParameter("devName");
    String author = request.getParameter("author");

    if (createProject != null && !"".equals(name)) {
        String projectName = request.getParameter("projectName");
        String data_start = request.getParameter("data_start");
        String data_finish = request.getParameter("data_finish");
        String mainDev = request.getParameter("mainDev");
        String developer = request.getParameter("developer");
        String task = request.getParameter("task");
        String note = request.getParameter("note");

        new ProjectService().insertProject(author, projectName, data_start, data_finish,
                mainDev, developer, task, note);
    }

    if (addDeveloper != null && !"".equals(devName)) {
        String devEmail = request.getParameter("devEmail");
        String devSkills = request.getParameter("devSkills");
        new DeveloperService().insertDeveloper(devName, devEmail, devSkills);
    }
%>

<%@include file="../../META-INF/jspf/mainHeader.jspf" %>

<section class="home4" id="home">
    <div class="container cnt_middle">
        <div class="row row_middle">
            <div class="top_centering">
                <div class="container cnt_middle">
                    <div class="row row_middle">
                        <div class="top_centering">
                            <div align="center">
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <div style="width: 300px;">
                                    <h3 style="color: white">Create new Project</h3>
                                    <form action="<c:url value="/admin?author=${admin}"/>" method="post">
                                        <input class="form-control" type="text" name="projectName" placeholder="Name">
                                        <label>
                                            <input class="form-control" type="date" name="data_start">
                                        </label>
                                        <label>
                                            <input class="form-control" type="date" name="data_finish">
                                        </label>
                                        <label>
                                            <input class="form-control" list="manager" name="mainDev" placeholder="Select manager">
                                            <datalist id="manager" name="mainDev">
                                                <%--<c:forEach var="managerItems" items="${manager.allProjectManager}">--%>
                                                    <%--<option>${managerItems.name}</option>--%>
                                                <%--</c:forEach>--%>
                                            </datalist>
                                        </label>

                                        <label>
                                            <input class="form-control" list="developers" name="developer" placeholder="Select Dev">
                                            <datalist id="developers">
                                                <%--<c:forEach var="developer" items="${developers.developerList}">--%>
                                                    <%--<option>${developer.name}</option>--%>
                                                <%--</c:forEach>--%>
                                            </datalist>
                                        </label>
                                        <input type="text" class="form-control" name="task" placeholder="Task">
                                        <br>
                                        <textarea class="form-control" placeholder="Note" name="note"></textarea>
                                        <br>
                                        <input class="myBtn" type="submit" value="Create project"
                                               name="createProject">
                                    </form>
                                </div>
                                    <br>
                                    <div class="container" style="width: 300px;">
                                        <form action="<c:url value="/admin" />" method="post">
                                            <input class="form-control" type="text" name="devName" placeholder="Name">
                                            <br>
                                            <input class="form-control" type="text" name="devEmail" placeholder="Email">
                                            <br>
                                            <input class="form-control" type="text" name="devSkills" placeholder="Skills">
                                            <br>
                                            <input type="submit" name="addDeveloper" class="myButton"
                                                   value="Add Developer">
                                        </form>
                                    </div>
                                    <form action="<c:url value="/admin"/>" method="post">
                                        <input type="submit" value="Project List" class="myButton" name="projectList">
                                    </form>
                                    <div>
                                        <h4 style="color: white">Project List:</h4>
                                        <%
                                            List<Project> selectProjects = new LinkedList<>();
                                            if (projectList != null) {
                                                selectProjects = projects.getProjectList();
                                            }

                                            assert selectProjects != null;
                                            for (Project project : selectProjects) {
                                        %>

                                        <ul>
                                            <li>
                                                <h3>
                                                    <a href="#">
                                                        <strong><%= project.getName()%>
                                                        </strong></a>
                                                </h3>
                                                <p style="color: white">
                                                    <%= project.getDescription()%>
                                                </p>
                                            </li>
                                        </ul>
                                        <%}%>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
</sec:authorize>
