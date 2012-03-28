progressbar_init = (time, parent) ->
  parent.find(".progress").progressbar({value: 0})
  parent.find(".progress .ui-progressbar-value").addClass("ui-corner-right");
  parent.find(".progress .ui-progressbar-value").css("display","block");
  parent.find(".progress .ui-progressbar-value").animate({width: "100%"}, time*1000, 'linear')
  parent.find(".find form button, .check form button").attr('disabled','disabled')

create_form = ->
  $('ul.forms').append("
  <li>
    <div class='form'>
      <button class='remove'>Usuń</button>
      <div class='status'></div>
      <div class='progress'></div>
      <input type='hidden' name='player_id' />
      <div class='find'>
        <input type='text' name='player_name' />
        <button>Szukaj</button>
      </div>
      <div class='check'>
        <button class='check'>Sprawdź dostępność</button>
        <div class='reminder'>
          <button class='remind'>Przypomnij, gdy będzie dostępny.</button>
        </div>
      </div>
      <div class='create'>
        <button>Szpieguj gracza</button>
      </div>
  </li>
  ").children('li').fadeIn()
  
  $('.form .remove').click ->
    $(@).parents('li').fadeOut(300, -> $(@).remove())

create_spy = (spy) ->
  $('ul.spies').prepend("
  <li class='new'>
    #{spy.bank_level}
    #{spy.player.player_name}
  </li>
  ").children('li').eq(0).fadeIn()
  
$ ->
  
  for i in [0..5]
    create_form()
     
  $('.add-form').click ->
    create_form()


  $(".find button").click ->
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
    
  $("button.check").click ->
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
          form.find('.reminder').fadeIn()
          status.html("Player not available.")
    , time*1000
  
  $("button.remind").click ->
    form = $(@).parents('div.form')
    status = form.find('.status')
    player_name = form.find(".find input[type=text]").val()
    player_id = form.find("input[name=player_id]").val()
      
    $.ajax
      type: "POST"
      url: "/spy/remind.json"
      data: {player_id: player_id}
      success: (data) ->
        status.html('You will be reminded.')
        form.parents('li').fadeOut(3000, -> $(@).remove())
    
  $(".create button").click ->
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
          form.parents('li').fadeOut(3000, -> $(@).remove())
          create_spy(data)
    , time*1000
    
  $('ul.spies li .refresh').click ->
    spy_id = $(@).parents('li').find('input[name=spy_id]').val()
    li = $(@).parents('li')
    $.ajax
      type: "POST"
      url: "/spy/validate.json"
      data: {spy_id: spy_id}
      success: (data) ->
        li.remove()
        create_spy(data).remove()
      error: ->
        li.find(".status").html("Isn't ready yet, please wait.")