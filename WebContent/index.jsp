<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.util.ArrayList" %>
	<%@ page import ="databaseInteractor.DatabaseInteractor" %>
	<%@ page import ="databaseInteractor.House" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<link rel='stylesheet' type='text/css' href='css/global.css'>

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
    <link href="css/awesome-bootstrap-checkbox.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	 <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">

	<!-- Ratings Stars -->
	<link rel="stylesheet" href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="js/star-rating.js" type="text/javascript"></script>
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/FilterFunctionality.js"></script>
    

</head>

<body><!--

$( document ).ready(function() {
		$( ".checkbox" ).each(function(i, obj) {
			console.log("inside checkbox js");
			this.prop('checked', false);
		});
	
	});

	--><script>

	// http://www.mrc-productivity.com/techblog/?p=1235
	$(document).ready(function()
	        {
	                var d = new Date();
	                d = d.getTime();
	                if ($('#reloadValue').val().length == 0)
	                {
	                        $('#reloadValue').val(d);
	                        $('body').show();
	                }
	                else
	                {
	                        $('#reloadValue').val('');
	                        location.reload();
	                }
	        });

	</script>
	
	<input id="reloadValue" type="hidden" name="reloadValue" value="" />

    <div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
   
            <ul class="sidebar-nav">
                
             <li>
                    <a href="#">Housing Type </a>
                    <div class="sub-filters">
                        <ul>
                        	<li>
                                  <div class="checkbox checkbox-danger">
                                    <input type="checkbox" id="checkbox1" disabled>
                                    <label for="checkbox1">
                                        Dorms
                                    </label>
                                  </div>
                            </li>


                             <li>
                                  <div class="checkbox checkbox-danger">
                                    <input type="checkbox" id="checkbox2" disabled>
                                    <label for="checkbox2">
                                      Apartments 
                                    </label>
                                  </div>
                            </li>

                            <li>
                           
                                  <div class="checkbox checkbox-danger">
                                    <input type="checkbox" id="checkbox3">
                                    <label for="checkbox3">
                                     Self-ops 
                                    </label>
                                  </div>
                            </li>
                            
                            <li>
                            
                                  <div class="checkbox checkbox-danger">
                                    <input type="checkbox" id="checkbox4">
                                    <label for="checkbox4">
                                     Co-ops 
                                    </label>
                                  </div>
                            </li>
                       </ul>
                    </div>
                </li>
                <li>
                    <a href="#">Tier</a>
                    <div class="sub-filters">
	                   <ul>
	                   		<li>
                                  <div class="checkbox checkbox-danger">
                                    <input type="checkbox" id="checkbox5">
                                    <label for="checkbox5">
                                        Tier 1
                                    </label>
                                  </div>
                            </li>


                              <li>
                                  <div class="checkbox checkbox-danger">
                                    <input type="checkbox" id="checkbox6">
                                    <label for="checkbox6">
                                      Tier 2 
                                    </label>
                                  </div>
                          	  </li>

                            <li>
                                  <div class="checkbox checkbox-danger">
                                    <input type="checkbox" id="checkbox7" disabled>
                                    <label for="checkbox7">
                                     Tier 3 
                                    </label>
                                  </div>
                            </li>
	                   </ul>
	                   </div>
                </li>
                <li>
                    <a href="#">Location</a>
                     <div class="sub-filters">
                        <ul>
                            <li>
                                  <div class="checkbox checkbox-danger">
                                    <input type="checkbox" id="checkbox8">
                                    <label for="checkbox8">
                                        Lower Row
                                    </label>
                                  </div>
                            </li>
                            
                            <li>
                                  <div class="checkbox checkbox-danger">
                                    <input type="checkbox" id="checkbox9">
                                    <label for="checkbox9">
                                        Upper Row
                                    </label>
                                  </div>
                            </li>
                            
                            <li>
                                  <div class="checkbox checkbox-danger">
                                    <input type="checkbox" id="checkbox10">
                                    <label for="checkbox10">
                                        Lake Houses
                                    </label>
                                  </div>
                            </li>
                            
                            <li>
                                  <div class="checkbox checkbox-danger">
                                    <input type="checkbox" id="checkbox11">
                                    <label for="checkbox11">
                                        Cowell Cluster
                                    </label>
                                  </div>
                            </li>
                    </div> 
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

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            	<ul class="nav navbar-nav navbar-left">
            		<li>
                        <a href="index.html">Home</a>
                    </li>
                    
            	</ul>
            	
                <ul class="nav navbar-nav navbar-right">
                     <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a href="about.html">The Draw</a>
                    </li>
                    <li>
                        <a href="post.html">About</a>
                    </li>
                    	<li>
                        <a href="contact.html">Logout</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header">
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
    <div class = 'headerWrapper-index'></div>
    <div class="container">
            
            <!--  out.print("<div class=\"thumb-house\"><img src=\"img/houses-thumb/" + houseName + "-thumb.jpg\"></div>"); -->
        <div class="row">
        	<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">

		<div class="landing-page delete-class" id="roomie-description">
        		 <h4 class="cursive">A Guide to the Stanford Draw</h4>
	        	<form>
	        		 <fieldset>
	        		<br>Where are you living this year?
	        			<input class="textfield" type = 'text' name='userfound' placeholder='House Name'><br>
	        			<input type="checkbox"> Allow friends to see where I am living
					 </fieldset>
	        		<br><br>
	        		
	        		Community
	        		<input id="input-2c" class="rating" min="0" max="5" step="0.5" data-size="xs" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" />
	        		
	        		Food
	        		<input id="input-2c" class="rating" min="0" max="5" step="0.5" data-size="xs" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa">
	        		
					Location
	        		<input id="input-2c" class="rating" min="0" max="5" step="0.5" data-size="xs" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa">
		        
		        	Overall
	        		<input id="input-2c" class="rating" min="0" max="5" step="0.5" data-size="xs" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa">
	        		
	        		<br><input id="commentButton" type="submit" class="btn btn-primary" value="Save">
	        		</form>
        	</div>

        <% ServletContext context = request.getServletContext();
    	DatabaseInteractor dbInteractor = (DatabaseInteractor) context.getAttribute("dbInteractor");
    	ArrayList<House> allHouses = dbInteractor.getAllHouses();
    	for(House house : allHouses) {
    		String houseName = house.houseName;
    		String printName = houseName;
    		if(printName.equals("La Maison Francaise")) printName = "La Maison Franšaise";
    		String thumbName = house.thumbFileName;
    		String imageName = house.imageFileName;
    		String address = house.address;
    		String houseType = house.houseType;
    		String location = house.location;
    		String tier = house.tier;
    		
    		out.print("<div class=\"delete-class\" id=\"" + houseName + "\">");
    		out.print("<div class=\"post-preview\">");
    		out.print("<a href=\"HouseProfile.jsp?houseName=" + houseName + "\">");
    		out.print("<div class=\"thumb-house\"><img src=\"img/houses-thumb/" + thumbName + "\"></div>");
    		out.print("<h2 class=\"post-title\">");
    		out.print(printName);
    		out.print("</h2>");
    		out.print("<h3 class=\"post-subtitle\">");
    		out.print(address);
    		out.print("</h3>");
    		out.print("</a>");
    		out.print("<p class=\"post-meta\">" + houseType + "</p>");
    		out.print("</div>");
    		out.print("<hr>");
    		out.print("<input type=\"hidden\" value=\"" + location + "\">");
    		out.print("<input type=\"hidden\" value=\"Tier " + tier + "\">");
    		out.print("</div>");
    	}
    	%>
            
                
                <!-- Pager 
                <ul class="pager">
                    <li class="next">
                        <a href="#">Older Posts &rarr;</a>
                    </li>
                </ul>
            --></div>
        </div>
    </div>

    <hr>

    <!-- Footer -->
    <footer class="copyright">
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
