$(document).ready(function() {
	$("#add-form").click(function(event) {
		event.preventDefault();

		$target = $(event.target)

		$('#snippet-form').slideToggle()
		if ($target.text() == 'nevermind') {
			$target.text('create a snippet')
			$target.css('background-color', 'lightgray')
			$target.css('color', 'white')}
		else {
			$target.text('nevermind')
			$target.css('background-color', 'white')
			$target.css('color', 'gray')}
	});
});