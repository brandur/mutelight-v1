/*
 * Mutelight.org
 */

$(document).ready(function() {  
    var expanded = false;
    $("#header").click(function() {
        if (!expanded) {
            $('#header,#radial').animate({
                height: '+=215'
            }, 'slow', 'easeOutBounce', function() {
                expanded = true;
            });
        } else {
            window.location = "http://mutelight.org/";
        }
    });
}); 
