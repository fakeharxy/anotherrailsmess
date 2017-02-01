$(document).on('turbolinks:load', function() {
  $('html, body').animate({
    scrollTop: $(document).height()
  }, 1000);
  $('.type').focus();
});
