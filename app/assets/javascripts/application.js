// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require gifshot.min
//= require sweetalert.min
//= require social-share-button
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	$('.report_link').click(function(){
		var div_to_toggle = this.id;
		var index = div_to_toggle.lastIndexOf("_");
		var id = "#" + div_to_toggle.substr(0, index);
		$(id).toggle('slide');
		return false;
	});
});

$(function(){ $(document).foundation(); });
