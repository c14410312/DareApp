$( function() {
    $( "#slider" ).slider({
      value:1,
      min: 1,
      max: 100,
      step: 1,
      slide: function( event, ui ) {
        $( "#dare_room_coins" ).val( "$" + ui.value );
      }
    });
    $( "#dare_room_coins" ).val( "$" + $( "#slider" ).slider( "value" ) );
  } );