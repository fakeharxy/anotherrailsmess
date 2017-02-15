$(document).on('turbolinks:load', function() {
  if (document.getElementById("chatbox") !== null) {
    $('html, body').animate({
      scrollTop: $(document).height()
    }, 1000);
    $('.type').focus();
  }
});
