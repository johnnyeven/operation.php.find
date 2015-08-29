require.config({
	baseUrl: "/assets/js/",
	paths: {
		jquery: "jquery-1.11.3.min",
		pjax: "jquery.pjax",
		nicescroll: "jquery.nicescroll.min",
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
			'css!../css/find-theme.css'
		]
	}
});

require(["jquery"], function($) {
	require(["bootstrap", "nicescroll", "pjax", "findApp"], function(bootstrap, nicescroll, pjax, app) {
		$(document).ready(function() {
			app.start();
			$("#find-main").niceScroll({
				cursorcolor: "#666",
				cursorborder: "none"
			});
			$("#find-sidebar").niceScroll({
				cursorcolor: "#666",
				cursorborder: "none"
			});
		});
	});
});