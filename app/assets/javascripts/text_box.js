$(document).on('turbolinks:load', function() {
  $(function() {
    var elast;
    $("#body").keypress(function(e) {
      if (e.which == 13 && elast == 13) {
        $(".chatbox").before("<div class='panel panel-borderless'> <div class='para panel-body' id='para'> <button class='important btn-primary glyphicon glyphicon-exclamation-sign btn-xs pull-right'> </button> <button class='todo btn-primary glyphicon glyphicon-pushpin btn-xs pull-right'> </button>" +
          $(this).val().replace(/\n/g, '<br/>') + "</div></div>");
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
