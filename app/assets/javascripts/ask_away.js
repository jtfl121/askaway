window.setTimeout(function() {
  $(".flashes").fadeTo(500, 0).slideUp(500, function()
    {
      $(this).remove();
    });
}, 1000);


$('.tags').selectize({
    plugins: ['remove_button'],
    delimiter: ',',
    persist: false,
    create: function(input) {
        return {
            value: input,
            text: input
        }
    }
});