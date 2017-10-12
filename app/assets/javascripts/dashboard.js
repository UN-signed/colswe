menu = {};

$( document ).on('turbolinks:load', function() {
  var items = '.ui.menu a.item, .ui.menu .link.item';
  var $menuItem = $(items);

  $menuItem.on('click', function() {
    $(items).removeClass('active');
    $(this).addClass('active');
  });
  console.log('iusahiuas');
});
