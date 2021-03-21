/* global $*/
// document.addEventListener("turbolinks:load", function () {
//   $(".menu-trigger").click(function () {
//     $(this).toggleClass("active");
//     $(this).next().toggleClass("onanimation");
//     $('ul li').hide();
//     $('ul li').each(function(i) {
//       $(this).delay(80 * i).fadeIn(500);
//     });
//     $($(this).next(".menus")).animate(
//       {height: "toggle", opacity: "toggle"},
  
//       "nomal"
//     );
//   });
// });

document.addEventListener("turbolinks:load", function() {
  var height=$("#header").height();
  $(".main").css("margin-top", height);
});

