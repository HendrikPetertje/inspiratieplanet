$(document).ready(function() {



var windowWidth = $(window).width();
var logo = "";
logo += "			<img src=\"images\/logo.png\" id=\"logo\" class=\"links\">";
logo +="			<h1 class=\"links\" >GeenInspiratie<\/h1>";
// 1 colom
if((windowWidth > 0 ) && (windowWidth <= 500)){
	$('header').html(
		logo
	);

}if ((windowWidth > 510) && (windowWidth <= 760)){
	// 2 colom
	var inner2="";
inner2 += "			<img src=\"images\/logo.png\" id=\"logo\" class=\"links\">";
inner2 += "			<h1 class=\"links\" >GeenInspiratie<\/h1>";
inner2 += "<a href=\"#\" class=\"links \">Artikel toevoegen<\/a>";
	$('header').html(
		inner2
	);
}else{
var inner3="";
inner3 += "	<img src=\"images\/logo.png\" id=\"logo\" class=\"links\">";
inner3 += "			<h1 class=\"links\" >GeenInspiratie<\/h1>";
inner3 += "			<a href=\"#\" class=\"links menu \">Menu<\/a>";
inner3 += "			<a href=\"#\" class=\"links \">Artikel toevoegen<\/a>";
inner3 += "			<a href=\"#\" class=\"rechts\" id=\"message\">";
inner3 += "				<em>99<\/em>";
inner3 += "			<\/a>";
inner3 += "			<a href=\"#\" class=\"rechts\">Inloggen<\/a>";
inner3 += "";
inner3 += "			<div id=\"menu_dropdown\">";
inner3 += "				<a href=\"#\">Over ons<\/a>";
inner3 += "				<a href=\"#\">Contact<\/a>";
inner3 += "				<a href=\"#\">Contact<\/a>";
inner3 += "				<a href=\"#\">Contact<\/a>";
inner3 += "			<\/div>";

	$('header').html(
		inner3
	);
};


});