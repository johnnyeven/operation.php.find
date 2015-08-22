$(function() {
    //var updatePreview = function() {
    //    var md = $("#readme-markdown").text();
    //    var tmp = [];
    //    var lang = [];
    //    var i = 0;
    //    md = md.replace(/```([a-zA-Z]+)?\n/g, function(str, p) {
    //        tmp.push(p);
    //        if(i % 2 > 0) {
    //            ++i;
    //            return "```\n";
    //        }
    //        ++i;
    //        return "```\n";
    //    });
    //    for(var i in tmp) {
    //        if(i % 2 == 0) {
    //            lang.push(tmp[i]);
    //        }
    //    }
    //    var html = markdown.toHTML(md);
    //    var i = 0;
    //    html = html.replace(/<code>([\w\W]*?)<\/code>/g, function(str, p1) {
    //        var code = '<code>';
    //        if(lang[i]) {
    //            code = '<code class="language-' + lang[i] + '">';
    //        }
    //        ++i;
    //        return '<pre class="prettyprint linenums">' + code + p1 + '</code></pre>';
    //    });
    //    console.log(html);
    //    $("#readme-markdown").html(html);
    //    prettyPrint();
    //};
    //updatePreview();
    prettyPrint();
});