$(function(){
  $(".modal-open").click( function(){
    $( ".modal-content" ).fadeIn( "slow" );
  });
  $( ".modal-close" ).unbind().click( function(){
    $( ".modal-content" ).fadeOut( "slow");
  });
});
