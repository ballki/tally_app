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
//= require dashio_theme/jquery-1.8.3.min
// require_tree
//= require dashio_theme/advanced-datatable/media/js/jquery.dataTables.min
//= require dashio_theme/chart-master/Chart
//= require turbolinks
//= require bootstrap

$(document).ready(function(){ 
	setTimeout(function(){
		$('div.alert').slideToggle(1000)
	}, 7000);
	$('div.alert').slideToggle(1000)

	$('.table-striped').dataTable( {
	  "aoColumnDefs": [
	      { "bSortable": true, "aTargets": [ 0 ] }
	  ],
	  "aaSorting": [[1, 'asc']]


	});

})



