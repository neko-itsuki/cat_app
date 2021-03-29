/* global $*/
document.addEventListener("turbolinks:load", function() {
  var height=$("#header").height();
  $(".main").css("margin-top", height);
});

