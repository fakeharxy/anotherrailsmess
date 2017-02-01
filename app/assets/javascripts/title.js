$(document).on('turbolinks:load', function() {
  $(function() {
    $("#title").keypress(function(e) {
      if (e.which == 13) {
        $.post('/pages/add_title', {
          title: $(this).text()
        });
        $(this).blur();
        e.preventDefault();
      }
    });
  });
});
