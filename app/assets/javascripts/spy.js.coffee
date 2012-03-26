progressbar_init = (time, parent) ->
  parent.find(".progress").progressbar({value: 0})
  parent.find(".progress .ui-progressbar-value").addClass("ui-corner-right");
  parent.find(".progress .ui-progressbar-value").css("display","block");
  parent.find(".progress .ui-progressbar-value").animate({width: "100%"}, time*1000, 'linear')
  parent.find(".find form input[type=submit], .check form input[type=submit]").attr('disabled','disabled')

$ ->

  $(".find input[type=submit]").click ->
    form = $(@).parents('div.form')
    status = form.find('.status')
    player_name = form.find(".find input[type=text]").val()
    time = 1
    
    progressbar_init(time, form)
    status.html("Looking for player "+player_name+"...")
    
    setTimeout ->
      $.ajax
        type: "POST"
        url: "/spy/find.json"
        data: {player_name: player_name}
        success: (data) -> 
          status.html("Player "+data.player_name+" found!")
          form.find(".check input").removeAttr('disabled')
          form.find("input[name=player_id]").attr("value", data.id)
          form.find(".check").show()
        error: ->
          status.html("Player "+player_name+"not found :(")
    , time*1000
    
  $(".check input[type=submit]").click ->
    form = $(@).parents('div.form')
    status = form.find('.status')
    player_name = form.find(".find input[type=text]").val()
    player_id = form.find("input[name=player_id]").val()
    time = 1

    progressbar_init(time, form)
    status.html("Checking player "+player_name)
    
    setTimeout ->
      $.ajax
        type: "POST"
        url: "/spy/check.json"
        data: {player_id: player_id}
        success: (data) ->
          status.html("Player "+data.player_name+" available!")
          form.find(".create").show()
          form.find(".create input").removeAttr('disabled')
        error: ->
          status.html("Try again")
    , time*1000
    
  $(".create input[type=submit]").click ->
    form = $(@).parents('div.form')
    status = form.find('.status')
    player_name = form.find(".find input[type=text]").val()
    player_id = form.find("input[name=player_id]").val()
    spy_id = 0
    time = 15
    
    progressbar_init(time, form)
    
    status.html('Gathering data, it can take about 10 minutes...')
    $(@).attr('disabled', 'disabled')
    
    $.ajax
      type: "POST"
      url: "/spy.json"
      data: {player_id: player_id}
      success: (data) ->
        spy_id = data.id
    
    setTimeout ->
      $.ajax
        type: "POST"
        url: "/spy/validate.json"
        data: {spy_id: spy_id}
        success: (data) ->
          status.html("Level: "+data.bank_level)
    , time*1000