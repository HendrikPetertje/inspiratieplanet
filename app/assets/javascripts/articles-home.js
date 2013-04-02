$(function() {
	var item;
	$('#dramaTwo').click(function(evt) {
		$.getJSON('articles.json', function(data) {
			itemone = data[0];
			console.log( data[0].content );
			$('.tile').empty();
			$('.tile').append('<a href="/articles/' + itemone.id + '">' + '<h2>' + itemone.title + '</h2>' +  '<img src="' + itemone.picture + '" alt="">' + '</a>' )
			})
	});

	//Kaboom's random script for Ilse Kroes Homepage
	// Vars for the 5 datastacks currently used
	var random_item_1;
	var random_item_2;
	var random_item_3;
	var random_item_4;
	var random_item_5;

	//the listner & function
	$('#random_btn').click(function(evt) {
		//calling the JSON file and processing it
		$.getJSON('articles.json', function(randomdata) {
			//putting the randomdata-arrays in our vars
			random_item_1 = randomdata[0];
			random_item_2 = randomdata[1];
			random_item_3 = randomdata[2];
			random_item_4 = randomdata[3];
			random_item_5 = randomdata[4];

			console.log(random_item_1);
			console.log(random_item_2);
			console.log(random_item_3);
			console.log(random_item_4);
			console.log(random_item_5);

			
		})
	})


})



// Homepage scripts by Ilse Kroes

		$(document).ready(function(){
/*spore slider*/

	 		$('#btn_spore').click(function(){
				$('#spore_container').stop().animate({width: 'toggle'}, 130);
			});



/*FLIP artieken*/
			


	 		var $turn1 = function(){
				$(this).parent().animate({height: 240+"px", width: 0+'px', marginLeft: 120+'px'}, 100, function(){
				$(this).find('img').hide();
				}).animate({height: 240+'px', width: 240+'px', marginLeft:0+'px'}, 100);
			};

			var $turn2 = function(){
				$(this).parent().animate({height: 240+"px", width: 0+'px', marginLeft: 120+'px'}, 100, function(){
				$(this).find('img').show();
				}).animate({height: 240+'px', width: 240+'px', marginLeft:0+'px'}, 100);
			};


			$(".artikel img").click(
				$turn1
			);

			$(".artikel_tekst").mouseleave(
				$turn2
			);

	  	});




