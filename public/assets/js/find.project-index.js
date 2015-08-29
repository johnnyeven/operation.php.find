require.config({
	baseUrl: "/assets/js/",
	paths: {
		jquery: "jquery-1.11.3.min",
		nicescroll: "jquery.nicescroll.min",
		bootstrap: "bootstrap.min",
		nprogress: "nprogress",
		prettify: "prettify/prettify",
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
			'css!../css/nprogress.css',
			'css!../css/find-theme.css',
			'css!../css/markdown-theme-dawn.css',
			'css!../css/desert-cmd.css'
		]
	}
});

require(["jquery"], function($) {
	require(["bootstrap", "nicescroll", "nprogress", "prettify", "findApp"], function(bootstrap, nicescroll, nprogress, prettify, app) {
		$(document).ready(function() {
			app.start(nprogress);
			$("#find-main").niceScroll({
				cursorcolor: "#666",
				cursorborder: "none"
			});
			$("#find-sidebar").niceScroll({
				cursorcolor: "#666",
				cursorborder: "none"
			});
			prettyPrint();
		});
	});
});