

$( document ).on('turbolinks:load', function() {
  var items = '.ui.menu a.item, .ui.menu .link.item';
  var $menuItem = $(items);

  $menuItem.on('click', function() {
    $(items).removeClass('active');
    $(this).addClass('active');
     var tmp = $(this).data("items");
    $("div.holder").css("display", "none");
    $("div.holder." + tmp).css("display", "initial");
  });


  console.log('dashboard.js');
});
