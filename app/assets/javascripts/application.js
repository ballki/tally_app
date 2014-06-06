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
	$('div.generalalert').slideDown(2000)
	setTimeout(function(){
		$('div.generalalert').slideUp(2000)
	}, 5000);

	$('.table-striped').dataTable( {
	  "aoColumnDefs": [
	      { "bSortable": true, "aTargets": [ 0 ] }
	  ],
	  "aaSorting": [[1, 'asc']]
	});

	$('div.alert').slideDown(2000)
	setTimeout(function(){
		$('div.alert').slideUp(2000)
	}, 5000);

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

	// generating these kind of top limits...
	// 10
	// 100
	// 1000
	// 10000 ...

	function nextK(l_value){
		i = 1
		top_limit = 1
		for(j=1; j<15; j++){
			i+="0" // adding zeros
			k = parseInt(i)
			if(l_value/k < 1 && top_limit==1){
				// top_limit = Math.ceil(l_value/k)*k
				top_limit = k
			}
		}
		return top_limit
	}

	// generating these kind of top limits...
	// 1-10
	// 11-20
	// 21-50
	// 51-100
	// 101-200
	// 201-500
	// 501-1000
	// 1001-2000
	// 2001-5000
	// 5001-10000 ...

	function nextL(l_value){
		i = 1
		top_limit = 1
		for(j=1; j<15; j++){
			i+="0" // adding zeros
			k = parseInt(i)
			l = k/5
			if(l_value/l < 1 && top_limit==1){
				top_limit = l
			}
			l = k/2
			if(l_value/l < 1 && top_limit==1){
				top_limit = l
			}
			l = k
			if(l_value/l < 1 && top_limit==1){
				top_limit = l
			}
		}
		return top_limit
	}

	noDecimals = function(num){
		if(num == Math.round(num)){
		  return num
		}
		return ""
	}
	// noDecimals(num) 
	// same as
	// num = num == Math.round(num) ? num : ""


