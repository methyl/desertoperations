# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('h4 a').click -> 
    $('.chart').css('display','none')
    $(this).parent().parent().find('.chart').toggle()