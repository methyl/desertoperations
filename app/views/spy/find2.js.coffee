time = 1
count = time 

progressbar_init(time)

$(".check, .create").hide()
$(".status").html("Looking for player <%= params[:player_name] %>")

setTimeout (->

  if <%= not @player.nil? %>
    $(".status").html("<%= 'Player found!' %>")
    $(".check form input[type=submit]").removeAttr('disabled')
    $("input[name=player_name]").attr("value","<%= @player.player_name if @player %>")
    $(".check").show()
  else
    $(".status").html('no such player, try another')
    
  $("find form input[type=submit]").removeAttr('disabled')

  ), time*1000