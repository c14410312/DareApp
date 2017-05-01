$ ->
  $('#slider').slider
    value: 1
    min: 1
    max: 100
    step: 1
    slide: (event, ui) ->
      $('#dare_room_coins').val ui.value + ' coins'
      return
  $('#dare_room_coins').val $('#slider').slider('value') + ' coins'
  return