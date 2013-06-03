$(document).ready(function(){

		articlenumber = 4
	$('.user-articles-morebutton').click(function() {
		$.getJSON('user.json', function(article) {
			for ( var i = articlenumber; i < articlenumber + 4 ; i++ ) {
				if(article[i] === undefined){

				}else{
					console.log( article[i] );
					$('#res_wrapper').append(
						'<div class="artikel_wrapper">' +
							'<div class="artikel_container">' +
							'<div class="kop_k">' +
							'<h3>' + article[i].title + '</h3>' +
							'</div>' +
							'<img class="artikel_tegel" src="' + article[i].picture.thumb.url + '" alt="images">' +
								'<div class="text_wrapper">' +
									
									'<div class="text_wrapper">' +
										article[i].content +
										'</div>' +
									'<br><a href="/articles/' + article[i].id + '">Bekijken</a>' +
									' <a href="/articles/' + article[i].id + '/edit">Bewerken</a>' +
									' <a href="/articles/' + article[i].id + '" data-method="delete" rel="nofollow">Verwijderen</a>' +
								'</div>' +
						'</div>'

						// '<div class="artikel_wrapper">' +
						// 	'<div class="artikel_container">' +
						// 			'<div class="kop_k">' +
						// 				'<h3>' + article[i].title + '</h3>' +
						// 			'</div>' +
										
						// 				'<img class="artikel_tegel" src="' + article[i].picture_url(:thumb)  + '" alt="images">' +
										
										// '<div class="text_wrapper">' +
										//  truncate(article[i].content, :length => 270, :separator => ' ') +
										// '</div>' +

						// 				'<button class="article-index-button" id="<%= userarticlenumber %>">Bekijken <div></div> </button>' +
										
										
						// 				link_to 'Show', article[i] +
						// 				link_to 'Edit', edit_article_path(article)[i] +
						// 				link_to 'Destroy', article[i], method: :delete, data: { confirm: 'Are you sure?' } +
										
						// 	'</div>'
						// '</div>'
						);
				}
			};
			articlenumber += 4;

			setupCollums();

		});


	
	});

});