$( document ).on('turbolinks:load', function() {
  var items = '#dashboard-menu a.item, #dashboard-menu .link.item';
  var $menuItem = $(items);

  $menuItem.on('click', function() {
    $(items).removeClass('active');
    $(this).addClass('active');
     var tmp = $(this).data("items");
    $("div.holder").css("display", "none");
    $("div.holder." + tmp).css("display", "initial");
  });


  // $('#demo').pagination({
  //   dataSource: [1, 2, 3, 4, 5, 6, 7, ... , 100],
  //   pageSize: 5,
  //   showPrevious: false,
  //   showNext: false,
  //   callback: function(data, pagination) {
  //       // template method of yourself
  //       var html = template(data);
  //       dataContainer.html(html);
  //   }
  // })

  console.log('dashboard.js');
});
