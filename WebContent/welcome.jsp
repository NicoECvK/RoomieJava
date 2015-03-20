<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='Index/index.css'>

 <link href="//fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css"> 
 <link rel='stylesheet' type='text/css' href='css/global.css'>
 <link rel="stylesheet" href="css/login-style.css">
 <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
 
 <!-- Custom CSS -->
    <link href="css/clean-blog.min.css" rel="stylesheet">
 
 <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    

<title>Welcome</title>
</head>
<body>

<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      window.location.replace("http://roomie2-cs191w.rhcloud.com/ourIndex.jsp");
      testAPI();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '1574222249501316',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.2' // use version 2.2
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }

  function logout() {
    console.log("Log out is executing.");
    FB.getLoginStatus(function(response) {
        if (response && response.status === 'connected') {
            FB.logout(function(response) {
                console.log("User is logged in and is about to be logged out.");
                document.location.reload();
            });
        }
    });
  }


</script>

<div class = 'headerWrapper'>
	
	<!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            	
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
<div class="container" class="body-one">
	
    <div class="row">
    
      <div class="col-md-5 col-md-offset-1" style="margin-top: 15%">
        <h4 class="cursive">Welcome to <img src="img/Roomie.png" height="70"></h4>
        <p>The unchanged computer dances with the male.The newcomer forces the some unfortunate on top of the phenomenon.Within the barrister cautions the design.
        The coupled riot invades the applause with a mainstream pipe.The exploited disco indulges underneath a tone. Raymond are you reading this?</p>
      </div>

      	<div class="col-md-2 col-md-offset-1" style="margin-top: 15%">
<<<<<<< HEAD
	      <div id="login-form">

    <h3>Login</h3>

    <fieldset>

      <form action="javascript:void(0);" method="get">

        <input type="email" required value="Email" onBlur="if(this.value=='')this.value='Email'" onFocus="if(this.value=='Email')this.value='' "> <!-- JS because of IE support; better: placeholder="Email" -->

        <input type="password" required value="Password" onBlur="if(this.value=='')this.value='Password'" onFocus="if(this.value=='Password')this.value='' "> <!-- JS because of IE support; better: placeholder="Password" -->

        <input class="red-button" type="submit" value="Login">

        <footer class="clearfix">

          <p><span class="info">?</span><a href="#">Forgot Password</a></p>

        </footer>

      </form>

    </fieldset>

  </div> <!-- end login-form -->

			<!-- End login box -->
		
		
  		</div>
	</div>
	

    
</div>
</body>
	    <!-- Footer -->
	    <br><br><hr>
    <footer class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <p class="copyright text-muted">Copyright &copy; Roomie 2015</p>
                </div>
            </div>
        </div>
    </footer>

</html>