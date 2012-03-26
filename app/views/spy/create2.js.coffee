time = 15
count = time 

$('.status').html('Gathering data, it can take about 10 minutes...')

progressbar_init(time)

$('.create input[type=submit]').attr('disabled', 'disabled')

setTimeout (->
  $('.status').html('Just a second...')
  $.post('/spy/validate', { id: "<%= @spy.id %>" })
  
  ), time*1000