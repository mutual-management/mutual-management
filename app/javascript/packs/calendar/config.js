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
  }
});

calendar.render();

$(".clender-reload").on('click', function(){
  setTimeout(function(){
    calendar.refetchEvents();
  },500);
});

$('.fc-prev-button span').click(function() {
  alert('prev is clicked, do something');
});

$('.fc-next-button span').click(function() {
  alert('nextis clicked, do something');
});

function focusOnDate(date) {
  $(".target-date").removeClass("target-date");
  date.dayEl.classList.add("target-date");
  // TODO 自身のユーザの時だけ
  $(".daily-stacks-button").removeClass("hidden");
  console.log("日付クリック");

  const dateVal = date.dateStr
  $.ajax({
    url: `/calendar/${dateVal}`,
    type: 'GET',
    dataType: 'html',
    async: true,
    data: {
      targetDate: dateVal
    },
  }).done(function (res) {
    console.log(res);
  });
};