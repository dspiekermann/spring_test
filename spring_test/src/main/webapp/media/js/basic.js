function loading_show() {
	document.getElementById('dloading').style.visibility = "visible";
}

function loading_hide() {
	document.getElementById('dloading').style.visibility = "hidden";
}

/* png fix */ 

var blank = new Image();
blank.src = '../images/blank.gif';

/* ready function */

$(document).ready(function() {
	$("button").button();
	var badBrowser = (/MSIE ((5\.5)|6)/.test(navigator.userAgent) && navigator.platform == "Win32");
	if (badBrowser) {
    // get all pngs on page
    $('img[src$=.png]').each(function() {
    	if (!this.complete) {
    		this.onload = function() { fixPng(this) };
        } else {
        	fixPng(this);
      }
    });
  }
});

function fixPng(png) {
  // get src
  var src = png.src;
  // set width and height
  if (!png.style.width) { png.style.width = $(png).width(); }
  if (!png.style.height) { png.style.height = $(png).height(); }
  // replace by blank image
  png.onload = function() { };
  png.src = blank.src;
  // set filter (display original image)
  png.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + src + "',sizingMethod='scale')";
}