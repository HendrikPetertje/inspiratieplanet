
	// Stuff to do as soon as the DOM is ready;

			/*Artikel card layout==========================================*/

			var colCount = 0;
			var colWidth = 0;
			var margin = 10;
			var wrapperWidth = 0;
			var Collums = [];
			var lastArticle = null;
			var wrapperHeight = 0;

			/*Opnieuw indelen als windows verandert*/
			$(function(){
    			$(".wrapper").resize(setupCollums);
			});

			function setupCollums(){
				wrapperWidth = $('#wrapper').width();
				colWidth = $('.artikel_wrapper').outerWidth();
				colCount = Math.floor(wrapperWidth/(colWidth + margin));

				for (var i = 0; i <colCount; i++) {
					Collums.push(margin);
				}
				positionArticel();
			}

			function positionArticel() {
			    $('.artikel_wrapper').each(function(){
			        var min = Array.min(Collums);
			        var index = $.inArray(min, Collums);
			        var leftPos = margin+(index*(colWidth+margin));
			        $(this).css({
			            'left':leftPos+'px',
			            'top':min+'px'
			        });
			        Collums[index] = min+$(this).outerHeight()+margin;

			        lastArticle = $(this);
			        wrapperHeight = parseFloat(lastArticle.css("top")) + lastArticle.height();

			        $("#wrapper").height(" " + wrapperHeight + "px")

			    }); 
			}

			/*Functie voor het vinden van de Min value in een array*/
				Array.min = function(array) {
				    return Math.min.apply(Math, array);
				};

			/*Functie voor het vinden van de Mx value in een array*/
