// this is de default javascript file for the application. functions that should be implemented on all article pages go here
$(document).ready(function() {
	$(".favoritebutton").click(function() {
	  var article_id = $(".favorite-container").attr('id');
	  $.ajax({
	    type: "POST",
	    url: '/favorites/add/' + article_id,
	    success: function() {
	      $(".favorite-container").empty().append("<div class='unfavoritebutton'></div>")
	    },
	  })
	})

	$(".unfavoritebutton").click(function() {
	  var article_id = $(".favorite-container").attr('id');
	  $.ajax({
	    type: "post",
	    url: '/favorites/destroy/' + article_id,
	    success: function() {
	      $(".favorite-container").empty().append("<div class='favoritebutton'></div>")
	    },
	  })
	})
})

// testlijn
