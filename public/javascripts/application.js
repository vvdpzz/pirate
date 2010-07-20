// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var kk;
var prev = function(){
	var foobar = $('#need_preview').val();
	if(foobar != kk){
		kk = foobar;
		$.get('/previews/', {'term': foobar}, function(data){
			$('#preview').html(data)
		})
	}
}
$(document).ready(function(){
	setInterval(prev,100);
})