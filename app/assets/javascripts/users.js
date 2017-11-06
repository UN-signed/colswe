$( document ).on('turbolinks:load', function() {
  var items = '#profile-menu a.item, #profile-menu .link.item';
  var $menuItem = $(items);

  $("div.holder").css("display", "none");
  $("div.holder").first().css("display", "initial");

  $menuItem.on('click', function() {
    // $(items).removeClass('active');
    // $(this).addClass('active');
     var tmp = $(this).data("items");
    $("div.holder").css("display", "none");
    $("div.holder." + tmp).css("display", "initial");
  });

  // console.log('users.js');
});
