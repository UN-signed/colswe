$( document ).on('turbolinks:load', function() {
  $('body').on("click", '.pagination a',function(e){
    e.preventDefault();
    $.getScript(this.href);
    return false;
  });

  $('body').on("click", '#dashboard-menu a',function(e){
    e.preventDefault();
    $.getScript(this.href);
    return false;
  });

  var items = '.ui.menu a.item, .ui.menu .link.item';
  var $menuItem = $(items);

  $menuItem.on('click', function() {
    $(items).removeClass('active');
    $(this).addClass('active');
  });

  // console.log('dashboard.js');
});
