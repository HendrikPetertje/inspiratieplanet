$(document).ready(function(){
		articlenumber = 4
	$('.user-articles-morebutton').click(function() {
		$.getJSON('user.json', function(article) {
			for ( var i = articlenumber; i < articlenumber + 4 ; i++ ) {
				if(article[i] === undefined){

				}else{
					console.log( article[i] );
					$('.user-articles-morecontent').append(
						'<div class="article_block">' +
							'<img class="article_tile" src="' + article[i].picture.thumb.url + '" alt="images">' +
								'<div class="text_wrapper">' +
									'<h3>' + article[i].title + '</h3>' +
									'<div class="article_text">' +
									article[i].content +
									'</div>' +
									article[i].created_at +
									'<br><a href="/articles/' + article[i].id + '">Bekijken</a>' +
									' <a href="/articles/' + article[i].id + '/edit">Bewerken</a>' +
									' <a href="/articles/' + article[i].id + '" data-method="delete" rel="nofollow">Verwijderen</a>' +
								'</div>' +
						'</div>'
						);
				}
			};
			articlenumber += 4;
		});
	
	})

})