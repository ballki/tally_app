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
//= require jquery.autocomplete
//= require jquery_ujs
//= require dashio_theme/jquery-1.8.3.min
//= require dashio_theme/common-scripts
// require_tree
//= require dashio_theme/advanced-datatable/media/js/jquery.dataTables.min
//= require dashio_theme/chart-master/Chart
//= require turbolinks
//= require bootstrap

$(document).ready(function(){ 
	$('div.generalalert').slideDown(4000)
	setTimeout(function(){
		$('div.generalalert').slideUp(1000)
	}, 3000);

	$('.table-striped').dataTable( {
	  "aoColumnDefs": [
	      { "bSortable": true, "aTargets": [ 0 ] }
	  ],
	  "aaSorting": [[1, 'asc']]
	});

	$('div.alert').slideDown(4000)
	setTimeout(function(){
		$('div.alert').slideUp(1000)
	}, 7000);

// $("#getCustomers").autocomplete({
//     source: function (request, response) {
//         $.ajax({
//             url: "/customeremails",
//             type: "GET",
//             cache: false,
//             dataType: "json",
//             success: function (data) {
//                 var arr = [];
//                 $(data).each(function( index ) {
//                     arr.push({label:this.email, value:this.email, id:this.id});
//                 });
//                 response(arr);
//             },
//             data: {
//                 name: request.term
//             }
//         });
//         // $.get('/customeremails', request.term, function(data) {
//         // 	var arr = [];
//         //     $(data).each(function() {
//         //         arr.push({label:this.email, value:this.email, id:this.id});
//         //     });
//         //     response(arr);
//         // });
//         // $.post({'/'})
//     },
//     select: function( event, ui ) {
//         // console.log(ui.item);
//        window.location.href = '/customers/'+ui.item.value
//     }
// });	


})



