/* Flot plugin for automatically redrawing plots as the placeholder resizes.

Copyright (c) 2007-2014 IOLA and Ole Laursen.
Licensed under the MIT license.

It works by listening for changes on the placeholder div (through the jQuery
resize event plugin) - if the size changes, it will redraw the plot.

There are no options. If you need to disable the plugin for some plots, you
can just fix the size of their placeholders.

*/
/* Inline dependency:
 * jQuery resize event - v1.1 - 3/14/2010
 * http://benalman.com/projects/jquery-resize-plugin/
 *
 * Copyright (c) 2010 "Cowboy" Ben Alman
 * Dual licensed under the MIT and GPL licenses.
 * http://benalman.com/about/license/
 */
!function(e,t,i){"$:nomunge";function n(i){!0===s&&(s=i||1);for(var u=r.length-1;u>=0;u--){var c=e(r[u]);if(c[0]==t||c.is(":visible")){var d=c.width(),f=c.height(),v=c.data(m);!v||d===v.w&&f===v.h||(c.trigger(h,[v.w=d,v.h=f]),s=i||!0)}else(v=c.data(m)).w=0,v.h=0}null!==a&&(s&&(null==i||i-s<1e3)?a=t.requestAnimationFrame(n):(a=setTimeout(n,o[l]),s=!1))}var a,r=[],o=e.resize=e.extend(e.resize,{}),s=!1,u="setTimeout",h="resize",m=h+"-special-event",l="pendingDelay",c="activeDelay",d="throttleWindow";o[l]=200,o[c]=20,o[d]=!0,e.event.special[h]={setup:function(){if(!o[d]&&this[u])return!1;var t=e(this);r.push(this),t.data(m,{w:t.width(),h:t.height()}),1===r.length&&(a=i,n())},teardown:function(){if(!o[d]&&this[u])return!1;for(var t=e(this),i=r.length-1;i>=0;i--)if(r[i]==this){r.splice(i,1);break}t.removeData(m),r.length||(s?cancelAnimationFrame(a):clearTimeout(a),a=null)},add:function(t){function n(t,n,r){var o=e(this),s=o.data(m)||{};s.w=n!==i?n:o.width(),s.h=r!==i?r:o.height(),a.apply(this,arguments)}return!(!o[d]&&this[u])&&(e.isFunction(t)?(a=t,n):(a=t.handler,void(t.handler=n)));var a}},t.requestAnimationFrame||(t.requestAnimationFrame=t.webkitRequestAnimationFrame||t.mozRequestAnimationFrame||t.oRequestAnimationFrame||t.msRequestAnimationFrame||function(e){return t.setTimeout(function(){e((new Date).getTime())},o[c])}),t.cancelAnimationFrame||(t.cancelAnimationFrame=t.webkitCancelRequestAnimationFrame||t.mozCancelRequestAnimationFrame||t.oCancelRequestAnimationFrame||t.msCancelRequestAnimationFrame||clearTimeout)}(jQuery,this),function(){function e(e){function t(){var t=e.getPlaceholder();0!=t.width()&&0!=t.height()&&(e.resize(),e.setupGrid(),e.draw())}function i(e){e.getPlaceholder().resize(t)}function n(e){e.getPlaceholder().unbind("resize",t)}e.hooks.bindEvents.push(i),e.hooks.shutdown.push(n)}var t={};jQuery.plot.plugins.push({init:e,options:t,name:"resize",version:"1.0"})}();