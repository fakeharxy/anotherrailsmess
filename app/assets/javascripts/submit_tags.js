$(document).on('click', '.tag_submit', function() {
  var paraId = parseInt($(this).attr('id'));
  console.log($(this).closest('.tag-field').find('.form-control').val());
  $.post('/pages/paragraph/tags/' + paraId, {
    tags: $(this).closest('.tag-field').find('.form-control').val()
  })

  $(this).closest('.tag-field').toggleClass('hidden')

})
