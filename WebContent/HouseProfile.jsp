<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <%@ page import ="java.util.ArrayList" %>
    <%@ page import ="databaseInteractor.DatabaseInteractor" %>
    <%@ page import ="databaseInteractor.House" %>
    <%@ page import ="databaseInteractor.Comment" %>
    <% String houseName = request.getParameter("houseName");
    System.out.println(houseName);
    ServletContext context = request.getServletContext();
    DatabaseInteractor dbInteractor = (DatabaseInteractor) context.getAttribute("dbInteractor");
    House house = dbInteractor.searchHouseByName(houseName); 
    if(house == null) {
        response.sendRedirect("http://localhost:8080/Roomie/index.jsp");
        return;
    }
    String imageFileName = house.imageFileName; 
    ArrayList<Comment> comments = dbInteractor.searchCommentByHouseName(houseName); %>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><%= house.houseName%></title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/clean-blog.min.css" rel="stylesheet">

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
                <a class="navbar-brand" href="index.jsp">Roomie</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <!-- <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a href="about.html">About</a>
                    </li>
                    <li>
                        <a href="post.html">Sample Post</a>
                    </li> -->
                    <li>
                        <a href="contact.html">My Account</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('img/<%=imageFileName%>')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="post-heading">
                        <h1><%= house.houseName%></h1>
                        <h2 class="subheading"></h2>
                        <span class="meta"><%= house.address%><a href="#"></a></span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <article id="summary">
         <div class="container">
            <!-- <div class="row"> -->
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div>
                        <div class="icon"><img src="img/tier-icon.png">&nbsp <%= house.tier%></div>
                        <div class="icon"><img src="img/house-icon.png">&nbsp <%= house.houseType%></div>
                        <div class="icon"><img src="img/residents-icon.png">&nbsp <%= house.numResidents%></div>
                        <div class="icon"><img src="img/location-icon.png"><%= house.location%></div><br>
                    </div><br>
                </div>
            <!-- </div> -->
        </div>
    <br></article>

    <!-- Post Content -->
    <article id="description"><br>
        <div class="container">
            <!-- <div class="row"> -->
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">

                    <div class="desc-title">Basic Information</div>
                    <div class="desc-text">
                        Room Types: <%= house.roomTypes%><br>Staff: <%= house.houseStaffPositions%><br>Gender: <br>No Theme
                    </div>

                    <div class="text_line"></div>

                    <div class="desc-title">Description</div>
                    <div class="desc-text"><%= house.text%></div>

                </div>
            <!-- </div> -->
        </div>
    </article>

    <article id="comments"><br>
         <div class="container">
            <!-- <div class="row"> -->
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <h3>Reviews</h3><br>

                    <div class="desc-title" align="center">Summary</div>
                    <div class="desc-text" id="star-align">Community<img src="img/stars.jpg" align="right"><br>Food<img src="img/stars.jpg" align="right"><br>Location<img src="img/stars.jpg" align="right"><br>Overall<img src="img/stars.jpg" align="right"></div>
					
					<% for(Comment comment : comments) {
							out.println("<br><div class=\"text_line\"></div>");
							out.println("<div class=\"desc-title\" align=\"center\">" + comment.username + "<img src=\"profile-pic.png\"><br><br></div><br>");
							out.println("<div class=\"desc-text\"><i>" + comment.text + "</i></div>");
					}%>
                    <br><div class="text_line"></div>
                    

                    <form action="/Roomie/WriteCommentServlet" method="POST">
                    <input type="hidden" name="houseName" value="\"" + <%= houseName %> + "\"">
                    <div class="form-group">
                        <label>User</label>
                        <input type="text" class="form-control" name="username" id="inputEmail" placeholder="Your Name">
                    </div>
                    <div class="form-group">
                        <label>Comment</label>
                        <input type="text" class="form-control" name="commentText" id="inputPassword" placeholder="Write Comment">
                    </div>
                    <div class="checkbox">
                        Community<img src="img/empty-stars.jpg">
                        Food<img src="img/empty-stars.jpg">
                        Location<img src="img/empty-stars.jpg">
                        Overall<img src="img/empty-stars.jpg">
                    </div>
                    <button type="submit" class="btn btn-primary">Post</button>
                </form>
                </div>
            <!-- </div> -->
        </div>
    </article>

    <hr>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <p class="copyright text-muted">Copyright &copy; Roomie 2015</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/clean-blog.min.js"></script>

</body>

</html>