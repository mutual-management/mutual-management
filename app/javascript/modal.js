$(function(){
  $(".stack-modal-open").click( function(){
    $( ".stack-modal-content" ).fadeIn( "slow" );
  });
  $(".expense-modal-open").click( function(){
    $( ".expense-modal-content" ).fadeIn( "slow" );
  });
  $( ".stack-modal-close" ).unbind().click( function(){
    $( ".stack-modal-content" ).fadeOut( "slow");
  });
  $( ".expense-modal-close" ).unbind().click( function(){
    $( ".expense-modal-content" ).fadeOut( "slow");
  });
});
