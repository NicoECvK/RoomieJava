<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel='stylesheet' type='text/css' href='css/global.css'>
<title>Welcome to Roomie</title>
</head>
<body>

<div class = 'headerWrapper'>
	<div class="left"><a href = '/project108/Homepage'><img src="/project108/Logo_QS.png" height="42" width="42"></a></div>
	
	<div class="left">
	<form action='/project108/searchUser' method='POST'>
		<input type = 'text' class = 'headerSearchBar' name='userfound' placeholder='search users'>
	</form></div>
	
	<div class="left"><span style="margin-left:30px"><a href = '/project108/CreateQuiz'>Create Quiz</a></span></div>	
	<div class="left"><span style="margin-left:30px"><a href = '/project108/BrowseQuizzes'>Browse Quizzes</a></span></div>	
	
	<div class="logout">
	<form action = '/project108/Logout' method = 'POST'><input type = 'Submit' value = 'Logout'></form>
	</div>
	
	<div class="right">
		<a href = '/project108/Profile'>My Profile</a> <span style="margin-left:20px"></span>
	</div>

</div>

</body>
</html>