$(document).ready(function() {
	$('.navleft-dropdown').hide(); 

	$('.nav-menu-btn').click(function(){
		$('.navleft-dropdown').slideToggle("slo"); 
	})

});