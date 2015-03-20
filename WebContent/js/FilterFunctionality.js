/**
 * 
 */

$( document ).ready(function() {
    
	var dorms = 0;
	var apartments = 0;
	var selfOps = 0;
	var coOps = 0;
	var tier1 = 0;
	var tier2 = 0;
	var tier3 = 0;
	var lowerRow = 0;
	var upperRow = 0;
	var lakeHouses = 0;
	var cowellCluster = 0;
	
	$( ".delete-class" ).each(function(i, obj) {
		$(this).hide();
	});
	$("#roomie-description").show();
	
	
	// Returns an object with the names of all of the houses that fit into on of the checked categories.
	function createHouseTypeObj() {
		var houseTypeObj = {};
		$( ".delete-class" ).each(function(i, obj) {
			var id = this.id;
			var htmlString = $(this).html();
			if(dorms == 0 && apartments == 0 && selfOps == 0 && coOps == 0) {
				houseTypeObj[id] = true;
			}
			if (dorms && htmlString.indexOf("Dorm") >= 0) {
				houseTypeObj[id] = true;
			}
			if (apartments && htmlString.indexOf("Apartment") >= 0) {
				houseTypeObj[id] = true;
			}
			if (selfOps && htmlString.indexOf("Self-Op") >= 0) {
				houseTypeObj[id] = true;
			}
			if (coOps && htmlString.indexOf("Co-Op") >= 0) {
				houseTypeObj[id] = true;
			}
		});
		return houseTypeObj;
	}
	
	
	// Returns an object with the names of all of the houses that fit into on of the checked categories.
	function createTierObj() {
		var tierObj = {};
		$( ".delete-class" ).each(function(i, obj) {
			var id = this.id;
			var htmlString = $(this).html();
			if(tier1 == 0 && tier2 == 0 && tier3 == 0) {
				tierObj[id] = true;
			}
			if (tier1 && htmlString.indexOf("Tier 1") >= 0) {
				tierObj[id] = true;
			}
			if (tier2 && htmlString.indexOf("Tier 2") >= 0) {
				tierObj[id] = true;
			}
			if (tier3 && htmlString.indexOf("Tier 3") >= 0) {
				tierObj[id] = true;
			}
		});
		return tierObj;
	}
	
	
	// Returns an object with the names of all of the houses that fit into on of the checked categories.
	function createLocationObj() {
		var locationObj = {};
		$( ".delete-class" ).each(function(i, obj) {
			var id = this.id;
			var htmlString = $(this).html();
			if(lowerRow == 0 && upperRow == 0 && lakeHouses == 0 && cowellCluster == 0) {
				locationObj[id] = true;
			}
			if (lowerRow && htmlString.indexOf("Lower Row") >= 0) {
				locationObj[id] = true;
			}
			if (upperRow && htmlString.indexOf("Upper Row") >= 0) {
				locationObj[id] = true;
			} 
			if (lakeHouses && htmlString.indexOf("Lake House") >= 0) {
				locationObj[id] = true;
			}
			if (cowellCluster && htmlString.indexOf("Cowell Cluster") >= 0) {
				locationObj[id] = true;
			}
		});
		return locationObj;
	}
	
	
	function createFinalObj() {
		var houseTypeObj = createHouseTypeObj();
		var tierObj = createTierObj();
		var locationObj = createLocationObj();
		var finalObj = {};
		$( ".delete-class" ).each(function(i, obj) {
			var id = this.id;
			if(houseTypeObj[id] && tierObj[id] && locationObj[id]) {
				console.log(id);
				finalObj[id] = true;
			}
		});
		return finalObj;
	}
	
	
	function displayHouses() {
		var finalObj = createFinalObj();
		$( ".delete-class" ).each(function(i, obj) {
			$(this).hide();
			var id = this.id;
			if(finalObj[id]) {
				$(this).show();
			}
		});
		if(dorms == 0 && apartments == 0 && selfOps == 0 && coOps == 0 && 
				tier1 == 0 && tier2 == 0 && tier3 == 0 && lowerRow == 0 && upperRow == 0 && lakeHouses == 0 && cowellCluster == 0) {
			$( ".delete-class" ).each(function(i, obj) {
				$(this).hide();
				$("#roomie-description").show();
			});
		}
	}
	
    
//    Dorms
    $( "#checkbox1" ).click(function() {
	    	if(dorms == 0) {
	    		dorms = 1;
	    	} else {
	    		dorms = 0;
	    	}
	    	displayHouses();
    	});
    
    
//  Apartments
    $( "#checkbox2" ).click(function() {
	    	if(apartments == 0) {
	    		apartments = 1;
	    	} else {
	    		apartments = 0;
	    	}
	    	displayHouses();
    	});
    
    
//  Self-ops
    $( "#checkbox3" ).click(function() {
	    	if(selfOps == 0) {
	    		selfOps = 1;
	    	} else {
	    		selfOps = 0;
	    	}
	    	displayHouses();
    	});
    
    
//  Co-ops
    $( "#checkbox4" ).click(function() {
	    	if(coOps == 0) {
	    		coOps = 1;
	    	} else {
	    		coOps = 0;
	    	}
	    	displayHouses();
    	});
    
    
//  Tier 1
    $( "#checkbox5" ).click(function() {
	    	if(tier1 == 0) {
	    		tier1 = 1;
	    	} else {
	    		tier1 = 0;
	    	}
	    	displayHouses();
    	});
    
    
//  Tier 2
    $( "#checkbox6" ).click(function() {
	    	if(tier2 == 0) {
	    		tier2 = 1;
	    	} else {
	    		tier2 = 0;
	    	}
	    	displayHouses();
    	});
    
    
//  Tier 3
    $( "#checkbox7" ).click(function() {
	    	if(tier3 == 0) {
	    		tier3 = 1;
	    	} else {
	    		tier3 = 0;
	    	}
	    	displayHouses()
    	});
    
    
//  Lower Row
    $( "#checkbox8" ).click(function() {
	    	if(lowerRow == 0) {
	    		lowerRow = 1;
	    	} else {
	    		lowerRow = 0;
	    	}
	    	displayHouses();
    	});
    
    
//  Upper Row
    $( "#checkbox9" ).click(function() {
	    	if(upperRow == 0) {
	    		upperRow = 1;
	    	} else {
	    		upperRow = 0;
	    	}
	    	displayHouses();
    	});
    
    
//  Lake Houses
    $( "#checkbox10" ).click(function() {
	    	if(lakeHouses == 0) {
	    		lakeHouses = 1;
	    	} else {
	    		lakeHouses = 0;
	    	}
	    	displayHouses();
    	});
    
    
//  Cowell Cluster
    $( "#checkbox11" ).click(function() {
	    	if(cowellCluster == 0) {
	    		cowellCluster = 1;
	    	} else {
	    		cowellCluster = 0;
	    	}
	    	displayHouses();
    	});
});