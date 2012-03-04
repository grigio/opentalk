// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// require jquery //cdn
//= require jquery_ujs
//= require twitter/bootstrap

//= require Markdown.Converter
//= require Markdown.Sanitizer
//= require Markdown.Editor

//= require main

// require handlebars
// require pages
// require talks
// require poirot
// require poirot-handlebars


// $(document).ready(function() {
//   $('.toggle_vote').live('ajax:success', function(data, textStatus, jqXHR){
//     $(this).hide();
//   });

// });
$(document).ready(function() {
	$('.user-profile').popover( { delay: { show: 500, hide: 1000 } });

	$('#talk-more-html').bind('ajax:success', function(evt, data, status, xhr){
	    var $this = $(this);

	    // do something with 'data' response object

	    $('#talk_list').append(data);
	    // FIXME DRY
	    $('.user-profile').popover( { delay: { show: 500, hide: 1500 } });

	});

	// render markdown to html in /talk/show
    var converter1 = Markdown.getSanitizingConverter();
    var editor1 = new Markdown.Editor(converter1);
    editor1.run();

// NOTE: mustache way
// $('#talk-more').click(function () {
// 	// body...
// 	$.getJSON('/talks.json', function(data) {
// 		$('body').append( poirot.talkList( '{ "talks":' + data + '}' ) );
// 		//$('body').append( '{ "talks":' + JSON.stringify(data) + '}' );
// 		//$('body').append( data  );
// 		console.log( JSON.stringify('{ "talks":' + data + '}') );
// 		//console.log('{ "talks":' + JSON.stringify(data) + '}');
// 	});
// });

});