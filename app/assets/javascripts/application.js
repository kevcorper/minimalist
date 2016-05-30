// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function() {
	$("#add-form").click(function(event) {
		event.preventDefault();

		$target = $(event.target)

		$('#snippet-form').slideToggle()
		if ($target.text() == 'Nevermind') {
			$target.text('create a snippet')
			$target.css('background-color', 'lightgray')
			$target.css('color', 'white')}
		else {
			$target.text('Nevermind')
			$target.css('background-color', 'white')
			$target.css('color', 'gray')}
	});

	// $('#snippet-form').submit(function(event) {
	// 	event.preventDefault();

	// 	$target = $(event.target)

	// 	$.ajax({url: $target.attr('action'), type: $target.attr('method'), data: $target.serialize()})
	// 		.done(function(response) {
	// 			$('.restaurants-all').prepend(response)
	// 			$('#add-rest-form').find('input[type=text]').val('')
	// 	});
	// });
});
