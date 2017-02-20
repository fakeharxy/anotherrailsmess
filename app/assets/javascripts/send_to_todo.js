var yesterday = new Date((new Date()).valueOf() - 1000 * 60 * 60 * 24);

$(document).on('click', '.todo', function(evt) {
  evt.stopPropagation();
  evt.preventDefault();
  var paraId = $(this).index('.todo') + 1;
  $(this).pickadate({
    disable: [{
      from: [0, 0, 0],
      to: yesterday
    }],
    onSet: function(res) {
      $.post('/pages/paragraph/todo/' + paraId, {
        date: new Date(res.select),
      })
    }
  })
})
