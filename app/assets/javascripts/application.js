// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
//stub dashboard.js
//stub users.js
//= require_tree .
//= require semantic_ui/semantic_ui

$( document ).on('turbolinks:load', function() {
  $("#avatar-upload").change('turbolinks:load', function(){
    readURL(this);
  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('.ui.dropdown').dropdown();
});

$(function () {
  $(document).scroll(function () {
    var $nav = $("#main-menu");
    $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
  });
});
