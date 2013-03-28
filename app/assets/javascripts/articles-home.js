// This is the javascript file for articles home. all code for articles should go here
function drama() {
	// we are looking for a div with the classname ( . like in css) replacercontent. this div will be repopulated with the content after emptying
	$('.replacercontent').empty();
	$('.replacercontent').append('hier kom een hook die de json uitleest en er random conent in zet.');
}

function dramaTwo() {
	$.getJSON('articles.json', function(data) {
	  $('.result').html(data);

		$.each(data, function(id, title) {
		data.push('<li id="' + id + '">' + title + '</li>');
		});
		$('<ul/>', {
			'class': 'my-new-list',
			html: data.join('')
		}).appendTo('.raplacercontent');
	});
}