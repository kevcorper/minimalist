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