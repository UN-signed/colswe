menu = {};

// ready event
menu.ready = function() {
  var items = '.ui.menu a.item, .ui.menu .link.item';
  var $menuItem = $(items);

  $menuItem.on('click', function() {
    $(items).removeClass('active');
    $(this).addClass('active');
  });
};

$(document).ready(menu.ready);
