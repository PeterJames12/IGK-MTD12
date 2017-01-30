<%@ page import="com.igor.notification.Notification" errorPage="errorPage/ooops.jsp" %><%--
  Created by IntelliJ IDEA.
  User: igor
  Date: 07.01.17
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title>IGC-MTD12</title>
    <meta charset="utf-8">

    <link rel="shortcut icon" href="http://etmakub.com/wp-content/themes/etmakub/img/favicon/etma-54x54.png" type="image/x-icon">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/main.css" rel="stylesheet">

   <%@include file="../META-INF/jspf/links.jspf"%>

</head>


<body id="main_top">
<header>
    <div class="container">
        <div class="row">
            <div class="col-md-12 main_menu_container">
                <div class="brand col-lg-3 col-md-3 col-sm-6 col-xs-6">
                </div>
                <div class="mob_menu col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <h3 align="center" style="color: white"> Java developer team</h3>
                </div>
                <div class="language_mob col-lg-3 col-md-3 col-sm-12 col-xs-12">
                </div>
            </div>
        </div>
    </div>
</header>

<section class="home" id="home">
    <div class="container cnt_middle">
        <div class="row row_middle">
            <div class="top_centering">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 main_text def_text clear">
                    <h1 class="clear">
                        <br>
                        <sec:authorize access="isAuthenticated()">
                            <sec:authentication var="adminName" property="principal.username"/>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 move_button def_text clear">
                            <div class="m_butt">
                                <a href="<c:url value="/admin?author=${adminName}"/>" class="clear">Admin</a>
                            </div>
                            <div class="m_butt">
                                <hr>
                                <a href="<c:url value="/developer"/>" class="clear">Developer</a>
                            </div>
                        </div>
                            <br>
                        </sec:authorize>
                        <br>
                        <br>
                        IGC-MTD12
                        <br>
                        Development of unique,
                        <span class="bold">
								professional
							</span>
                        <br />
                        program at an
                        <span class="t_color">
								affordable
							</span>
                        price
                    </h1>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 move_button def_text clear">
                    <div class="m_butt">
                        <h5>Sing In</h5>
                        <a href="<c:url value="/login"/>" class="clear">
                            &#9660;
                        </a></div>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="about" id="about">
    <div class="container-fluid">
        <div class="row">

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 about_butt">
                <div class="row">
                    <div class="white_header col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h1 class="clear">
                            Did the result was achieved?								</h1>
                        <p>We are friendly and making one of the best software in the world</p>
                        <a class="sm" href="#contakt">
                            <p>Apply</p>
                        </a>
                    </div>
                </div>
            </div>

            <div class="ab_all_black_cont col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ab_cont_all">

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ab_small_cont"><div class="main_b_first_circ">
                        <img src="http://etmakub.com/wp-content/themes/etmakub/img/b_circle.png" alt="First big progect">
                    </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ab_mini_block1">

                            <h1>
                                Design									<div class="ab_small_circ_r">
                                <img src="http://etmakub.com/wp-content/themes/etmakub/img/s_circle.png" alt="Small white circle">
                            </div>
                            </h1>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ab_mini_block2">
                        </div>
                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ab_small_cont">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ab_mini_block1">
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ab_mini_block2">
                            <h1>
                                Development
                                <div class="ab_small_circ_l">
                                <img src="http://etmakub.com/wp-content/themes/etmakub/img/s_circle.png" alt="Small white circle">
                            </div>
                            </h1>
                        </div>
                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ab_small_cont">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ab_mini_block1">
                            <h1>
                                Testing									<div class="ab_small_circ_r">

                                <img src="http://etmakub.com/wp-content/themes/etmakub/img/s_circle.png" alt="Small white circle">
                            </div>
                            </h1>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ab_mini_block2">
                        </div>
                    </div>
                    <div class="main_b_first_circ_l">
                        <img src="http://etmakub.com/wp-content/themes/etmakub/img/b_circle.png" alt="Last big progect">
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>

<section class="contakt" id="contakt">
    <div class="container">
        <div class="row">
            <div class="col-md-12 foot_head">
                <div class="foot_h1">
                    <h2 class="clear">
                        Contact
                    </h2>
                    <p class="clear">We are pleased to answer all your questions</p>
                </div>
            </div>

            <div class="footer_block_container col-md-12">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 inner_small_foot1">
                    <div class="sbl2 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 pod_bl1">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="col-md-8 col-xs-8 col-sm-8 col-lg-8 pod_bl2">
                            <span class="clear">Support 24/7</span>
                            <h2 class="clear">093 123 45 67</h2>
                            <p class="clear">Personal attention to each client</p>
                        </div>
                    </div>
                    <div class="sbl2 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 pod_bl1">
                            <i class="fa fa-envelope "></i>
                        </div>
                        <div class="col-md-8 col-xs-8 col-sm-8 col-lg-8 pod_bl2">
                            <span class="clear">Answer within 15 minutes</span>
                            <h2 class="clear">support@igc-mtd12.com</h2>
                            <p class="clear">Free consultation</p>
                        </div>
                    </div>
                    <div class="sbl2 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 pod_bl1"><i class="fa fa-skype"></i></div>
                        <div class="col-md-8 col-xs-8 col-sm-8 col-lg-8 pod_bl2">
                            <span class="clear">Skype</span>
                            <h2 class="clear">IGC-MTD12</h2>
                            <p class="clear">Always online</p>
                        </div>
                    </div>
                    <div class="sbl2 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 pod_bl1"><i class="fa fa-facebook"></i></div>
                        <div class="col-md-8 col-xs-8 col-sm-8 col-lg-8 pod_bl2">
                            <span class="clear">Facebook</span>
                            <h2 class="clear">IGC-MTD12</h2>
                            <p class="clear"></p>
                        </div>
                    </div>
                    <div class="sbl2 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 pod_bl1">
                        </div>
                    </div>
                </div>

                <%
                    request.setCharacterEncoding("utf-8");
                    String customerName = request.getParameter("customerName");
                    String customerEmail = request.getParameter("customerEmail");
                    String customerMessage = request.getParameter("customerMessage");

                    if (customerEmail != null) {
                        Notification notification = new Notification();
                        notification.send("You have new message from customer, his email is: " + customerEmail + " his name is: "
                                + customerName + "\n" + customerMessage);
                    }
                %>

                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 inner_small_foot2">
                    <form action="<c:url value="/"/>" class="formasimb" method="post">
                        <label for="c1">Your name</label>
                        <input type="text" id="c1" name="customerName" required placeholder="">
                        <label for="c2">Your E-mail</label>
                        <input type="text" id="c2" name="customerEmail" required placeholder="">
                        <label for="c3">Your message</label>
                        <textarea name="customerMessage" id="c3" cols="20" rows="6" placeholder=""></textarea>
                        <input type="submit" class="sublime" value="Submit">
                    </form>
                </div>
            </div>
            <div class="inner_footer col-md-12">
                <p>© All rights reserved.
            </div>
        </div>
    </div>
</section>
</body>
</html>