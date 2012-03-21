time = 15
count = time 

progressbar_init(time)

$('.create input[type=submit]').attr('disabled', 'disabled')

setTimeout (->
  
  $.post('/spy/validate', { id: "<%= @spy.id %>" })
  
  ), time*1000