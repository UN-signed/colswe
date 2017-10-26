$( document ).on('turbolinks:load', function() {
  var items = '#profile-menu a.item, #profile-menu .link.item';
  var $menuItem = $(items);

  //$("div.holder").css("display", "none");
  //a$("div.holder.basic-info").css("display", "initial");
  $("body").on("click", '.pagination a', function(e){
          e.preventDefault();
          $.getScript(this.href);
          return false;
        });

  $menuItem.on('click', function() {
    $(items).removeClass('active');
    $(this).addClass('active');
     var tmp = $(this).data("items");
    $("div.holder").css("display", "none");
    $("div.holder." + tmp).css("display", "initial");
  });

  console.log('dashboard.js');
});
