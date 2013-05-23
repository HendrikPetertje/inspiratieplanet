$(window).load(function(){
			/*dropdown menu==========================================*/
	$('.navleft-dropdown').hide(); 

	$('.nav-menu-btn').click(function(){
		$('.navleft-dropdown').slideToggle(100); 
	})

	$('.nav-menu-btn_2').click(function(){
		$('.navleft-dropdown').slideToggle(100); 
	})

	$('#comments_btn').click(function(){
		$('#reaties_container').slideToggle(100);
	});

	$('.categoriee ul').hide();

	$('.dropdown_2').each(function(idx){
		$(this).click(function(evt){
			evt.preventDefault();
			$(evt.target).next().slideToggle();
		})
	})
	

			/*spore slider==========================================*/
			$("#spore_container").hide();

	 		$('#btn_spore').click(function(){
				$('#spore_container').stop().animate({width: 'toggle'}, 130);
			});


			/*artikel filp==========================================*/
			var array = $(".artikel_wrapper");

			for (var i = 0; i < array.length; i++){
				var titelH = parseFloat($(array[i]).find("h3").css("height"));
				var x = parseFloat($(array[i]).find(".artikel_tegel").css("height"));
				var textX = x - 60
				$(array[i]).find(".text_wrapper").height(" " + textX + "px");
				$(array[i]).height(x + titelH);
			};

	 		var $turn1 = function(){
			$(this).parent().animate({height: 240+"px", width: 0+'px', marginLeft: 120+'px'}, 100, function(){
			$(this).find('.artikel_tegel').hide();
			}).animate({height: 240+'px', width: 240+'px', marginLeft:0+'px'}, 100);
			};

			var $turn2 = function(){
			$(this).parent().animate({height: 240+"px", width: 0+'px', marginLeft: 120+'px'}, 100, function(){
			$(this).find('.artikel_tegel').show();
			}).animate({height: 240+'px', width: 240+'px', marginLeft:0+'px'}, 100);
			};


			$(".artikel_tegel").click(
			$turn1
			);

			$(".text_wrapper").click(
			$turn2
			);
				
		});