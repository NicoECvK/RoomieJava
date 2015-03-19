/**
 * 
 */

$( document ).ready(function() {
    
    
//    Dorms
    $( "#checkbox1" ).click(function() {
	    	$( ".delete-class" ).each(function(i, obj) {
				var htmlString = $(this).html();
				if (htmlString.indexOf("Dorm") <= 0) {
					$(this).toggle();
				}
			});
    	});
    
    
//  Apartments
    $( "#checkbox2" ).click(function() {
	    	$( ".delete-class" ).each(function(i, obj) {
				var htmlString = $(this).html();
				if (htmlString.indexOf("Apartment") <= 0) {
					$(this).toggle();
				}
			});
    	});
    
    
//  Self-ops
    $( "#checkbox3" ).click(function() {
    		$( ".delete-class" ).each(function(i, obj) {
    			var htmlString = $(this).html();
    			if (htmlString.indexOf("Self-Op") <= 0) {
    				$(this).toggle();
    			}
    		});
    	});
    
    
//  Co-ops
    $( "#checkbox4" ).click(function() {
    		$( ".delete-class" ).each(function(i, obj) {
    			var htmlString = $(this).html();
    			if (htmlString.indexOf("Co-Op") <= 0) {
    				$(this).toggle();
    			}
    		});
    	});
    
    
//  Tier 1
    $( "#checkbox5" ).click(function() {
    		$( ".delete-class" ).each(function(i, obj) {
    			var htmlString = $(this).html();
    			if (htmlString.indexOf("Tier 1") <= 0) {
    				$(this).toggle();
    			}
    		});
    	});
    
    
//  Tier 2
    $( "#checkbox6" ).click(function() {
    		$( ".delete-class" ).each(function(i, obj) {
    			var htmlString = $(this).html();
    			if (htmlString.indexOf("Tier 2") <= 0) {
    				$(this).toggle();
    			}
    		});
    	});
    
    
//  Tier 3
    $( "#checkbox7" ).click(function() {
    		$( ".delete-class" ).each(function(i, obj) {
    			var htmlString = $(this).html();
    			if (htmlString.indexOf("Tier 3") <= 0) {
    				$(this).toggle();
    			}
    		});
    	});
    
    
//  Lower Row
    $( "#checkbox8" ).click(function() {
    		$( ".delete-class" ).each(function(i, obj) {
    			var htmlString = $(this).html();
    			if (htmlString.indexOf("Lower Row") <= 0) {
    				$(this).toggle();
    			}
    		});
    	});
    
    
//  Upper Row
    $( "#checkbox9" ).click(function() {
    		$( ".delete-class" ).each(function(i, obj) {
    			var htmlString = $(this).html();
    			console.log(htmlString);
    			if (htmlString.indexOf("Upper Row") <= 0) {
    				$(this).toggle();
    			}
    		});
    	});
    
    
//  Lake Houses
    $( "#checkbox10" ).click(function() {
    		$( ".delete-class" ).each(function(i, obj) {
    			var htmlString = $(this).html();
    			if (htmlString.indexOf("Lake House") <= 0) {
    				$(this).toggle();
    			}
    		});
    	});
    
    
//  Cowell Cluster
    $( "#checkbox11" ).click(function() {
    		$( ".delete-class" ).each(function(i, obj) {
    			var htmlString = $(this).html();
    			if (htmlString.indexOf("Cowell Cluster") <= 0) {
    				$(this).toggle();
    			}
    		});
    	});
});