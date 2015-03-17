<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.util.ArrayList" %>
	<%@ page import ="databaseInteractor.DatabaseInteractor" %>
	<%@ page import ="databaseInteractor.House" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Filters</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/clean-blog.min.css" rel="stylesheet">
    <link href="css/simple-sidebar.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">
        
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                        Filters
                    </a>
                </li>
                <li>
                    <a href="#">Housing Type </a>
                    <div class="sub-filters">
                        <ul>
                       <!--  <div class="filter-choices">
                            <div class="checkbox"><input tabindex="-1" type="checkbox" name="Type" id="e1-52" class="cbx"></div>
                            <div class="checkbox-label">Dorms</div>
                        </div>
                        <div class="filter-choices">
                            <div class="checkbox"><input tabindex="-1" type="checkbox" name="Type" id="e1-52" class="cbx"></div>
                            <div class="checkbox-label">Appartments</div>
                        </div>
                        <div class="filter-choices">
                            <div class="checkbox"><input tabindex="-1" type="checkbox" name="Type" id="e1-52" class="cbx"></div>
                            <div class="checkbox-label">Houses</div>
                        </div> -->

                            <li>Dorms</li>
                            <li>Appartments</li>
                            <li>Houses</li>
                    </div>
                </li>
                <li>
                    <a href="#">Tier</a>
                   <!--  <div class="sub-filters">
                        <ul>
                            <li>Tier One</li>
                            <li>Tier Two</li>
                            <li>Tier Three</li>
                    </div> -->
                </li>
                <li>
                    <a href="#">Location</a>
                    <!-- <div class="sub-filters">
                        <ul>
                            <li>East Campus</li>
                            <li>West Campus</li>
                    </div> -->
                </li>
                <li>
                    <a href="#">Theme</a>
                    <!-- <div class="sub-filters">
                        <ul>
                            <li>No Theme</li>
                            <li>Cultural Theme</li>
                            <li>Other Theme</li>
                    </div> -->
                </li>
                <li>
                    <a href="#">Gender</a>
                </li>
                <li>
                    <a href="#">Community</a>
                </li>
<!--                 <li>
                    <a href="#">Filter 7</a>
                </li> -->
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Start Bootstrap</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
         <!--            <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a href="about.html">About</a>
                    </li>
                    <li>
                        <a href="post.html">Sample Post</a>
                    </li> -->
                    <li>
                        <a href="contact.html">MyAccount</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('img/home-bg.jpg')">
        <div class="container">
            <div class="nav-bar"></div>

 <!--            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>Roomie</h1>
                        <hr class="small">
                        <span class="subheading">A Guide to Stanford Housing.</span>
                    </div>
                </div>
            </div> -->


        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
        	<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        
        <% ServletContext context = request.getServletContext();
    	DatabaseInteractor dbInteractor = (DatabaseInteractor) context.getAttribute("dbInteractor");
    	ArrayList<House> allHouses = dbInteractor.getAllHouses();
    	for(House house : allHouses) {
    		String houseName = house.houseName;
    		String printName = houseName;
    		if(printName.equals("La Maison Francaise")) printName = "La Maison Française";
    		
    		out.print("<div class=\"post-preview\">");
    		out.print("<a href=\"HouseProfile.jsp?houseName=" + houseName + "\">");
    		out.print("<div class=\"thumb-house\"><img src=\"img/houses-thumb/" + houseName + "-thumb.jpg\"></div>");
    		System.out.println("<div class=\"thumb-house\"><img src=\"img/houses-thumb/" + houseName + "-thumb.jpg\"></div>");
    		out.print("<h2 class=\"post-title\">");
    		out.print(printName);
    		out.print("</h2>");
    		out.print("<h3 class=\"post-subtitle\">");
    		out.print("Problems look mighty small from 150 miles up");
    		out.print("</h3>");
    		out.print("</a>");
    		out.print("<p class=\"post-meta\">Posted by <a href=\"#\">Start Bootstrap</a> on September 24, 2014</p>");
    		out.print("</div>");
    		out.print("<hr>");
    	}
    	%>
            
                
                <!-- Pager -->
                <ul class="pager">
                    <li class="next">
                        <a href="#">Older Posts &rarr;</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <hr>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <ul class="list-inline text-center">
                        <li>
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                    </ul>
                    <p class="copyright text-muted">Copyright &copy; Roomie 2015</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery2.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/clean-blog.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>
