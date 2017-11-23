$( document ).on('turbolinks:load', function() {
  var items = '.menu a.item, .menu .link.item';
  var $menuItem = $(items);

  $("div.holder").css("display", "none");
  $("div.holder").first().css("display", "initial");

  $menuItem.on('click', function() {
    var tmp = $(this).data("items");
    $("div.holder").css("display", "none");
    $("div.holder." + tmp).css("display", "initial");
  });
});
