<%@ page import="java.util.List" %>
<%@ page import="com.igor.model.entity.Project" %>
<%@ page import="com.igor.model.service.ProjectService" %>
<%@ page import="com.igor.notification.Notification" %>
<%--
  Created by IntelliJ IDEA.
  User: igor
  Date: 07.01.17
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="/pages/errorPage/ooops.jsp"%>

<jsp:useBean id="projects" class="com.igor.model.service.ProjectService" scope="page"/>
<jsp:useBean id="developerList" class="com.igor.model.service.DeveloperService" scope="page"/>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authorize access="!isAuthenticated()">

    <%@include file="../login.jsp"%>

</sec:authorize>

<sec:authorize access="isAuthenticated()">

<html>
<head>
    <title>Developer</title>

    <meta charset="utf-8">

    <title>IGC-MTD12</title>
    <link rel="shortcut icon" href="http://etmakub.com/wp-content/themes/etmakub/img/favicon/etma-54x54.png"
          type="image/x-icon">


    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="<c:url value="../../pages/css/test.css"/>" rel="stylesheet">
    <%@include file="../../META-INF/jspf/links.jspf"%>
</head>
<body id="main_top">

<%
    request.setCharacterEncoding("utf-8");

    String myProject = request.getParameter("myProject");
    String passwordDev = request.getParameter("passwordDev");
    String whoAmI = request.getParameter("whoAmI");

    String someQuestions = request.getParameter("someQuestions");

    if (someQuestions != null) {
        Notification notification = new Notification();
        notification.send("Hello, you new message from developer" + "\n" + someQuestions);
    }

    %>

<%@include file="../../META-INF/jspf/mainHeader.jspf"%>

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
                                    <form action="<c:url value="/developer"/>" method="post">
                                        <input class="form-control" list="developer" name="whoAmI" placeholder="Who are you?">
                                        <datalist id="developer">
                                                <%--<c:forEach var="developerListItem" items="${developerList.developerList}">--%>
                                                <%--<option>${developerListItem.name}</option>--%>
                                                <%--</c:forEach>--%>
                                        </datalist>
                                            <%--<input type="text" name="whoAmI" placeholder="ur name please">--%>
                                        <input class="form-control" type="password" name="passwordDev" placeholder="ur password please">
                                        <br>
                                        <input class="myButton" type="submit" value="My Project" name="myProject">
                                    </form>
                                </div>
                                <br>
                                <div>
                                    <h4 style="color: white">Project List:</h4>
                                    <%
                                        List<Project> myProjectList = null;
                                        if (myProject != null && !"".equals(whoAmI) && !"".equals(passwordDev)) {
                                            myProjectList = new ProjectService().getMyProject(whoAmI, passwordDev);
                                        }
                                    %>
                                    <%
                                        if (myProjectList == null) {
                                            return;
                                        }
                                        for (Project project : myProjectList) { %>

                                    <h3>
                                        <a href="<c:url value="/projectDetails?projectName=<%=project.getName()%>"/>">
                                            <strong><%= project.getName() %>
                                            </strong></a>
                                    </h3>
                                    <p style="color: white">
                                        <%= project.getDescription()%>
                                    </p>

                                    <h4 style="color: white">
                                        Your task:
                                    </h4>
                                    <p style="color: white;">
                                    <%= project.getTask()%>
                                    </p>
                                    <%}%>
                                    <p>
                                </div>
                            <div>
                                <form action="<c:url value="/developer"/>" method="post">
                                <textarea name="someQuestions"
                                          title="Type if you have any questions"
                                          placeholder="Type if you have any questions"></textarea>
                                    <br>
                                    <input class="myButton" type="submit" value="send" name="send">
                                </form>
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
