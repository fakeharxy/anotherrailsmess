$(document).on('click', '.para', function() {

  $(this).siblings('.tag-field').removeClass('hidden');

  $(this).siblings('.tag-field').find('.form-control').focus();

  $(this).siblings('.tag-field').find('.form-control').blur(function() {
    $(this).closest('.tag-field').addClass('hidden');
  });
})
