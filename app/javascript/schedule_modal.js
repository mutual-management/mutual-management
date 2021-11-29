$(function(){
  $(".schedule-modal-open").click( function(){
    $( ".schedule-modal-content" ).fadeIn( "slow" );
  });
  $( ".schedule-modal-close" ).unbind().click( function(){
    $( ".schedule-modal-content" ).fadeOut( "slow");
  });
});
