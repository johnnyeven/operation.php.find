require.config({
	baseUrl: "/assets/js/",
	paths: {
		jquery: "jquery-1.11.3.min",
		nicescroll: "jquery.nicescroll.min",
		bootstrap: "bootstrap.min",
		bootstrapSelect: "bootstrap-select.min",
		nprogress: "nprogress",
		pjax: "jquery.pjax",
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
			'css!../css/bootstrap-select.min.css',
			'css!../css/bootstrap-markdown.min.css',
			'css!../css/desert-cmd.css',
			'css!../css/font-awesome.min.css',
			'css!../css/markdown-theme-dawn.css',
			'css!../css/messenger.css',
			'css!../css/messenger-theme-air.css',
			'css!../css/nprogress.css',
			'css!../css/find-theme.css',
			'css!../css/index.css',
		]
	}
});

require(["jquery"], function($) {
	require(["bootstrap", "nicescroll", "nprogress", "findApp"], function(bootstrap, nicescroll, nprogress, app) {
		require(["bootstrapSelect", "prettify"], function(bootstrapSelect, prettify) {
			$(function() {
				app.start(nprogress);
			});
		});
	});
});