$( document ).on('turbolinks:load', function() {
  var items = '#profile-menu a.item, #profile-menu .link.item';
  var $menuItem = $(items);

  //$("div.holder").css("display", "none");
  //a$("div.holder.basic-info").css("display", "initial");
  $('body').on("click", '.pagination a',function(e){
          e.preventDefault();
          $.getScript(this.href);
          return false;
        });

  $('body').on('click', '.menu a',function(e) {
    e.preventDefault();
    $(".menu a").removeClass('active');
    $(this).addClass('active');
    $.getScript(this.href);
    return false;
  });

  console.log('dashboard.js');
});
