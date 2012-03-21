root = exports ? this

root.progressbar_init = (time) ->
  $(".progress").progressbar({value: 0})
  $(".progress .ui-progressbar-value").addClass("ui-corner-right");
  $(".progress .ui-progressbar-value").css("display","block");
  $(".progress .ui-progressbar-value").animate({width: "100%"}, time*1000, 'linear')
  $("find form input[type=submit], .check form input[type=submit]").attr('disabled','disabled')
