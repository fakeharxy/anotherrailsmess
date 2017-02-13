$(document).on('turbolinks:load', function() {
  $(function() {
    var elast;
    $("#body").keypress(function(e) {
      if (e.which == 13 && elast == 13) {
        $.post('/pages/paragraph', {
          body: $(this).val()
            .replace(/\n/g, '<br/>')
        });
        $(this).val("");
        e.preventDefault();
      }
      elast = e.which;
    });
  });

});
