//= require froala_editor.min.js
//= require languages/es.js

// Include other plugins
//= require plugins/align.min.js
//= require plugins/char_counter.min.js
//= require plugins/code_beautifier.min.js
//= require plugins/colors.min.js
//= require plugins/emoticons.min.js
//= require plugins/entities.min.js
//= require plugins/file.min.js
//= require plugins/font_family.min.js
//= require plugins/font_size.min.js
//= require plugins/fullscreen.min.js
//= require plugins/help.min.js
//= require plugins/image.min.js
//= require plugins/image_manager.min.js
//= require plugins/inline_style.min.js
//= require plugins/line_breaker.min.js
//= require plugins/link.min.js
//= require plugins/lists.min.js
//= require plugins/paragraph_format.min.js
//= require plugins/paragraph_style.min.js
//= require plugins/print.min.js
//= require plugins/quick_insert.min.js
//= require plugins/quote.min.js
//= require plugins/save.min.js
//= require plugins/table.min.js
//= require plugins/special_characters.min.js
//= require plugins/url.min.js


$( document ).on('turbolinks:load', function() {
    // Activate Froala Editor (articles editor)
    $('#wysiwyg').froalaEditor({
      inlineMode: false,
      heightMin: '200px',
      language: 'es'
    })

    // Activate menu items
    var items = '.ui.menu label.item';
    var $menuItem = $(items);

    $("div.uploader").css("display", "none");
    $("div.uploader").first().css("display", "initial");

    $menuItem.on('click', function() {
      var name = "#" + $(this).attr('for');
      var tmp = $(name).attr('value');
      $(items).removeClass('active');
      $(this).addClass('active');
      $("div.uploader").css("display", "none");
      $("div.uploader." + tmp).css("display", "initial");
    });
});
