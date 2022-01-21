import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin from '@fullcalendar/interaction';

const calendarEl = document.getElementById("calendar");

const calendar = new Calendar(calendarEl, {
  plugins: [dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin],
  timeZone: "Asia/Tokyo",
  firstDay: 0,
  businessHours: false,
  editable: true,
  headerToolbar: {
    start: 'prev',
    center: 'title',
    end: 'today dayGridMonth timeGridWeek listMonth next'
  },
  events: '/calendar.json',
  dateClick: function(targetDate) {
    focusOnDate(targetDate);
  },
});

calendar.render();

$(".clender-reload").on('click', function(){
  setTimeout(function(){
    calendar.refetchEvents();
  },500);
});

// 前月表示
$('.fc-prev-button').click(function() {
  var prevDate = getFormattedDate(calendar.getDate());
  refreshCalendar(prevDate);
});

// 次月表示
$('.fc-next-button').click(function() {
  var nextDate = getFormattedDate(calendar.getDate());
  refreshCalendar(nextDate);
});

// 押下した日付の項目と支出の表示
function focusOnDate(date) {
  // フォーカス用の枠線を引く
  $(".target-date").removeClass("target-date");
  date.dayEl.classList.add("target-date");
  $(".daily-stacks-button").removeClass("hidden");

  // 結果と予定を取得し画面下部に表示
  const dateVal = date.dateStr;
  $.ajax({
    url: `/calendar/${dateVal}`,
    type: 'GET',
    dataType: 'html',
    async: true,
    data: {
      target_date: dateVal
    },
  }).done(function (res) {
    $(".daily-schedules").html(res);
  });
};

// その月のカレンダーと予定を再表示
function refreshCalendar(targetDate) {
  $.ajax({
    url: `/calendar`,
    type: 'GET',
    dataType: 'json',
    data: { target_date: targetDate },
  }).done(function (res) {
    calendar.removeAllEvents();
    res.forEach(x => calendar.addEvent(x));
  }).catch(function (error) {
    console.log(error);
  });
}

// yyyymmddの文字列を返す
function getFormattedDate(date) {
  var dateFormat = "YYYY/MM/DD";
  dateFormat = dateFormat.replace(/YYYY/, date.getFullYear());
  dateFormat = dateFormat.replace(/MM/, date.getMonth() + 1);
  dateFormat = dateFormat.replace(/DD/, date.getDate());
  return dateFormat.toString();
}