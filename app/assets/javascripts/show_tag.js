$(document).on('click', '.para', function() {

  $(this).siblings('.tag-field').toggleClass('hidden');
  
  $(this).siblings('.tag-field').find('.form-control').focus();

})
