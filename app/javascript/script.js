$(document).ready(function () {
  $(".body-temperature-chart").hide();
  $(".body-body_fat_percentage-chart").hide();

  $("#weight-chart").click(function () {
    $(".weight-chart").show();
    $(".body-temperature-chart").hide();
    $(".body-body_fat_percentage-chart").hide();
  });

  $("#body-temperature-chart").click(function () {
    $(".weight-chart").hide();
    $(".body-temperature-chart").show();
    $(".body-body_fat_percentage-chart").hide();
  });

  $("#body-body_fat_percentage-chart").click(function () {
    $(".weight-chart").hide();
    $(".body-temperature-chart").hide();
    $(".body-body_fat_percentage-chart").show();
  });
});
