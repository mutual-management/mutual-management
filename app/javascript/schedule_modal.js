$(function(){
  $(".schedule-modal-open").click( function(){

    // 選択した日付から予定日のデフォルト値を設定
    var targetDate = $(".target-date").data("date");
    var today = $(".fc-day-today").data("date");
    // 未選択の場合現在日時を設定
    $("#schedule_date").val(targetDate === undefined ? today : targetDate);

    // 現在時刻から時分のデフォルト値を設定
    var now = new Date();
    $("#schedule_time_4i").val(now.getHours());
    $("#schedule_time_5i").val(now.getMinutes());

    $( ".schedule-modal-content" ).fadeIn( "slow" );
  });
  $( ".schedule-modal-close" ).unbind().click( function(){
    $( ".schedule-modal-content" ).fadeOut( "slow");
  });
});
