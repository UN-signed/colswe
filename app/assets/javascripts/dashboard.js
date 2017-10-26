$( document ).on('turbolinks:load', function() {
  $('body').on("click", '.pagination a',function(e){
          e.preventDefault();
          $.getScript(this.href);
          return false;
        });

  var items = '#dashboard-menu a.item, #dashboard-menu .link.item';
  var $menuItem = $(items);

  $("div.holder").css("display", "none");
  $("div.holder").first().css("display", "initial");

  $menuItem.on('click', function() {
    $(items).removeClass('active');
    $(this).addClass('active');
     var tmp = $(this).data("items");
    $("div.holder").css("display", "none");
    $("div.holder." + tmp).css("display", "initial");
  });

  console.log('dashboard.js');
});
