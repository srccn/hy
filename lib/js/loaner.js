$(document).ready(function() {

	
    //show note details when hover 
    $('[data-toggle="popover"]').popover();
    
	$('#addArticleBtn').click ( function() {
		
		if ( $('#bulkLoadFrm').is(":visible") ) {
			$('#bulkLoadFrm').toggle();
		};
		
		$('#addArticleFrm').toggle();
		
		//$('#addArticleFrm').fadeToggle("slow", "linear"); //problem with IE
	});

	$('#bulkLoadBtn').click ( function() {

		if ( $('#addArticleFrm').is(":visible") ) {
			$('#addArticleFrm').toggle();
		};
		
		$('#bulkLoadFrm').toggle();
		//$('#addArticleFrm').fadeToggle("slow", "linear"); //problem with IE
	});

	
	$("#menu a").click(function() {
	    $(this).parent().children().removeClass("active");
	    $(this).addClass("active");
	});
	
	$('#addUserBtn').click ( function() {
		$('#addUserFrm').toggle();
		//$('#addArticleFrm').fadeToggle("slow", "linear"); //problem with IE
	});
	

	//Find Rates button clicked
	$('#inputForm').submit( function(ev) {
		    
		    $("#resultPanel").html("Calculating ....");
		
		    //alert("searching rate ....");
		    //return false;
		    inputForm =$('#inputForm').serialize();
		    
			$.ajax ({
				url : "/f3/calculate" ,
				type: "POST",
				data: inputForm,
				success: function (data2, textStatus, jqXHR) {
					$("#resultPanel").html(data2);
				},
				error: function (jqXHR, textStatus, errorThrown) {
					alert("rate search failed");
				}
			});
			 ev.preventDefault();
			 return false;
	});
	
	
	// auto close message after 2 seconds
	setTimeout(function() {  
    		$('#message').fadeOut('slow');  
		}, 3000); // <-- time in milliseconds  
	

});

function showDialog (pageid, string_in) {
	
	var data = pageid;
	var data2 = string_in;
	var out = "";
    for (var key in data) {
        if (data.hasOwnProperty(key)) {
           out += key + " ---   $" + data[key] + "<br>";
        }
     }
    
     if ( typeof data2 !== 'undefined' && data2 !== "") {
    	out += "<hr>" 
    	out += "SRP ---   " + data2 + "<br>"; 
     }
    
	document.getElementById('light').style.display='block';
	document.getElementById('light').innerHTML = 
		"<br> Loan Calculation Details." + 
        ' <button id="clsoePopup" href ="#rateArea" onClick="closeDialog();" class="btn btn-link">Close</button> <hr>' +
        out ;
	document.getElementById('fade').style.display='block';
	
}

function closeDialog() {
	document.getElementById('light').style.display='none';
	document.getElementById('fade').style.display='none';
} 

function cleanRatePageVisit () {
	sessionStorage.removeItem('setFrontVisit') ;
    return true;
}


$('.list-group-item').on('click',function(e){
    var previous = $(this).closest(".list-group").children(".active");
    previous.removeClass('active'); // previous list-item
    $(e.target).addClass('active'); // activated list-item
  });


