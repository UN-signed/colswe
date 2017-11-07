/*!
 * froala_editor v2.7.1 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2017 Froala Labs
 */


!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):"object"==typeof module&&module.exports?module.exports=function(b,c){return void 0===c&&(c="undefined"!=typeof window?require("jquery"):require("jquery")(b)),a(c)}:a(window.jQuery)}(function(a){a.extend(a.FE.POPUP_TEMPLATES,{"video.insert":"[_BUTTONS_][_BY_URL_LAYER_][_EMBED_LAYER_][_UPLOAD_LAYER_][_PROGRESS_BAR_]","video.edit":"[_BUTTONS_]","video.size":"[_BUTTONS_][_SIZE_LAYER_]"}),a.extend(a.FE.DEFAULTS,{videoAllowedTypes:["mp4","webm","ogg"],videoAllowedProviders:[".*"],videoDefaultAlign:"center",videoDefaultDisplay:"block",videoDefaultWidth:600,videoEditButtons:["videoReplace","videoRemove","|","videoDisplay","videoAlign","videoSize"],videoInsertButtons:["videoBack","|","videoByURL","videoEmbed","videoUpload"],videoMaxSize:52428800,videoMove:!0,videoResize:!0,videoSizeButtons:["videoBack","|"],videoSplitHTML:!1,videoTextNear:!0,videoUpload:!0,videoUploadMethod:"POST",videoUploadParam:"file",videoUploadParams:{},videoUploadToS3:!1,videoUploadURL:"https://i.froala.com/upload"}),a.FE.VIDEO_PROVIDERS=[{test_regex:/^.*((youtu.be)|(youtube.com))\/((v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))?\??v?=?([^#\&\?]*).*/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:m\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=|embed\/)?([0-9a-zA-Z_\-]+)(.+)?/g,url_text:"//www.youtube.com/embed/$1",html:'<iframe width="640" height="360" src="{url}?wmode=opaque" frameborder="0" allowfullscreen></iframe>',provider:"youtube"},{test_regex:/^.*(?:vimeo.com)\/(?:channels(\/\w+\/)?|groups\/*\/videos\/\u200b\d+\/|video\/|)(\d+)(?:$|\/|\?)/,url_regex:/(?:https?:\/\/)?(?:www\.|player\.)?vimeo.com\/(?:channels\/(?:\w+\/)?|groups\/(?:[^\/]*)\/videos\/|album\/(?:\d+)\/video\/|video\/|)(\d+)(?:[a-zA-Z0-9_\-]+)?/i,url_text:"//player.vimeo.com/video/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>',provider:"vimeo"},{test_regex:/^.+(dailymotion.com|dai.ly)\/(video|hub)?\/?([^_]+)[^#]*(#video=([^_&]+))?/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:dailymotion\.com|dai\.ly)\/(?:video|hub)?\/?(.+)/g,url_text:"//www.dailymotion.com/embed/video/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>',provider:"dailymotion"},{test_regex:/^.+(screen.yahoo.com)\/[^_&]+/,url_regex:"",url_text:"",html:'<iframe width="640" height="360" src="{url}?format=embed" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" allowtransparency="true"></iframe>',provider:"yahoo"},{test_regex:/^.+(rutube.ru)\/[^_&]+/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:rutube\.ru)\/(?:video)?\/?(.+)/g,url_text:"//rutube.ru/play/embed/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" allowtransparency="true"></iframe>',provider:"rutube"},{test_regex:/^(?:.+)vidyard.com\/(?:watch)?\/?([^.&\/]+)\/?(?:[^_.&]+)?/,url_regex:/^(?:.+)vidyard.com\/(?:watch)?\/?([^.&\/]+)\/?(?:[^_.&]+)?/g,url_text:"//play.vidyard.com/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>',provider:"vidyard"}],a.FE.VIDEO_EMBED_REGEX=/^\W*((<iframe.*><\/iframe>)|(<embed.*>))\W*$/i,a.FE.PLUGINS.video=function(b){function c(){var a=b.popups.get("video.insert");a.find(".fr-video-by-url-layer input").val("").trigger("change");var c=a.find(".fr-video-embed-layer textarea");c.val("").trigger("change"),c=a.find(".fr-video-upload-layer input"),c.val("").trigger("change")}function d(){var a=b.$tb.find('.fr-command[data-cmd="insertVideo"]'),c=b.popups.get("video.insert");if(c||(c=f()),o(),!c.hasClass("fr-active")){b.popups.refresh("video.insert"),b.popups.setContainer("video.insert",b.$tb);var d=a.offset().left+a.outerWidth()/2,e=a.offset().top+(b.opts.toolbarBottom?10:a.outerHeight()-10);b.popups.show("video.insert",d,e,a.outerHeight())}}function e(){var a=b.popups.get("video.edit");if(a||(a=T()),a){b.popups.setContainer("video.edit",b.$sc),b.popups.refresh("video.edit");var c=ra.find("iframe, embed, video"),d=c.offset().left+c.outerWidth()/2,e=c.offset().top+c.outerHeight();b.popups.show("video.edit",d,e,c.outerHeight())}}function f(a){if(a)return b.popups.onRefresh("video.insert",c),b.popups.onHide("image.insert",ea),!0;var d="";b.opts.videoUpload||b.opts.videoInsertButtons.splice(b.opts.videoInsertButtons.indexOf("videoUpload"),1),b.opts.videoInsertButtons.length>1&&(d='<div class="fr-buttons">'+b.button.buildList(b.opts.videoInsertButtons)+"</div>");var e,f="",g=b.opts.videoInsertButtons.indexOf("videoUpload"),h=b.opts.videoInsertButtons.indexOf("videoByURL"),i=b.opts.videoInsertButtons.indexOf("videoEmbed");h>=0&&(e=" fr-active",(h>g&&g>=0||h>i&&i>=0)&&(e=""),f='<div class="fr-video-by-url-layer fr-layer'+e+'" id="fr-video-by-url-layer-'+b.id+'"><div class="fr-input-line"><input id="fr-video-by-url-layer-text-'+b.id+'" type="text" placeholder="'+b.language.translate("Paste in a video URL")+'" tabIndex="1" aria-required="true"></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="videoInsertByURL" tabIndex="2" role="button">'+b.language.translate("Insert")+"</button></div></div>");var j="";i>=0&&(e=" fr-active",(i>g&&g>=0||i>h&&h>=0)&&(e=""),j='<div class="fr-video-embed-layer fr-layer'+e+'" id="fr-video-embed-layer-'+b.id+'"><div class="fr-input-line"><textarea id="fr-video-embed-layer-text'+b.id+'" type="text" placeholder="'+b.language.translate("Embedded Code")+'" tabIndex="1" aria-required="true" rows="5"></textarea></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="videoInsertEmbed" tabIndex="2" role="button">'+b.language.translate("Insert")+"</button></div></div>");var k="";g>=0&&(e=" fr-active",(g>i&&i>=0||g>h&&h>=0)&&(e=""),k='<div class="fr-video-upload-layer fr-layer'+e+'" id="fr-video-upload-layer-'+b.id+'"><strong>'+b.language.translate("Drop video")+"</strong><br>("+b.language.translate("or click")+')<div class="fr-form"><input type="file" accept="video/'+b.opts.videoAllowedTypes.join(", video/").toLowerCase()+'" tabIndex="-1" aria-labelledby="fr-video-upload-layer-'+b.id+'" role="button"></div></div>');var l='<div class="fr-video-progress-bar-layer fr-layer"><h3 tabIndex="-1" class="fr-message">Uploading</h3><div class="fr-loader"><span class="fr-progress"></span></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-dismiss" data-cmd="videoDismissError" tabIndex="2" role="button">OK</button></div></div>',m={buttons:d,by_url_layer:f,embed_layer:j,upload_layer:k,progress_bar:l},n=b.popups.create("video.insert",m);return Q(n),n}function g(a){var c,d,e=b.popups.get("video.insert");if(!ra&&!b.opts.toolbarInline){var f=b.$tb.find('.fr-command[data-cmd="insertVideo"]');c=f.offset().left+f.outerWidth()/2,d=f.offset().top+(b.opts.toolbarBottom?10:f.outerHeight()-10)}b.opts.toolbarInline&&(d=e.offset().top-b.helpers.getPX(e.css("margin-top")),e.hasClass("fr-above")&&(d+=e.outerHeight())),e.find(".fr-layer").removeClass("fr-active"),e.find(".fr-"+a+"-layer").addClass("fr-active"),b.popups.show("video.insert",c,d,0),b.accessibility.focusPopup(e)}function h(a){b.popups.get("video.insert").find(".fr-video-by-url-layer").hasClass("fr-active")&&a.addClass("fr-active").attr("aria-pressed",!0)}function i(a){b.popups.get("video.insert").find(".fr-video-embed-layer").hasClass("fr-active")&&a.addClass("fr-active").attr("aria-pressed",!0)}function j(a){b.popups.get("video.insert").find(".fr-video-upload-layer").hasClass("fr-active")&&a.addClass("fr-active").attr("aria-pressed",!0)}function k(a){b.events.focus(!0),b.selection.restore();var c=!1;ra&&(da(),c=!0),b.html.insert('<span contenteditable="false" draggable="true" class="fr-jiv fr-video">'+a+"</span>",!1,b.opts.videoSplitHTML),b.popups.hide("video.insert");var d=b.$el.find(".fr-jiv");d.removeClass("fr-jiv"),fa(d,b.opts.videoDefaultDisplay,b.opts.videoDefaultAlign),d.toggleClass("fr-draggable",b.opts.videoMove),b.events.trigger(c?"video.replaced":"video.inserted",[d])}function l(){var c=a(this);b.popups.hide("video.insert"),c.removeClass("fr-uploading"),c.parent().next().is("br")&&c.parent().next().remove(),t(c.parent()),b.events.trigger("video.loaded",[c.parent()])}function m(a,c,d,e,f){b.edit.off(),p("Loading video"),c&&(a=b.helpers.sanitizeURL(a));var g=function(){var c,g;if(e){b.undo.canDo()||e.find("video").hasClass("fr-uploading")||b.undo.saveStep();var h=e.find("video").data("fr-old-src"),i=e.data("fr-replaced");e.data("fr-replaced",!1),b.$wp?(c=e.clone(),c.find("video").removeData("fr-old-src").removeClass("fr-uploading"),c.find("video").off("canplay"),h&&e.find("video").attr("src",h),e.replaceWith(c)):c=e;for(var j=c.find("video").get(0).attributes,k=0;k<j.length;k++){var m=j[k];0===m.nodeName.indexOf("data-")&&c.find("video").removeAttr(m.nodeName)}if(void 0!==d)for(g in d)d.hasOwnProperty(g)&&"link"!=g&&c.find("video").attr("data-"+g,d[g]);c.find("video").on("canplay",l),c.find("video").attr("src",a),b.edit.on(),H(),b.undo.saveStep(),b.$el.blur(),b.events.trigger(i?"video.replaced":"video.inserted",[c,f])}else c=A(a,d,l),H(),b.undo.saveStep(),b.events.trigger("video.inserted",[c,f])};n("Loading video"),g()}function n(a){var c=b.popups.get("video.insert");if(c||(c=f()),c.find(".fr-layer.fr-active").removeClass("fr-active").addClass("fr-pactive"),c.find(".fr-video-progress-bar-layer").addClass("fr-active"),c.find(".fr-buttons").hide(),ra){var d=ra.find("video");b.popups.setContainer("video.insert",b.$sc);var e=d.offset().left+d.width()/2,g=d.offset().top+d.height();b.popups.show("video.insert",e,g,d.outerHeight())}void 0===a&&p(b.language.translate("Uploading"),0)}function o(a){var c=b.popups.get("video.insert");if(c&&(c.find(".fr-layer.fr-pactive").addClass("fr-active").removeClass("fr-pactive"),c.find(".fr-video-progress-bar-layer").removeClass("fr-active"),c.find(".fr-buttons").show(),a||b.$el.find("video.fr-error").length)){if(b.events.focus(),b.$el.find("video.fr-error").length&&(b.$el.find("video.fr-error").parent().remove(),b.undo.saveStep(),b.undo.run(),b.undo.dropRedo()),!b.$wp&&ra){var d=ra;K(!0),b.selection.setAfter(d.find("video").get(0)),b.selection.restore()}b.popups.hide("video.insert")}}function p(a,c){var d=b.popups.get("video.insert");if(d){var e=d.find(".fr-video-progress-bar-layer");e.find("h3").text(a+(c?" "+c+"%":"")),e.removeClass("fr-error"),c?(e.find("div").removeClass("fr-indeterminate"),e.find("div > span").css("width",c+"%")):e.find("div").addClass("fr-indeterminate")}}function q(a){n();var c=b.popups.get("video.insert"),d=c.find(".fr-video-progress-bar-layer");d.addClass("fr-error");var e=d.find("h3");e.text(a),b.events.disableBlur(),e.focus()}function r(c){if(void 0===c){c=b.popups.get("video.insert").find('.fr-video-by-url-layer input[type="text"]').val()||""}var d=null;if(/^http/.test(c)||(c="https://"+c),b.helpers.isURL(c))for(var e=0;e<a.FE.VIDEO_PROVIDERS.length;e++){var f=a.FE.VIDEO_PROVIDERS[e];if(f.test_regex.test(c)&&new RegExp(b.opts.videoAllowedProviders.join("|")).test(f.provider)){d=c.replace(f.url_regex,f.url_text),d=f.html.replace(/\{url\}/,d);break}}d?k(d):b.events.trigger("video.linkError",[c])}function s(c){if(void 0===c){c=b.popups.get("video.insert").find(".fr-video-embed-layer textarea").val()||""}0!==c.length&&a.FE.VIDEO_EMBED_REGEX.test(c)?k(c):b.events.trigger("video.codeError",[c])}function t(a){J.call(a.get(0))}function u(a){try{if(!1===b.events.trigger("video.uploaded",[a],!0))return b.edit.on(),!1;var c=JSON.parse(a);return c.link?c:(S(sa,a),!1)}catch(d){return S(ua,a),!1}}function v(c){try{var d=a(c).find("Location").text(),e=a(c).find("Key").text();return!1===b.events.trigger("video.uploadedToS3",[d,e,c],!0)?(b.edit.on(),!1):d}catch(f){return S(ua,c),!1}}function w(a){p("Loading video");var c=this.status,d=this.response,e=this.responseXML,f=this.responseText;try{if(b.opts.videoUploadToS3)if(201==c){var g=v(e);g&&m(g,!1,[],a,d||e)}else S(ua,d||e);else if(c>=200&&c<300){var h=u(f);h&&m(h.link,!1,h,a,d||f)}else S(ta,d||f)}catch(i){S(ua,d||f)}}function x(){S(ua,this.response||this.responseText||this.responseXML)}function y(a){if(a.lengthComputable){var c=a.loaded/a.total*100|0;p(b.language.translate("Uploading"),c)}}function z(){b.edit.on(),o(!0)}function A(c,d,e){var f,g="";if(d&&void 0!==d)for(f in d)d.hasOwnProperty(f)&&"link"!=f&&(g+=" data-"+f+'="'+d[f]+'"');var h=b.opts.videoDefaultWidth;h&&"auto"!=h&&(h+="px");var i=a('<span contenteditable="false" draggable="true" class="fr-video fr-dv'+b.opts.videoDefaultDisplay[0]+("center"!=b.opts.videoDefaultAlign?" fr-fv"+b.opts.videoDefaultAlign[0]:"")+'"><video src="'+c+'" '+g+(h?' style="width: '+h+';" ':"")+" controls>"+b.language.translate("Your browser does not support HTML5 video.")+"</video></span>");i.toggleClass("fr-draggable",b.opts.videoMove),b.edit.on(),b.events.focus(!0),b.selection.restore(),b.undo.saveStep(),b.opts.videoSplitHTML?b.markers.split():b.markers.insert(),b.html.wrap();var j=b.$el.find(".fr-marker");return b.node.isLastSibling(j)&&j.parent().hasClass("fr-deletable")&&j.insertAfter(j.parent()),j.replaceWith(i),b.selection.clear(),i.find("video").get(0).readyState>i.find("video").get(0).HAVE_FUTURE_DATA||b.helpers.isIOS()?e.call(i.find("video").get(0)):i.find("video").on("canplaythrough load",e),i}function B(c){if(!b.core.sameInstance(qa))return!0;c.preventDefault(),c.stopPropagation();var d=c.pageX||(c.originalEvent.touches?c.originalEvent.touches[0].pageX:null),e=c.pageY||(c.originalEvent.touches?c.originalEvent.touches[0].pageY:null);if(!d||!e)return!1;if("mousedown"==c.type){var f=b.$oel.get(0),g=f.ownerDocument,h=g.defaultView||g.parentWindow,i=!1;try{i=h.location!=h.parent.location&&!(h.$&&h.$.FE)}catch(j){}i&&h.frameElement&&(d+=b.helpers.getPX(a(h.frameElement).offset().left)+h.frameElement.clientLeft,e=c.clientY+b.helpers.getPX(a(h.frameElement).offset().top)+h.frameElement.clientTop)}b.undo.canDo()||b.undo.saveStep(),pa=a(this),pa.data("start-x",d),pa.data("start-y",e),oa.show(),b.popups.hideAll(),M()}function C(a){if(!b.core.sameInstance(qa))return!0;if(pa){a.preventDefault();var c=a.pageX||(a.originalEvent.touches?a.originalEvent.touches[0].pageX:null),d=a.pageY||(a.originalEvent.touches?a.originalEvent.touches[0].pageY:null);if(!c||!d)return!1;var e=pa.data("start-x"),f=pa.data("start-y");pa.data("start-x",c),pa.data("start-y",d);var g=c-e,h=d-f,i=ra.find("iframe, embed, video"),j=i.width(),k=i.height();(pa.hasClass("fr-hnw")||pa.hasClass("fr-hsw"))&&(g=0-g),(pa.hasClass("fr-hnw")||pa.hasClass("fr-hne"))&&(h=0-h),i.css("width",j+g),i.css("height",k+h),i.removeAttr("width"),i.removeAttr("height"),I()}}function D(a){if(!b.core.sameInstance(qa))return!0;pa&&ra&&(a&&a.stopPropagation(),pa=null,oa.hide(),I(),e(),b.undo.saveStep())}function E(a){return'<div class="fr-handler fr-h'+a+'"></div>'}function F(a,b,c,d){return a.pageX=b,a.pageY=b,B.call(this,a),a.pageX=a.pageX+c*Math.floor(Math.pow(1.1,d)),a.pageY=a.pageY+c*Math.floor(Math.pow(1.1,d)),C.call(this,a),D.call(this,a),++d}function G(){var c;if(b.shared.$video_resizer?(qa=b.shared.$video_resizer,oa=b.shared.$vid_overlay,b.events.on("destroy",function(){qa.removeClass("fr-active").appendTo(a("body:first"))},!0)):(b.shared.$video_resizer=a('<div class="fr-video-resizer"></div>'),qa=b.shared.$video_resizer,b.events.$on(qa,"mousedown",function(a){a.stopPropagation()},!0),b.opts.videoResize&&(qa.append(E("nw")+E("ne")+E("sw")+E("se")),b.shared.$vid_overlay=a('<div class="fr-video-overlay"></div>'),oa=b.shared.$vid_overlay,c=qa.get(0).ownerDocument,a(c).find("body:first").append(oa))),b.events.on("shared.destroy",function(){qa.html("").removeData().remove(),qa=null,b.opts.videoResize&&(oa.remove(),oa=null)},!0),b.helpers.isMobile()||b.events.$on(a(b.o_win),"resize.video",function(){K(!0)}),b.opts.videoResize){c=qa.get(0).ownerDocument,b.events.$on(qa,b._mousedown,".fr-handler",B),b.events.$on(a(c),b._mousemove,C),b.events.$on(a(c.defaultView||c.parentWindow),b._mouseup,D),b.events.$on(oa,"mouseleave",D);var d=1,e=null,f=0;b.events.on("keydown",function(c){if(ra){var g=-1!=navigator.userAgent.indexOf("Mac OS X")?c.metaKey:c.ctrlKey,h=c.which;(h!==e||c.timeStamp-f>200)&&(d=1),(h==a.FE.KEYCODE.EQUALS||b.browser.mozilla&&h==a.FE.KEYCODE.FF_EQUALS)&&g&&!c.altKey?d=F.call(this,c,1,1,d):(h==a.FE.KEYCODE.HYPHEN||b.browser.mozilla&&h==a.FE.KEYCODE.FF_HYPHEN)&&g&&!c.altKey&&(d=F.call(this,c,2,-1,d)),e=h,f=c.timeStamp}}),b.events.on("keyup",function(){d=1})}}function H(){var c,d=Array.prototype.slice.call(b.el.querySelectorAll("video")),e=[];for(c=0;c<d.length;c++)e.push(d[c].getAttribute("src")),a(d[c]).toggleClass("fr-draggable",b.opts.videoMove),""===d[c].getAttribute("class")&&d[c].removeAttribute("class"),""===d[c].getAttribute("style")&&d[c].removeAttribute("style");if(ya)for(c=0;c<ya.length;c++)e.indexOf(ya[c].getAttribute("src"))<0&&b.events.trigger("video.removed",[a(ya[c])]);ya=d}function I(){qa||G(),(b.$wp||b.$sc).append(qa),qa.data("instance",b);var a=ra.find("iframe, embed, video");qa.css("top",(b.opts.iframe?a.offset().top-1:a.offset().top-b.$wp.offset().top-1)+b.$wp.scrollTop()).css("left",(b.opts.iframe?a.offset().left-1:a.offset().left-b.$wp.offset().left-1)+b.$wp.scrollLeft()).css("width",a.outerWidth()).css("height",a.height()).addClass("fr-active")}function J(c){if(c&&"touchend"==c.type&&za)return!0;if(c&&b.edit.isDisabled())return c.stopPropagation(),c.preventDefault(),!1;if(b.edit.isDisabled())return!1;for(var d=0;d<a.FE.INSTANCES.length;d++)a.FE.INSTANCES[d]!=b&&a.FE.INSTANCES[d].events.trigger("video.hideResizer");b.toolbar.disable(),b.helpers.isMobile()&&(b.events.disableBlur(),b.$el.blur(),b.events.enableBlur()),ra=a(this),a(this).addClass("fr-active"),b.opts.iframe&&b.size.syncIframe(),ka(),I(),e(),b.selection.clear(),b.button.bulkRefresh(),b.events.trigger("image.hideResizer")}function K(a){ra&&(N()||!0===a)&&(qa.removeClass("fr-active"),b.toolbar.enable(),ra.removeClass("fr-active"),ra=null,M())}function L(){b.shared.vid_exit_flag=!0}function M(){b.shared.vid_exit_flag=!1}function N(){return b.shared.vid_exit_flag}function O(c){var d=c.originalEvent.dataTransfer;if(d&&d.files&&d.files.length){var e=d.files[0];if(e&&e.type&&-1!==e.type.indexOf("video")){if(!b.opts.videoUpload)return c.preventDefault(),c.stopPropagation(),!1;b.markers.remove(),b.markers.insertAtPoint(c.originalEvent),b.$el.find(".fr-marker").replaceWith(a.FE.MARKERS),b.popups.hideAll();var g=b.popups.get("video.insert");return g||(g=f()),b.popups.setContainer("video.insert",b.$sc),b.popups.show("video.insert",c.originalEvent.pageX,c.originalEvent.pageY),n(),b.opts.videoAllowedTypes.indexOf(e.type.replace(/video\//g,""))>=0?P(d.files):S(wa),c.preventDefault(),c.stopPropagation(),!1}}}function P(a){if(void 0!==a&&a.length>0){if(!1===b.events.trigger("video.beforeUpload",[a]))return!1;var c=a[0];if(c.size>b.opts.videoMaxSize)return S(va),!1;if(b.opts.videoAllowedTypes.indexOf(c.type.replace(/video\//g,""))<0)return S(wa),!1;var d;if(b.drag_support.formdata&&(d=b.drag_support.formdata?new FormData:null),d){var e;if(!1!==b.opts.videoUploadToS3){d.append("key",b.opts.videoUploadToS3.keyStart+(new Date).getTime()+"-"+(c.name||"untitled")),d.append("success_action_status","201"),d.append("X-Requested-With","xhr"),d.append("Content-Type",c.type);for(e in b.opts.videoUploadToS3.params)b.opts.videoUploadToS3.params.hasOwnProperty(e)&&d.append(e,b.opts.videoUploadToS3.params[e])}for(e in b.opts.videoUploadParams)b.opts.videoUploadParams.hasOwnProperty(e)&&d.append(e,b.opts.videoUploadParams[e]);d.append(b.opts.videoUploadParam,c);var f=b.opts.videoUploadURL;b.opts.videoUploadToS3&&(f=b.opts.videoUploadToS3.uploadURL?b.opts.videoUploadToS3.uploadURL:"https://"+b.opts.videoUploadToS3.region+".amazonaws.com/"+b.opts.videoUploadToS3.bucket);var g=b.core.getXHR(f,b.opts.videoUploadMethod);g.onload=function(){w.call(g,ra)},g.onerror=x,g.upload.onprogress=y,g.onabort=z,n(),b.events.disableBlur(),b.edit.off(),b.events.enableBlur();var h=b.popups.get("video.insert");h&&h.off("abortUpload").on("abortUpload",function(){4!=g.readyState&&g.abort()}),g.send(d)}}}function Q(c){b.events.$on(c,"dragover dragenter",".fr-video-upload-layer",function(){return a(this).addClass("fr-drop"),!1},!0),b.events.$on(c,"dragleave dragend",".fr-video-upload-layer",function(){return a(this).removeClass("fr-drop"),!1},!0),b.events.$on(c,"drop",".fr-video-upload-layer",function(d){d.preventDefault(),d.stopPropagation(),a(this).removeClass("fr-drop");var e=d.originalEvent.dataTransfer;if(e&&e.files){var f=c.data("instance")||b;f.events.disableBlur(),f.video.upload(e.files),f.events.enableBlur()}},!0),b.helpers.isIOS()&&b.events.$on(c,"touchstart",'.fr-video-upload-layer input[type="file"]',function(){a(this).trigger("click")},!0),b.events.$on(c,"change",'.fr-video-upload-layer input[type="file"]',function(){if(this.files){var d=c.data("instance")||b;d.events.disableBlur(),c.find("input:focus").blur(),d.events.enableBlur(),d.video.upload(this.files)}a(this).val("")},!0)}function R(){b.events.on("drop",O,!0),b.events.on("mousedown window.mousedown",L),b.events.on("window.touchmove",M),b.events.on("mouseup window.mouseup",K),b.events.on("commands.mousedown",function(a){a.parents(".fr-toolbar").length>0&&K()}),b.events.on("video.hideResizer commands.undo commands.redo element.dropped",function(){K(!0)})}function S(a,c){b.edit.on(),ra&&ra.find("video").addClass("fr-error"),q(b.language.translate("Something went wrong. Please try again.")),b.events.trigger("video.error",[{code:a,message:xa[a]},c])}function T(){var a="";if(b.opts.videoEditButtons.length>0){a+='<div class="fr-buttons">',a+=b.button.buildList(b.opts.videoEditButtons),a+="</div>";var c={buttons:a},d=b.popups.create("video.edit",c);return b.events.$on(b.$wp,"scroll.video-edit",function(){ra&&b.popups.isVisible("video.edit")&&(b.events.disableBlur(),t(ra))}),d}return!1}function U(){if(ra){var a=b.popups.get("video.size"),c=ra.find("iframe, embed, video");a.find('input[name="width"]').val(c.get(0).style.width||c.attr("width")).trigger("change"),a.find('input[name="height"]').val(c.get(0).style.height||c.attr("height")).trigger("change")}}function V(){var a=b.popups.get("video.size");a||(a=W()),o(),b.popups.refresh("video.size"),b.popups.setContainer("video.size",b.$sc);var c=ra.find("iframe, embed, video"),d=c.offset().left+c.width()/2,e=c.offset().top+c.height();b.popups.show("video.size",d,e,c.height())}function W(a){if(a)return b.popups.onRefresh("video.size",U),!0;var c="";c='<div class="fr-buttons">'+b.button.buildList(b.opts.videoSizeButtons)+"</div>";var d="";d='<div class="fr-video-size-layer fr-layer fr-active" id="fr-video-size-layer-'+b.id+'"><div class="fr-video-group"><div class="fr-input-line"><input id="fr-video-size-layer-width-'+b.id+'" type="text" name="width" placeholder="'+b.language.translate("Width")+'" tabIndex="1"></div><div class="fr-input-line"><input id="fr-video-size-layer-height-'+b.id+'" type="text" name="height" placeholder="'+b.language.translate("Height")+'" tabIndex="1"></div></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="videoSetSize" tabIndex="2" role="button">'+b.language.translate("Update")+"</button></div></div>";var e={buttons:c,size_layer:d},f=b.popups.create("video.size",e);return b.events.$on(b.$wp,"scroll",function(){ra&&b.popups.isVisible("video.size")&&(b.events.disableBlur(),t(ra))}),f}function X(a){if(void 0===a&&(a=ra),a){if(a.hasClass("fr-fvl"))return"left";if(a.hasClass("fr-fvr"))return"right";if(a.hasClass("fr-dvb")||a.hasClass("fr-dvi"))return"center";if("block"==a.css("display")){if("left"==a.css("text-algin"))return"left";if("right"==a.css("text-align"))return"right"}else{if("left"==a.css("float"))return"left";if("right"==a.css("float"))return"right"}}return"center"}function Y(a){ra.removeClass("fr-fvr fr-fvl"),!b.opts.htmlUntouched&&b.opts.useClasses?"left"==a?ra.addClass("fr-fvl"):"right"==a&&ra.addClass("fr-fvr"):fa(ra,_(),a),ka(),I(),e(),b.selection.clear()}function Z(a){if(!ra)return!1;a.find("> *:first").replaceWith(b.icon.create("video-align-"+X()))}function $(a,b){ra&&b.find('.fr-command[data-param1="'+X()+'"]').addClass("fr-active").attr("aria-selected",!0)}function _(a){void 0===a&&(a=ra);var b=a.css("float");return a.css("float","none"),"block"==a.css("display")?(a.css("float",""),a.css("float")!=b&&a.css("float",b),"block"):(a.css("float",""),a.css("float")!=b&&a.css("float",b),"inline")}function aa(a){ra.removeClass("fr-dvi fr-dvb"),!b.opts.htmlUntouched&&b.opts.useClasses?"inline"==a?ra.addClass("fr-dvi"):"block"==a&&ra.addClass("fr-dvb"):fa(ra,a,X()),ka(),I(),e(),b.selection.clear()}function ba(a,b){ra&&b.find('.fr-command[data-param1="'+_()+'"]').addClass("fr-active").attr("aria-selected",!0)}function ca(){var a=b.popups.get("video.insert");a||(a=f()),b.popups.isVisible("video.insert")||(o(),b.popups.refresh("video.insert"),b.popups.setContainer("video.insert",b.$sc));var c=ra.offset().left+ra.width()/2,d=ra.offset().top+ra.height();b.popups.show("video.insert",c,d,ra.outerHeight())}function da(){if(ra&&!1!==b.events.trigger("video.beforeRemove",[ra])){var a=ra;b.popups.hideAll(),K(!0),b.selection.setBefore(a.get(0))||b.selection.setAfter(a.get(0)),a.remove(),b.selection.restore(),b.html.fillEmptyBlocks(),b.events.trigger("video.removed",[a])}}function ea(){o()}function fa(a,c,d){!b.opts.htmlUntouched&&b.opts.useClasses?(a.removeClass("fr-fvl fr-fvr fr-dvb fr-dvi"),a.addClass("fr-fv"+d[0]+" fr-dv"+c[0])):"inline"==c?(a.css({display:"inline-block"}),"center"==d?a.css({float:"none"}):"left"==d?a.css({float:"left"}):a.css({float:"right"})):(a.css({display:"block",clear:"both"}),"left"==d?a.css({textAlign:"left"}):"right"==d?a.css({textAlign:"right"}):a.css({textAlign:"center"}))}function ga(a){a.hasClass("fr-dvi")||a.hasClass("fr-dvb")||(a.addClass("fr-fv"+X(a)[0]),a.addClass("fr-dv"+_(a)[0]))}function ha(a){fa(a,a.hasClass("fr-dvb")?"block":a.hasClass("fr-dvi")?"inline":null,a.hasClass("fr-fvl")?"left":a.hasClass("fr-fvr")?"right":X(a)),a.removeClass("fr-dvb fr-dvi fr-fvr fr-fvl")}function ia(){b.$el.find("video").filter(function(){return 0===a(this).parents("span.fr-video").length}).wrap('<span class="fr-video" contenteditable="false"></span>'),b.$el.find("embed, iframe").filter(function(){if(b.browser.safari&&this.getAttribute("src")&&this.setAttribute("src",this.src),a(this).parents("span.fr-video").length>0)return!1;for(var c=a(this).attr("src"),d=0;d<a.FE.VIDEO_PROVIDERS.length;d++){var e=a.FE.VIDEO_PROVIDERS[d];if(e.test_regex.test(c)&&new RegExp(b.opts.videoAllowedProviders.join("|")).test(e.provider))return!0}return!1}).map(function(){return 0===a(this).parents("object").length?this:a(this).parents("object").get(0)}).wrap('<span class="fr-video" contenteditable="false"></span>');for(var c=b.$el.find("span.fr-video, video"),d=0;d<c.length;d++){var e=a(c[d]);!b.opts.htmlUntouched&&b.opts.useClasses?(ga(e),b.opts.videoTextNear||e.removeClass("fr-dvi").addClass("fr-dvb")):b.opts.htmlUntouched||b.opts.useClasses||ha(e)}c.toggleClass("fr-draggable",b.opts.videoMove)}function ja(){R(),b.helpers.isMobile()&&(b.events.$on(b.$el,"touchstart","span.fr-video",function(){za=!1}),b.events.$on(b.$el,"touchmove",function(){za=!0})),b.events.on("html.set",ia),ia(),b.events.$on(b.$el,"mousedown","span.fr-video",function(a){a.stopPropagation()}),b.events.$on(b.$el,"click touchend","span.fr-video",J),b.events.on("keydown",function(c){var d=c.which;return!ra||d!=a.FE.KEYCODE.BACKSPACE&&d!=a.FE.KEYCODE.DELETE?ra&&d==a.FE.KEYCODE.ESC?(K(!0),c.preventDefault(),!1):ra&&d!=a.FE.KEYCODE.F10&&!b.keys.isBrowserAction(c)?(c.preventDefault(),!1):void 0:(c.preventDefault(),da(),b.undo.saveStep(),!1)},!0),b.events.on("toolbar.esc",function(){if(ra)return b.events.disableBlur(),b.events.focus(),!1},!0),b.events.on("toolbar.focusEditor",function(){if(ra)return!1},!0),b.events.on("keydown",function(){b.$el.find("span.fr-video:empty").remove()}),f(!0),W(!0)}function ka(){if(ra){b.selection.clear();var a=b.doc.createRange();a.selectNode(ra.get(0));b.selection.get().addRange(a)}}function la(){ra?(b.events.disableBlur(),ra.trigger("click")):(b.events.disableBlur(),b.selection.restore(),b.events.enableBlur(),b.popups.hide("video.insert"),b.toolbar.showInline())}function ma(a,c){if(ra){var d=b.popups.get("video.size"),e=ra.find("iframe, embed, video");e.css("width",a||d.find('input[name="width"]').val()),e.css("height",c||d.find('input[name="height"]').val()),e.get(0).style.width&&e.removeAttr("width"),e.get(0).style.height&&e.removeAttr("height"),d.find("input:focus").blur(),setTimeout(function(){ra.trigger("click")},b.helpers.isAndroid()?50:0)}}function na(){return ra}var oa,pa,qa,ra,sa=2,ta=3,ua=4,va=5,wa=6,xa={};xa[1]="Video cannot be loaded from the passed link.",xa[sa]="No link in upload response.",xa[ta]="Error during file upload.",xa[ua]="Parsing response failed.",xa[va]="File is too large.",xa[wa]="Video file type is invalid.",xa[7]="Files can be uploaded only to same domain in IE 8 and IE 9.";var ya,za;return b.shared.vid_exit_flag=!1,{_init:ja,showInsertPopup:d,showLayer:g,refreshByURLButton:h,refreshEmbedButton:i,refreshUploadButton:j,upload:P,insertByURL:r,insertEmbed:s,insert:k,align:Y,refreshAlign:Z,refreshAlignOnShow:$,display:aa,refreshDisplayOnShow:ba,remove:da,hideProgressBar:o,showSizePopup:V,replace:ca,back:la,setSize:ma,get:na}},a.FE.RegisterCommand("insertVideo",{title:"Insert Video",undo:!1,focus:!0,refreshAfterCallback:!1,popup:!0,callback:function(){this.popups.isVisible("video.insert")?(this.$el.find(".fr-marker").length&&(this.events.disableBlur(),this.selection.restore()),this.popups.hide("video.insert")):this.video.showInsertPopup()},plugin:"video"}),a.FE.DefineIcon("insertVideo",{NAME:"video-camera"}),a.FE.DefineIcon("videoByURL",{NAME:"link"}),a.FE.RegisterCommand("videoByURL",{title:"By URL",undo:!1,focus:!1,toggle:!0,callback:function(){this.video.showLayer("video-by-url")},refresh:function(a){this.video.refreshByURLButton(a)}}),a.FE.DefineIcon("videoEmbed",{NAME:"code"}),a.FE.RegisterCommand("videoEmbed",{title:"Embedded Code",undo:!1,focus:!1,toggle:!0,callback:function(){this.video.showLayer("video-embed")},refresh:function(a){this.video.refreshEmbedButton(a)}}),a.FE.DefineIcon("videoUpload",{NAME:"upload"}),a.FE.RegisterCommand("videoUpload",{title:"Upload Video",undo:!1,focus:!1,toggle:!0,callback:function(){this.video.showLayer("video-upload")},refresh:function(a){this.video.refreshUploadButton(a)}}),a.FE.RegisterCommand("videoInsertByURL",{undo:!0,focus:!0,callback:function(){this.video.insertByURL()}}),a.FE.RegisterCommand("videoInsertEmbed",{undo:!0,focus:!0,callback:function(){this.video.insertEmbed()}}),a.FE.DefineIcon("videoDisplay",{NAME:"star"}),a.FE.RegisterCommand("videoDisplay",{title:"Display",type:"dropdown",options:{inline:"Inline",block:"Break Text"},callback:function(a,b){this.video.display(b)},refresh:function(a){this.opts.videoTextNear||a.addClass("fr-hidden")},refreshOnShow:function(a,b){this.video.refreshDisplayOnShow(a,b)}}),a.FE.DefineIcon("video-align",{NAME:"align-left"}),a.FE.DefineIcon("video-align-left",{NAME:"align-left"}),a.FE.DefineIcon("video-align-right",{NAME:"align-right"}),a.FE.DefineIcon("video-align-center",{NAME:"align-justify"}),a.FE.DefineIcon("videoAlign",{NAME:"align-center"}),a.FE.RegisterCommand("videoAlign",{type:"dropdown",title:"Align",options:{left:"Align Left",center:"None",right:"Align Right"},html:function(){var b='<ul class="fr-dropdown-list" role="presentation">',c=a.FE.COMMANDS.videoAlign.options;for(var d in c)c.hasOwnProperty(d)&&(b+='<li role="presentation"><a class="fr-command fr-title" tabIndex="-1" role="option" data-cmd="videoAlign" data-param1="'+d+'" title="'+this.language.translate(c[d])+'">'+this.icon.create("video-align-"+d)+'<span class="fr-sr-only">'+this.language.translate(c[d])+"</span></a></li>");return b+="</ul>"},
callback:function(a,b){this.video.align(b)},refresh:function(a){this.video.refreshAlign(a)},refreshOnShow:function(a,b){this.video.refreshAlignOnShow(a,b)}}),a.FE.DefineIcon("videoReplace",{NAME:"exchange"}),a.FE.RegisterCommand("videoReplace",{title:"Replace",undo:!1,focus:!1,popup:!0,refreshAfterCallback:!1,callback:function(){this.video.replace()}}),a.FE.DefineIcon("videoRemove",{NAME:"trash"}),a.FE.RegisterCommand("videoRemove",{title:"Remove",callback:function(){this.video.remove()}}),a.FE.DefineIcon("videoSize",{NAME:"arrows-alt"}),a.FE.RegisterCommand("videoSize",{undo:!1,focus:!1,popup:!0,title:"Change Size",callback:function(){this.video.showSizePopup()}}),a.FE.DefineIcon("videoBack",{NAME:"arrow-left"}),a.FE.RegisterCommand("videoBack",{title:"Back",undo:!1,focus:!1,back:!0,callback:function(){this.video.back()},refresh:function(a){this.video.get()||this.opts.toolbarInline?(a.removeClass("fr-hidden"),a.next(".fr-separator").removeClass("fr-hidden")):(a.addClass("fr-hidden"),a.next(".fr-separator").addClass("fr-hidden"))}}),a.FE.RegisterCommand("videoDismissError",{title:"OK",undo:!1,callback:function(){this.video.hideProgressBar(!0)}}),a.FE.RegisterCommand("videoSetSize",{undo:!0,focus:!1,title:"Update",refreshAfterCallback:!1,callback:function(){this.video.setSize()}})});
