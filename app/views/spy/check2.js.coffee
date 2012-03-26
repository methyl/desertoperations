time = 1
count = time

progressbar_init(time)

$(".status").html("Checking for spying availability...")

setTimeout (->

  if <%= @player.available? %>
    $(".status").html("Player available for spying!")
    $(".create").show()
    $(".create input").removeAttr('disabled')
  else
    $(".status").html('Player not available for spying, try again later.')
      
  $("find form input[type=submit]").removeAttr('disabled')

  ), time*1000

