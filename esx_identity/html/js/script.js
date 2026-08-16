$(function() {
	 $('.input-text').keyup(function(event) {
        var textBox = event.target;
        var start = textBox.selectionStart;
        var end = textBox.selectionEnd;
        textBox.value = textBox.value.charAt(0).toUpperCase() + textBox.value.slice(1).toLowerCase();
    });
	window.addEventListener('message', function(event) {
		if (event.data.type == "enableui") {
			document.body.style.display = event.data.enable ? "block" : "none";
		}
	});
	
	$("#register").submit(function(event) {
		event.preventDefault(); // Prevent form from submitting		

			$.post('http://esx_identity/register', JSON.stringify({
				firstname: $("#firstname").val(),
				lastname: $("#lastname").val(),
				sex: $("input[type='radio'][name='sex']:checked").val(),
				height: $("#height").val()
			}));
	});
	$.post('http://esx_identity/uiLoaded')
});
