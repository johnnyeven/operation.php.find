require.config({
	baseUrl: "/assets/js/",
	paths: {
		jquery: "jquery-1.11.3.min",
		bootstrap: "bootstrap.min",
		findApp: "find.base"
	},
	waitSeconds: 15,
	map: {
		'*': {
			'css': 'css.min'
		}
	},
	shim : {
		findApp: [
			'css!../css/bootstrap.min.css',
			'css!../css/font-awesome.min.css',
			'css!../css/index.css'
		]
	}
});

require(["jquery"], function($) {
	require(["bootstrap", "findApp"], function(bootstrap, app) {
		$(document).ready(function() {
			app.start();
			$('#illustration').hover( function(){
				$(this).addClass('expand');
			}, function(){
				$(this).removeClass('expand');
			});
		});
	});
});