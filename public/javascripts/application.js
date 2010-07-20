// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var older, latest;
var preview = function(){
	latest = $('#need_preview').val();
	if(latest != older){
		older = latest;
		$.get('/previews/', {'term': latest}, function(data){$('#preview').html(data)});
	}
}
$(document).ready(function(){
	setInterval(preview,100);
})