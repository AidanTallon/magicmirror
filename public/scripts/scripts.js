$(document).ready(function() {
  $.get("weather", {}, function(response) {
    $("#weather").html(response);
  });
  $.get("message", {}, function(response) {
    $("#message").html(response);
  });
  $.get("calendar", {}, function(response) {
    $("#calendar").html(response);
  })
})
