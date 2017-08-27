// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function () {

  $("#project_form").hide();


  $("#add_project_form").on('click', function () {
    $("#project_form").show();
    $("#add_project_form").hide();
    return false;
  });

  $(".add_task_form").on('click', function () {
    $("#task_form").show();
    $("#add_task_form").hide();
    return false;
  });

  $(".project_row").hover(
      function () {
        $(this).find("#ellipsis").removeClass("hide");
      },
      function () {
        $(this).find("#ellipsis").addClass("hide");
      }
  );

  $(".task_row").hover(
      function () {
        $(this).find("#ellipsis").removeClass("hide");
      },
      function () {
        $(this).find("#ellipsis").addClass("hide");
      }
  );

  $("td>.fa").hover(
      function () {
        $(this).find(".menu").removeClass("hide");
      },
      function () {
        $(this).find(".menu").addClass("hide");
      }
  );

});
