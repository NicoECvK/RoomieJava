/**
 * 
 */

$( document ).ready(function() {
	 $( "#commentButton" ).click(function() {
		 var houseName = getUrlParameter('houseName');
		 var commentText = $('textarea#commentText').val();
		 window.location.replace("http://localhost:8080/Roomie/WriteCommentServlet?houseName=" + houseName + "&commentText=" + commentText);
 	});
	 
	 
//	 http://stackoverflow.com/questions/19491336/get-url-parameter-jquery
	 function getUrlParameter(sParam)
	 {
	     var sPageURL = window.location.search.substring(1);
	     var sURLVariables = sPageURL.split('&');
	     for (var i = 0; i < sURLVariables.length; i++) 
	     {
	         var sParameterName = sURLVariables[i].split('=');
	         if (sParameterName[0] == sParam) 
	         {
	             return sParameterName[1];
	         }
	     }
	 } 
});